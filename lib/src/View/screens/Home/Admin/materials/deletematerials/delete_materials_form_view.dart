import 'dart:convert';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../controler/ClientController/client_controller.dart';
import '../../../../../../controler/GetDate/get_date.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_header.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_item.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../materials_text.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/local.dart';
import '../materialsviewdetails/materials_view_details.dart';

class MaterialsFormDeleteView extends StatefulWidget {
  const MaterialsFormDeleteView({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<MaterialsFormDeleteView> createState() => _MaterialsFormDeleteView();
}

class _MaterialsFormDeleteView extends State<MaterialsFormDeleteView> {
  Map<String, dynamic>? data;
  final materialController = TextEditingController();
  final variantController = TextEditingController();
  final quantityValuesController = TextEditingController();
  final quantityMeasurementController = TextEditingController();
  final hSNCodeController = TextEditingController();
  final cGstController = TextEditingController();
  final sGstController = TextEditingController();
  final iGstController = TextEditingController();
  final createBy = TextEditingController();
  final createOn = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }
   bool isLoading =true;
final formKey = GlobalKey<FormState>();
  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getMaterial}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
         isLoading =false;
        setState(() {
          data = jsonDecode(response.body);
          print(data);
          if (data != null) {
            materialController.text = data!["co_material_name"]?.toString() ?? "";
            variantController.text = data!["material_variant"]?.toString() ?? "";
            quantityValuesController.text = data!["quantity_values"]?.toString() ?? "";
            quantityMeasurementController.text = data!["quantity_measurement"]?.toString() ?? "";
            hSNCodeController.text = data!["HSN_code"]?.toString() ?? "";
            cGstController.text = data!["CGST"]?.toString() ?? "";
            sGstController.text = data!["SGST"]?.toString() ?? "";
            iGstController.text = data!["IGST"]?.toString() ?? "";
            createBy.text = data!["created_by"]?.toString() ?? "";
            createOn.text = Date.getDate(data!["createdAt"])?.toString() ?? "";
          }
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body:isLoading?Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const DetailsText(enterDetails: deleteMaterialsDetailsText),
              MaterialsViewDetails(
                enabled: false,
                isEditing: false,
                materialController: materialController,
                variantController: variantController,
                quantityMeasurementController: quantityMeasurementController,
                quantityValuesController: quantityValuesController,
                cGstController: cGstController,
                hSNCodeController: hSNCodeController,
                iGstController: iGstController,
                sGstController: sGstController,
              ),
              CreateByCreatedOn(
                createByController: createBy,
                createOnController: createOn,
                enabled: false,
              ),
              formSizebox15,
              const deleteTableHeader(
                deleteDate: deleteDate,
                deleteReason: deleteReason,
                deleteperson: deletePerson,
              ),
              DeleteDataItem(
                deletepersonName: data?["deleted_by"]?.toString() ?? "",
                deleteReason: data?["deletion_reason"]?.toString() ?? "",
                deletedDate: Date.getDate(data?["deleted_on"])?.toString() ?? "",
              ),
              bottomHeight,
            ],
          ),
        ),
      ),
      bottomSheet: const BottomSheetLogo(),
    );
  }
}

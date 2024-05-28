// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import '../../../../../../controler/GetDate/get_date.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_header.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_item.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../labor_category_text.dart';
import '/src/View/screens/Home/Admin/laborcategory/laborcategoryviewdetails/labor_category_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../controler/ClientController/client_controller.dart';
import '../../../../../../controler/common_controller.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';

class LaborCategoryFormDeleteView extends StatefulWidget {
  const LaborCategoryFormDeleteView({Key? key, required this.id})
      : super(key: key);
  final id;

  @override
  State<LaborCategoryFormDeleteView> createState() =>
      _LaborCategoryFormDeleteView();
}

class _LaborCategoryFormDeleteView
    extends State<LaborCategoryFormDeleteView> {
  Map<String, dynamic>? data;
  var updatedData;
  CommonController commonController = CommonController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("$ip/Admin/get-client/${widget.id}"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            var controllers = {
              "co_client_name": control.clientName,
              "off_address_line1": control.addressline1,
            };

            controllers.forEach((key, controller) {
              controller.text = data![key]?.toString() ?? '';
            });
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
    final formKey = GlobalKey<FormState>();
    final TextEditingController laborCategoryController =
        TextEditingController();
    final TextEditingController categorydistributionController =
        TextEditingController();
    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
               DetailsText(enterDetails: deleteLaborCategoryDetailsText),
              LaborCategoryViewDetails(
                  enabled: false,
                  laborCategoryController: laborCategoryController,
                  categorydistributionController:
                      categorydistributionController),
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
                deletepersonName: 'Admin 1',
                deleteReason: () {
                  if (data == null) {
                    return "";
                  } else {
                    return data!["deletion_reason"];
                  }
                }(),
                deletedDate: () {
                  if (data == null) {
                    return "";
                  } else {
                    return Date.getDate(data!["deleted_At"]);
                  }
                }(),
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

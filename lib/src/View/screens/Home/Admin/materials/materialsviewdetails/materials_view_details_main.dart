// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:cmssms/src/Model/api/api_model.dart';

import '../../../../../../controler/GetDate/get_date.dart';
import '../materialsdataview/materials_data_view.dart';
import '/src/View/screens/Home/Admin/materials/materialsviewdetails/materials_view_details.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../controler/common_controller.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/Long_SizeButton.dart';
import '../../../../../widgets/CommonUsageForm/AlartBox/alart_popup.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_data_item.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_header.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../../../../widgets/CommonUsageForm/view_details_text.dart';
import '../materials_text.dart';

class MaterialsViewDetailsMain extends StatefulWidget {
  const MaterialsViewDetailsMain({Key? key, required this.id})
      : super(key: key);
  final id;

  @override
  State<MaterialsViewDetailsMain> createState() => _MaterialsViewDetailsMain();
}

class _MaterialsViewDetailsMain extends State<MaterialsViewDetailsMain> {
  Map<String, dynamic>? data;
  var updatedData;
  CommonController commonController = CommonController();

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchUpdateData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getMaterial}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            materialController.text = data!["co_material_name"] ?? "";
            variantController.text = data!["material_variant"] ?? "";
            quantityValuesController.text = data!["quantity_values"] ?? "";
            quantityMeasurementController.text =
                data!["quantity_measurement"] ?? "";
            hSNCodeController.text = data!["HSN_code"] ?? "";
            cGstController.text = data!["CGST"] ?? "";
            sGstController.text = data!["SGST"] ?? "";
            iGstController.text = data!["IGST"] ?? "";
            createBy.text = data!["created_by"] ?? "";
            createOn.text = Date.getDate(data!["createdAt"]) ?? "";
          }
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> fetchUpdateData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getMaterialUpdateHistory}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          var updateData = [];

          var data = jsonDecode(response.body);

          for (var eachData in data) {
            if (eachData["co_material_id"].toString() == widget.id) {
              updateData.add(eachData);
            }
          }
          updatedData = updateData;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  bool isEditing = false;
  bool isEnabled = false;
 
  void updateData(data) async {
    try {
      print("before update");

      var response = await http.patch(
        Uri.parse('${ApiEndpoints.updateMaterial}/${widget.id}'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MaterialsDataView()));
      }
    } catch (e) {
      print("update failed $e");
    }
  }

  void materialsCheckUpdatingValue() {
    var oldData = data;
    if (oldData != null) {
      Map<String, dynamic> updatedData = {};

      var controllers = {
        "co_material_name": materialController.text,
        "material_variant": variantController.text,
        "quantity_values": quantityValuesController.text,
        "quantity_measurement": quantityMeasurementController.text,
        "HSN_code": hSNCodeController.text,
        "CGST": cGstController.text,
        "SGST": sGstController.text,
        "IGST": iGstController.text
      };
      controllers.forEach((key, value) {
        // ignore: unnecessary_null_comparison
        if (value != null &&
            value.isNotEmpty &&
            (oldData[key] ?? '') != value) {
          updatedData[key] = value;
          print(updatedData);
        }
      });
      if (updatedData.isNotEmpty) {
        print("Updated Data: $updatedData");
        updateData(updatedData);
      } else {
        print("No changes detected.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ViewDetailsText(
                viewClientDetailsTextt: isEditing
                    ? editMaterialsDetailsText
                    : viewMaterialsDetailsText,
                editOnPress: () {
                  setState(() {
                    isEditing = !isEditing;
                    isEnabled = !isEnabled;
                  });
                },
                deleteOnPress: AlartMessage(
                  api: '${ApiEndpoints.deleteMaterial}/${widget.id}',
                  onPress: const MaterialsDataView(),
                ),
              ),
              MaterialsViewDetails(
                enabled: isEnabled,
                isEditing: isEditing,
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
              LongButton(
                formKey: formKey,
                text: update,
                onPressed: () {
                  materialsCheckUpdatingValue();
                },
                isEnabled: isEnabled,
              ),
              if (updatedData != null)
                if (updatedData.length != 0)
                  Column(
                    children: [
                      const UpdateHeader(
                        updatedByHeader: updateByHeaderText,
                        newValueHeader: newvalueHeaderText,
                        oldValueHeader: oldvlueHeaderText,
                      ),
                      ...updatedData.map((eachItem) {
                        return updatedDataItem(
                          eachItem["updated_old_value"],
                          eachItem["updated_new_value"],
                          eachItem["updated_by"].toString(),
                        );
                      }).toList(),
                      bottomHeight,
                    ],
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

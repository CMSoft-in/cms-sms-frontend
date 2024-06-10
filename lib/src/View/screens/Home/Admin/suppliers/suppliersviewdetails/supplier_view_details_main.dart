// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:cmssms/src/Model/utility/supplier/supplier_text_const.dart';
import 'package:cmssms/src/View/screens/Home/Admin/suppliers/suppliersviewdetails/supplier_view_details_four.dart';
import 'package:cmssms/src/View/screens/Home/Admin/suppliers/suppliersviewdetails/supplier_view_details_one.dart';
import 'package:cmssms/src/View/screens/Home/Admin/suppliers/suppliersviewdetails/supplier_view_details_three.dart';
import 'package:cmssms/src/View/screens/Home/Admin/suppliers/suppliersviewdetails/supplier_view_details_two.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../controler/GetDate/get_date.dart';
import '../../../../../../controler/supplierController/supplier_controller.dart';
import '../suppliersdataview/supplier_data_view.dart';
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

class SupplierViewDetailsMain extends StatefulWidget {
  const SupplierViewDetailsMain({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<SupplierViewDetailsMain> createState() =>
      _SupplierViewDetailsMainState();
}

class _SupplierViewDetailsMainState extends State<SupplierViewDetailsMain> {
  Map<String, dynamic>? data;
  var updatedData;
  CommonController commonController = CommonController();
  List<dynamic> comaterialCategoryId = [];
  final formKey = GlobalKey<FormState>();
  SupplierTextEditingController supplierTextEditingController =
      SupplierTextEditingController();
  int? coSupplierCategoryId;
  void changeValue(int v) {
    setState(() {
      coSupplierCategoryId = v;
    });
  }

  void changeMaterialValue(List<dynamic> v) {
    setState(() {
      comaterialCategoryId = v;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchUpdateData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getSupplier}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            supplierNameController.text = data!["co_supplier_name"] ?? "";
            addressline1Controller.text = data!["off_address_line1"] ?? "";
            addressline2Controller.text = data!["off_address_line2"] ?? "";
            cityController.text = data!["off_town"] ?? "";
            stateController.text = data!["off_state"] ?? "";
            pincodeController.text = data!["off_pincode"].toString() ?? "";
            gstController.text = data!["gst_no"] == null ? "":  data!["gst_no"].toString();
            primaryNameController.text = data!["primary_contact_name"] ?? "";
            primaryPhoneNumberController.text =
                data!["primary_contact_no"] ?? "";
            primaryEmailController.text = data!["primary_contact_email"] ?? "";
            primaryWhatsappController.text =
                data!["primary_contact_whatsapp"] ?? "";
            timeLineController.text =
                data!["payment_timeline"] == null ? "" : data!["payment_timeline"].toString();
            firstNameController.text = data!["owner_first_name"] ?? "";
            lastNameController.text = data!["owner_last_name"] ?? "";
            phoneNumberController.text = data!["mobile_no"] ?? "";
            secondaryNameController.text =
                data!["secondary_contact_name"] ?? "";
            secondaryPhoneNumberController.text =
                data!["secondary_contact_no"] ?? "";
            secondaryEmailController.text =
                data!["secondary_contact_email"] ?? "";
            secondaryWhatsappController.text =
                data!["secondary_contact_whatsapp"] ?? "";
            createBy.text = data!["created_by"] ?? "";
            createOn.text = Date.getDate(data!["createdAt"]) ?? "";
            supplierCategoryController.text =
                data!["CoSupplierCategory"]["co_supplier_category_name"] ?? "";
            //  materialsSuppliedController.text=data!["co_material_id"] ?? "";
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
        Uri.parse('${ApiEndpoints.getSupplierUpdateHistory}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          var updateData = [];

          var data = jsonDecode(response.body);

          for (var eachData in data) {
            if (eachData["co_supplier_id"].toString() == widget.id) {
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

      var response = await http.post(
        Uri.parse('${ApiEndpoints.updateSupplier}/${widget.id}'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SupplierDataView()));
      }
    } catch (e) {
      print("update failed $e");
    }
  }

  void supplierCheckUpdatingValue() {
    if (data != null) {
      Map<String, dynamic> updatedData = {};

      var controllers = {};
      controllers.forEach((key, value) {
        if (data![key] != null &&
            data![key].toString() != value &&
            value.isNotEmpty) {
          updatedData[key] = value;
        }
      });

      if (updatedData.isNotEmpty) {
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
                    ? editSupplierDetailsText
                    : viewSupplierDetailsText,
                editOnPress: () {
                  setState(() {
                    isEditing = !isEditing;
                    isEnabled = !isEnabled;
                  });
                },
                deleteOnPress: AlartMessage(
                  api: '${ApiEndpoints.deleteSupplier}/${widget.id}',
                  onPress: const SupplierDataView(),
                ),
              ),
              SupplierViewDetailsOne(
                  addressline1Controller: addressline1Controller,
                  addressline2Controller: addressline2Controller,
                  cityController: cityController,
                  enabled: isEnabled,
                  pincodeController: pincodeController,
                  stateController: stateController,
                  supplierNameController: supplierNameController),
              SupplierViewDetailsTwo(
                  enabled: isEnabled,
                  gstController: gstController,
                  primaryEmailController: primaryEmailController,
                  primaryNameController: primaryNameController,
                  primaryPhoneNumberController: primaryPhoneNumberController,
                  primaryWhatsappController: primaryWhatsappController,
                  timeLineController: timeLineController),
              SupplierViewDetailsThree(
                  twoOrNot: isEditing,
                  isMultiSelectDropDownEditing: false,
                  changeValue: changeValue,
                  coSupplierCategoryId: coSupplierCategoryId,
                  changeMaterialValue: changeMaterialValue,
                  comaterialCategoryId: comaterialCategoryId.isNotEmpty
                      ? comaterialCategoryId.first
                      : null,
                  isEditing: isEditing,
                  enabled: isEditing,
                  materialsSuppliedController: materialsSuppliedController,
                  supplierCategoryController: supplierCategoryController),
              SupplierViewDetailsFour(
                  enabled: isEnabled,
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  phoneNumberController: phoneNumberController,
                  secondaryNameController: secondaryNameController,
                  secondaryPhoneNumberController:
                      secondaryPhoneNumberController,
                  secondaryEmailController: secondaryEmailController,
                  secondaryWhatsappController: secondaryWhatsappController),
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
                  supplierCheckUpdatingValue();
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

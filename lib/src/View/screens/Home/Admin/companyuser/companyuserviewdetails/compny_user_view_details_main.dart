// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import '../../../../../../Model/api/api_model.dart';
import '/src/View/screens/Home/Admin/companyuser/companyuserviewdetails/company_user_view_five.dart';
import '/src/View/screens/Home/Admin/companyuser/companyuserviewdetails/company_user_view_four.dart';
import '/src/View/screens/Home/Admin/companyuser/companyuserviewdetails/company_user_view_one.dart';
import '/src/View/screens/Home/Admin/companyuser/companyuserviewdetails/company_user_view_three.dart';
import '/src/View/screens/Home/Admin/companyuser/companyuserviewdetails/company_user_view_two.dart';
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
import '../companyuser_text.dart';
import '../companyuserdataview/company_user_data_view.dart';

class CompanyUserViewDetailsMain extends StatefulWidget {
  const CompanyUserViewDetailsMain({Key? key, required this.id})
      : super(key: key);
  final id;

  @override
  State<CompanyUserViewDetailsMain> createState() =>
      _CompanyUserViewDetailsMainState();
}

class _CompanyUserViewDetailsMainState
    extends State<CompanyUserViewDetailsMain> {
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
        Uri.parse("$ip/Admin/Get-couser/${widget.id}"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            var controllers = {
              "first_name": firstNameController,
              "last_name": lastNameController,
              "address_line1": addressline1Controller,
              "address_line2": addressline2Controller,
              "town": cityController,
              "state": stateController,
              "pincode": pincodeController,
              "mobile_no": phoneNumberController,
              "bloodgroup": bloodGroupController,
              "dateofjoining": joinDateController,
              "designation_id": officeDesignationController,
              "co_app_role_id": applicationRoleController,
              "aadhar_no": aadharNumberController,
              "pan_no": panNumberController,
              "primary_contact_name": primaryNameController,
              "primary_contact_no": primaryPhoneNumberController,
              "primary_contact_email": primaryEmailController,
              "primary_contact_whatsapp": primaryWhatsappController,
              "secondary_contact_name": secondaryNameController,
              "secondary_contact_no": secondaryPhoneNumberController,
              "secondary_contact_email": secondaryEmailController,
              "secondary_contact_whatsapp": secondaryWhatsappController,
              "bank_acc_name": accountNameController,
              "bank_acc_no": accountNumberController,
              "bank_acc_type": accountTypeController,
              "bank_name": bankNameController,
              "bank_ifsc_code": ifscCodeController,
              "bank_acc_location": bankLocationController,
              "createdAt": createOn,
              "createdBy": createBy,
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

  Future<void> fetchUpdateData() async {
    try {
      final response = await http.get(
        Uri.parse("$ip/Admin/updatehistory-Couser/${widget.id}"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          var updateData = [];

          var data = jsonDecode(response.body);

          for (var eachData in data) {
            if (eachData["co_userid"].toString() == widget.id) {
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
        Uri.parse("$ip/Admin/update-couser/${widget.id}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );
      print("beefore update");
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CompanyUserDataView()));
      }
    } catch (e) {
      print("update failed $e");
    }
  }

  void companyUserCheckUpdatingValue() {
    var oldData = data;
    print(oldData);
    if (oldData != null) {
      Map<String, dynamic> updatedData = {};
      var controllers = {
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "address_line1": addressline1Controller.text,
        "address_line2": addressline2Controller.text,
        "town": cityController.text,
        "state": stateController.text,
        "pincode": pincodeController.text,
        "mobile_no": phoneNumberController.text,
        "bloodgroup": bloodGroupController.text,
        "dateofjoining": joinDateController.text,
        "designation_id": officeDesignationController.text,
        "co_app_role_id": applicationRoleController.text,
        "aadhar_no": aadharNumberController.text,
        "pan_no": panNumberController.text,
        "primary_contact_name": primaryNameController.text,
        "primary_contact_no": primaryPhoneNumberController.text,
        "primary_contact_email": primaryEmailController.text,
        "primary_contact_whatsapp": primaryWhatsappController.text,
        "secondary_contact_name": secondaryNameController.text,
        "secondary_contact_no": secondaryPhoneNumberController.text,
        "secondary_contact_email": secondaryEmailController.text,
        "secondary_contact_whatsapp": secondaryWhatsappController.text,
        "bank_acc_name": accountNameController.text,
        "bank_acc_no": accountNumberController.text,
        "bank_acc_type": accountTypeController.text,
        "bank_name": bankNameController.text,
        "bank_ifsc_code": ifscCodeController.text,
        "bank_acc_location": bankLocationController.text,
        "createdAt": createOn.text,
        "createdBy": createBy.text,
      };
      controllers.forEach((key, value) {
        if (
            value.isNotEmpty &&value != null &&
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
                    ? editCompanyUserDetailsText
                    : viewCompanyUserDetailsText,
                editOnPress: () {
                  setState(() {
                    isEditing = !isEditing;
                    isEnabled = !isEnabled;
                  });
                },
                deleteOnPress: AlartMessage(
                  api: '${ApiEndpoints.deleteCoUser}/${widget.id}',
                  onPress: const CompanyUserDataView(),
                ),
              ),
              CompanyUserViewDetailsOne(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  phoneNumberController: phoneNumberController,
                  addressline1Controller: addressline1Controller,
                  addressline2Controller: addressline2Controller,
                  cityController: cityController,
                  pincodeController: pincodeController,
                  stateController: stateController,
                  enabled: isEnabled),
              CompanyUserViewDetailsTwo(
                  bloodGroupController: bloodGroupController,
                  joinDateController: joinDateController,
                  officeDesignationController: officeDesignationController,
                  applicationRoleController: applicationRoleController,
                  enabled: isEnabled,
                  isEditing: isEditing),
              CompanyUserViewDetailsThree(
                  primaryNameController: primaryNameController,
                  primaryPhoneNumberController: primaryPhoneNumberController,
                  primaryEmailController: primaryEmailController,
                  primaryWhatsappController: primaryWhatsappController,
                  secondaryNameController: secondaryNameController,
                  secondaryPhoneNumberController:
                      secondaryPhoneNumberController,
                  secondaryEmailController: secondaryEmailController,
                  secondaryWhatsappController: secondaryWhatsappController,
                  enabled: isEnabled),
              CompanyUserViewDetailsFour(
                  enabled: isEnabled,
                  aadharNumberController: aadharNumberController,
                  aadharfilePathController: aadharfilePathController,
                  panNumberController: panNumberController,
                  panfilePathController: panfilePathController),
              CompanyUserViewDetailsFive(
                  isEditing: isEditing,
                  accountNameController: accountNameController,
                  accountNumberController: accountNumberController,
                  accountTypeController: accountTypeController,
                  bankLocationController: bankLocationController,
                  bankNameController: bankNameController,
                  ifscCodeController: ifscCodeController,
                  enabled: isEnabled),
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
                  companyUserCheckUpdatingValue();
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

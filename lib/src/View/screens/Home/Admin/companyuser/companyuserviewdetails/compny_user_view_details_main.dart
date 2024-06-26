// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../controler/GetDate/get_date.dart';
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
    // fetchUpdateData();
  }
  List<Map<String, dynamic>> coLabourCategoryIds = [];
  List<int>? coLabourCategoryIdsOne;

  final formKey = GlobalKey<FormState>();
  final CompanyUserTextEditingController companyUserTextEditingController = CompanyUserTextEditingController();

void changeValue(List<int>? v) {
    setState(() {
      coLabourCategoryIds = v?.map((id) => {"id": id})?.toList() ?? [];
      coLabourCategoryIdsOne = v;
    });
  }
Future<void> fetchData() async {
  try {
    final response = await http.get(
      Uri.parse('${ApiEndpoints.getCoUser}/${widget.id}'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
        print(data);
        if (data != null) {
          firstNameController.text = data!["first_name"] ?? '';
          lastNameController.text = data!["last_name"] ?? '';
          addressline1Controller.text = data!["address_line1"] ?? '';
          addressline2Controller.text = data!["address_line2"] ?? '';
          cityController.text = data!["town"] ?? '';
          stateController.text = data!["state"] ?? '';
          pincodeController.text = data!["pincode"] ?? '';
          phoneNumberController.text = data!["mobile_no"] ?? '';
            primaryNameController.text = data!["emergency_contact_name"] ?? '';
          primaryPhoneNumberController.text = data!["emergency_contact_no"] ?? '';
          primaryEmailController.text = data!["primary_contact_email"] ?? '';
          primaryWhatsappController.text = data!["primary_contact_whatsapp"] ?? '';
          secondaryNameController.text = data!["secondary_contact_name"] ?? '';
          secondaryPhoneNumberController.text = data!["secondary_contact_no"] ?? '';
          secondaryEmailController.text = data!["secondary_contact_email"] ?? '';
          secondaryWhatsappController.text = data!["secondary_contact_whatsapp"] ?? '';
          accountNameController.text = data!["bank_acc_name"] ?? '';
          accountNumberController.text = data!["bank_acc_no"] ?? '';
          accountTypeController.text = data!["bank_acc_type"] ?? '';
          bankNameController.text = data!["bank_name"] ?? '';
          ifscCodeController.text = data!["bank_ifsc_code"] ?? '';
          bankLocationController.text = data!["bank_acc_location"] ?? '';
        
          createBy.text = data!["createdBy"] ?? '';
            createOn.text = Date.getDate(data!["createdAt"]) ?? '';
          bloodGroupController.text = data!["bloodgroup"] ?? '';
          joinDateController.text = data!["dateofjoining"] ?? '';
          officeDesignationController.text = data!["designation_id"] ?? '';
          applicationRoleController.text = data!["co_app_role_id"] ?? '';
          aadharNumberController.text = data!["Aadhar"] ?? '';
          panNumberController.text = data!["Pan"] ?? '';
        
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
                UserNameController: UserNameController,
                passwordController:passwordController ,
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
                changeValue:changeValue ,
                 coLabourCategoryId: coLabourCategoryIdsOne,
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
                  // companyUserCheckUpdatingValue();
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

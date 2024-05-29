// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:cmssms/src/Model/api/api_model.dart';

import '../../../../../../controler/GetDate/get_date.dart';
import 'labor_view_details_six.dart';
import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_four.dart';
import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_one.dart';
import 'labor_view_details_five.dart';
import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_three.dart';
import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_two.dart';
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
import '../labor_text_const.dart';
import '../labordataview/labor_data_view.dart';

class LaborViewDetailsMain extends StatefulWidget {
  const LaborViewDetailsMain({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<LaborViewDetailsMain> createState() => _LaborViewDetailsMainState();
}

class _LaborViewDetailsMainState extends State<LaborViewDetailsMain> {
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
        Uri.parse("$ip/Admin/labour/${widget.id}"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          print(data);
          if (data != null) {rateModelController.text = data!["co_labour_rate_model"] ?? "";
             laborRateController.text = data!["co_labour_rate"].toString() ?? "";
           aadharNumberController.text = data!["aadhar_no"].toString() ?? "";
             phoneNumberController.text = data!["mobile_no"] ?? "";
            firstNameController.text = data!["first_name"] ?? "";
            lastNameController.text = data!["last_name"] ?? "";
            addressline1Controller.text = data!["address_line1"] ?? "";
            addressline2Controller.text = data!["address_line2"] ?? "";
            cityController.text = data!["town"] ?? "";
            stateController.text = data!["state"] ?? "";
            pincodeController.text = data!["pincode"] ?? "";
            primaryNameController.text = data!["emergency_contact_name"] ?? "";
             bloodGroupController.text = data!["bloodgroup"] ?? "";
            primaryPhoneNumberController.text =
                data!["emergency_contact_no"] ?? "";
                 createBy.text = data!["created_by"] ?? "";
            createOn.text = Date.getDate(data!["created_on"]) ?? "";
          
           
           
             gpayNumberController.text = data!["gpay_no"] ?? "";
            accountNameController.text = data!["bank_acc_name"] ?? "";
            accountNumberController.text = data!["bank_acc_no"] ?? "";
            accountTypeController.text = data!["bank_acc_type"] ?? "";
            bankNameController.text = data!["bank_name"] ?? "";
            ifscCodeController.text = data!["bank_ifsc_code"] ?? "";
                
           
         
          
           
            
              aadharfilePathController.text = data!["aadhar_image"] ?? "";
            laborCategoryController.text = data!["co_labour_category_id""CoLabourCategory"] ?? "";
            siteWorkedController.text = data!["co_sites_worked"] ?? "";
            cuurentSiteAllocationController.text =
                data!["co_current_sites_allocation"] ?? "";
           
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
        Uri.parse('${ApiEndpoints.getLabourUpdateHistory}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          var updateData = [];

          var data = jsonDecode(response.body);

          for (var eachData in data) {
            if (eachData["co_labour_id"].toString() == widget.id) {
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
      var response = await http.patch(
        Uri.parse('${ApiEndpoints.updateLabour}/${widget.id}'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );
     
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LaborDataView()));
      }
      else{
        print(response.body);
      }
    } catch (e) {
      print("update failed $e");
    }
  }

void laborCheckUpdatingValue() {
  var oldData=data;
  if (oldData != null) {
    Map<String, dynamic> updatedData = {};

    var currentData = {
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "address_line1": addressline1Controller.text,
      "address_line2": addressline2Controller.text,
      "town": cityController.text,
      "state": stateController.text,
      "pincode": pincodeController.text,
      "emergency_contact_name": primaryNameController.text,
      "emergency_contact_no": primaryPhoneNumberController.text,
      "mobile_no": phoneNumberController.text,
      "bloodgroup": bloodGroupController.text,
      "gpay_no": gpayNumberController.text,
      "bank_acc_name": accountNameController.text,
      "bank_acc_no": accountNumberController.text,
      "bank_acc_type": accountTypeController.text,
      "bank_name": bankNameController.text,
      "bank_ifsc_code": ifscCodeController.text,
      "aadhar_no": aadharNumberController.text,
      "co_labour_rate": laborRateController.text,
      "co_labour_rate_model": rateModelController.text,
    };

    currentData.forEach((key, value) {
      if (value != null && value.isNotEmpty && (oldData[key] ?? '') != value) {
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
                viewClientDetailsTextt:
                    isEditing ? editLaborDetailsText : viewLaborDetailsText,
                editOnPress: () {
                  setState(() {
                    isEditing = !isEditing;
                    isEnabled = !isEnabled;
                  });
                },
                deleteOnPress: AlartMessage(
                  api: '${ApiEndpoints.deleteLabour}/${widget.id}',
                  onPress: const LaborDataView(),
                ),
              ),
              LaborViewDetailsOne(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  phoneNumberController: phoneNumberController,
                  addressline1Controller: addressline1Controller,
                  addressline2Controller: addressline2Controller,
                  cityController: cityController,
                  pincodeController: pincodeController,
                  stateController: stateController,
                  enabled: isEnabled),
              LaborViewDetailsTwo(
                changeValue: (){},
                coLabourCategoryId:1,
              
                  bloodGroupController: bloodGroupController,
                  laborCategoryController: laborCategoryController,
                  rateModelController: rateModelController,
                  laborRateController: laborRateController,
                  isEditing: isEditing,
                  enabled: isEnabled),
              LaborViewDetailsThree(
                  isEditing: isEditing,
                  aadharfilePathController: aadharfilePathController,
                  aadharController: aadharNumberController,
                  siteWorkedController: siteWorkedController,
                  cuurentSiteAllocationController:
                      cuurentSiteAllocationController,
                  enabled: isEnabled),
              LaborViewDetailsFour(
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
             
              LaborViewDetailsFive(
                  isEditing: isEditing,
                  gpayNumber: gpayNumberController,
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
                  laborCheckUpdatingValue();
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
// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:cmssms/src/Model/api/api_model.dart';

import '../../../../../../controler/GetDate/get_date.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_header.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_item.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../labor_text_const.dart';
import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_four.dart';
import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_one.dart';
import '../laborviewdetails/labor_view_details_five.dart';
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

class LaborFormDeleteView extends StatefulWidget {
  const LaborFormDeleteView({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<LaborFormDeleteView> createState() => _LaborFormDeleteViewState();
}

class _LaborFormDeleteViewState extends State<LaborFormDeleteView> {
  Map<String, dynamic>? data;
  var updatedData;
  CommonController commonController = CommonController();
  List labordropdownItems = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      print("try");
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getLabour}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          print(data);

          if (data != null) {
            rateModelController.text = data!["co_labour_rate_model"] ?? "";
            laborRateController.text = data!["co_labour_rate"].toString()  ;
            aadharNumberController.text = data!["aadhar_no"].toString() ;
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
            laborCategoryController.text =
                data!["co_labour_category_id" ] ?? "";
    
          }
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  int coLabourCategoryId = 2;/////////here want to fetch data

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
              DetailsText(enterDetails: deleteLaborDetailsText),
              LaborViewDetailsOne(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  phoneNumberController: phoneNumberController,
                  addressline1Controller: addressline1Controller,
                  addressline2Controller: addressline2Controller,
                  cityController: cityController,
                  pincodeController: pincodeController,
                  stateController: stateController,
                  enabled: false),
              // LaborViewDetailsTwo(
              //   changeValue: (){},
              //     coLabourCategoryId: coLabourCategoryId,
              //     // labordropdownItems: labordropdownItems,
              //     bloodGroupController: bloodGroupController,
              //     laborCategoryController: laborCategoryController,
              //     rateModelController: rateModelController,
              //     laborRateController: laborRateController,
              //     isEditing: false,
              //     enabled: false),
              // LaborViewDetailsThree(
              //   changeValue: (){},
              //   coLabourCategoryId: 1,
              //     isEditing: false,
              //     aadharfilePathController: aadharfilePathController,
              //     aadharController: aadharNumberController,
              //     siteWorkedController: siteWorkedController,
              //     cuurentSiteAllocationController:
              //         cuurentSiteAllocationController,
              //     enabled: false),
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
                  enabled: false),
              LaborViewDetailsFive(
                  isEditing: false,
                  gpayNumber: gpayNumberController,
                  accountNameController: accountNameController,
                  accountNumberController: accountNumberController,
                  accountTypeController: accountTypeController,
                  bankLocationController: bankLocationController,
                  bankNameController: bankNameController,
                  ifscCodeController: ifscCodeController,
                  enabled: false),
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
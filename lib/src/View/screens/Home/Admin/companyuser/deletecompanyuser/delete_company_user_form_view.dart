// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:cmssms/src/Model/api/api_model.dart';

import '../../../../../../controler/GetDate/get_date.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_header.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_item.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
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
import '../companyuser_text.dart';

class CompanyUserFormDeleteView extends StatefulWidget {
  const CompanyUserFormDeleteView({Key? key, required this.id})
      : super(key: key);
  final id;

  @override
  State<CompanyUserFormDeleteView> createState() =>
      _CompanyUserFormDeleteViewState();
}

class _CompanyUserFormDeleteViewState extends State<CompanyUserFormDeleteView> {
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
        Uri.parse('${ApiEndpoints.getCoUser}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            var controllers = {};
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

  bool isEditing = false;

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
              const DetailsText(enterDetails: deleteCompanyUserDetailsText),
              CompanyUserViewDetailsOne(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  phoneNumberController: phoneNumberController,
                  addressline1Controller: addressline1Controller,
                  addressline2Controller: addressline2Controller,
                  cityController: cityController,
                  pincodeController: pincodeController,
                  stateController: stateController,
                  enabled: false),
              CompanyUserViewDetailsTwo(
                  bloodGroupController: bloodGroupController,
                  joinDateController: joinDateController,
                  officeDesignationController: officeDesignationController,
                  applicationRoleController: applicationRoleController,
                  enabled: false,
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
                  enabled: false),
              CompanyUserViewDetailsFour(
                  enabled: false,
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

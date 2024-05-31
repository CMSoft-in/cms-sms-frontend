// // ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import '../../../../../../Model/api/api_model.dart';
import '../companyuser_text.dart';
import '../companyuserdataview/company_user_data_view.dart';
import '/src/View/screens/Home/Admin/companyuser/companyuserviewdetails/company_user_view_five.dart';
import '/src/Model/api/local.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import 'package:http/http.dart' as http;
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/utility/client/client_text_const.dart';

class CompanyUserFormPageFive extends StatefulWidget {
  const CompanyUserFormPageFive({super.key, required this.data});
  final Map data;

  @override
  State<CompanyUserFormPageFive> createState() =>
      _CompanyUserFormPageFiveState();
}

class _CompanyUserFormPageFiveState extends State<CompanyUserFormPageFive> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final oldData = widget.data;
    final formKey = GlobalKey<FormState>();
    CompanyUserTextEditingController companyUserTextEditingController =
        CompanyUserTextEditingController();
        
    Future navigateToPageSix(context) async {
     
      var apiURL = Uri.parse(ApiEndpoints.createCoUser);

      var values = {
        ...oldData,
        "bank_acc_name":
            companyUserTextEditingController.accountNameController.text.isEmpty ? null :companyUserTextEditingController.accountNameController.text.trim(),
        "bank_acc_no":
            companyUserTextEditingController.accountNumberController.text.isEmpty ? null :int.parse(companyUserTextEditingController.accountNumberController.text.trim()),
        "bank_acc_type":
            companyUserTextEditingController.accountTypeController.text.isEmpty ? null :companyUserTextEditingController.accountTypeController.text.trim(),
        "bank_name": companyUserTextEditingController.bankNameController.text.isEmpty ? null :companyUserTextEditingController.bankNameController.text.trim(),
        "bank_ifsc_code":
            companyUserTextEditingController.ifscCodeController.text.isEmpty ? null :companyUserTextEditingController.ifscCodeController.text.trim(),
        "bank_acc_location":
            companyUserTextEditingController.bankLocationController.text.isEmpty ? null :companyUserTextEditingController.bankLocationController.text.trim(),
      };
      print(values);

      var body = json.encode(values);
      var response = await http.post(
        apiURL,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: body,
      );
      if (response.statusCode == 201) {
        print('Response body: ${response.body}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CompanyUserDataView(),
          ),
        );
      } else {
        print(response.body);
        print('Failed to load data: ${response.statusCode}');
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      const StackText(
                        stacktext: clientpage5,
                        color: red,
                      ),
                      formSizebox15,
                      CompanyUserViewDetailsFive(
                          accountNameController:
                              companyUserTextEditingController
                                  .accountNameController,
                          accountNumberController:
                              companyUserTextEditingController
                                  .accountNumberController,
                          accountTypeController:
                              companyUserTextEditingController
                                  .accountTypeController,
                          bankLocationController:
                              companyUserTextEditingController
                                  .bankLocationController,
                          bankNameController: companyUserTextEditingController
                              .bankNameController,
                          ifscCodeController: companyUserTextEditingController
                              .ifscCodeController,
                          isEditing: true,
                          enabled: true),
                      formSizebox15,
                      bottomHeight,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
        formKey: formKey,
        isEnabled: true,
        onPress: () => navigateToPageSix(context),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

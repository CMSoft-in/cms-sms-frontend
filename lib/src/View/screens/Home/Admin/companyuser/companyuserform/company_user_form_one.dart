// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../companyuser_text.dart';
import '../companyuserviewdetails/company_user_view_one.dart';
import 'company_user_form_two.dart';

class ComapnyUserFormPageOne extends StatelessWidget {
  const ComapnyUserFormPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> data;

    final formKey = GlobalKey<FormState>();
    CompanyUserTextEditingController companyUserTextEditingController =
        CompanyUserTextEditingController();

    void navigateToPageTwo(BuildContext context) {
      var data = {
        "email": companyUserTextEditingController
                .UserNameController.text.isEmpty
            ? null
            : companyUserTextEditingController.UserNameController.text.trim(),
        "password": companyUserTextEditingController
                .passwordController.text.isEmpty
            ? null
            : companyUserTextEditingController.passwordController.text.trim(),
        "first_name": companyUserTextEditingController
                .firstNameController.text.isEmpty
            ? null
            : companyUserTextEditingController.firstNameController.text.trim(),
        "last_name": companyUserTextEditingController
                .lastNameController.text.isEmpty
            ? null
            : companyUserTextEditingController.lastNameController.text.trim(),
        "address_line1":
            companyUserTextEditingController.addressline1Controller.text.isEmpty
                ? null
                : companyUserTextEditingController.addressline1Controller.text
                    .trim(),
        "address_line2":
            companyUserTextEditingController.addressline2Controller.text.isEmpty
                ? null
                : companyUserTextEditingController.addressline2Controller.text
                    .trim(),
        "town": companyUserTextEditingController.cityController.text.isEmpty
            ? null
            : companyUserTextEditingController.cityController.text.trim(),
        "state": companyUserTextEditingController.stateController.text.isEmpty
            ? null
            : companyUserTextEditingController.stateController.text.trim(),
        "pincode": companyUserTextEditingController
                .pincodeController.text.isEmpty
            ? null
            : int.parse(
                companyUserTextEditingController.pincodeController.text.trim()),
        "mobile_no":
            companyUserTextEditingController.phoneNumberController.text.isEmpty
                ? null
                : companyUserTextEditingController.phoneNumberController.text
                    .trim(),
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ComapnyUserFormPageTwo(data: data),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    formSizebox8,
                    const DetailsText(enterDetails: companyUserpersonalInfo),
                    formSizebox15,
                    const StackText(
                      stacktext: companyUserpage1,
                      color: red,
                    ),
                    CompanyUserViewDetailsOne(
                        UserNameController:
                            companyUserTextEditingController.UserNameController,
                        passwordController:
                            companyUserTextEditingController.passwordController,
                        firstNameController: companyUserTextEditingController
                            .firstNameController,
                        lastNameController:
                            companyUserTextEditingController.lastNameController,
                        phoneNumberController: companyUserTextEditingController
                            .phoneNumberController,
                        addressline1Controller: companyUserTextEditingController
                            .addressline1Controller,
                        addressline2Controller: companyUserTextEditingController
                            .addressline2Controller,
                        cityController:
                            companyUserTextEditingController.cityController,
                        pincodeController:
                            companyUserTextEditingController.pincodeController,
                        stateController:
                            companyUserTextEditingController.stateController,
                        enabled: true),
                    formSizebox15,
                    bottomHeight,
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
          formKey: formKey,
          isEnabled: false,
          onPress: () => navigateToPageTwo(context)),
      bottomNavigationBar: BottomSheetLogo(),
    );
  }
}

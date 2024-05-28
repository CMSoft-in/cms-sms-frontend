// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_one.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../labor_text_const.dart';
import 'labor_form_two.dart';

class LaborFormPageOne extends StatelessWidget {
  const LaborFormPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> data;

    final formKey = GlobalKey<FormState>();
   LaborTextEditingController laborTextEditingController=LaborTextEditingController();
    void navigateToPageTwo(BuildContext context) {
      var data = {
         "first_name":   laborTextEditingController.firstNameController.text,
        "last_name":   laborTextEditingController.lastNameController.text,
        "address_line1":   laborTextEditingController.addressline1Controller.text,
        "address_line2":  laborTextEditingController. addressline2Controller.text,
        "town":   laborTextEditingController.cityController.text,
        "state":  laborTextEditingController. stateController.text,
        "pincode":  laborTextEditingController. pincodeController.text,
        "mobile_no":   laborTextEditingController.phoneNumberController.text,
      
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LaborFormPageTwo(data: data),
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
                    const DetailsText(enterDetails: labordetails),
                    formSizebox15,
                    const StackText(
                      stacktext: laborpage1,
                      color: red,
                    ),
                    LaborViewDetailsOne(
                        firstNameController:laborTextEditingController. firstNameController,
                        lastNameController: laborTextEditingController.lastNameController,
                        phoneNumberController:laborTextEditingController. phoneNumberController,
                        addressline1Controller: laborTextEditingController.addressline1Controller,
                        addressline2Controller:laborTextEditingController. addressline2Controller,
                        cityController: laborTextEditingController.cityController,
                        pincodeController:laborTextEditingController.pincodeController,
                        stateController:laborTextEditingController. stateController,
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
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

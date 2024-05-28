import '/src/Model/general/common_basic_form_three.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
class CompanyUserViewDetailsOne extends StatelessWidget {
  const CompanyUserViewDetailsOne(
      {Key? key,
      required this.firstNameController,
      required this.lastNameController,
      required this.phoneNumberController,
      required this.addressline1Controller,
      required this.addressline2Controller,
      required this.cityController,
      required this.pincodeController,
      required this.stateController,
      required this.enabled})
      : super(key: key);
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressline1Controller;
  final TextEditingController addressline2Controller;
  final TextEditingController cityController;
  final TextEditingController pincodeController;
  final TextEditingController stateController;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      formSizebox10,
      CommonBasicFormThree(
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          phoneNumberController: phoneNumberController,
          addressline1Controller: addressline1Controller,
          addressline2Controller: addressline2Controller,
          cityController: cityController,
          pincodeController: pincodeController,
          stateController: stateController,
          enabled: enabled)
    ]);
  }
}

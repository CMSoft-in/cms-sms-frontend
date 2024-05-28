import '/src/Model/general/address.dart';
import '/src/Model/general/common_basic_form_one.dart';
import 'package:flutter/material.dart';
import '../Const/height_width.dart';
import '../Const/text_const.dart';

class CommonBasicFormThree extends StatelessWidget {
  const CommonBasicFormThree(
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
      CommonBasicFormOne(
          enabled: enabled,
          firstNameController: firstNameController,
          firstNameoptionalisEmpty: true,
          lastNameController: lastNameController,
          lastNameOptionalisEmpty: true,
          phoneNumberController: phoneNumberController,
          phoneNumberOptionalisEmpty: true,
          star: star),
      formSizebox10,
      Address(
          enabled: enabled,
          addressline1Controller: addressline1Controller,
          addressline2Controller: addressline2Controller,
          cityController: cityController,
          pincodeController: pincodeController,
          stateController: stateController,
          addressline1OptionalisEmpty: true,
          star: star,
          estar: estar,
     addressline2OptionalisEmpty: false,
     cityOptionalisEmpty: true,
     pincodeOptionalisEmpty: true,
     stateOptionalisEmpty: true,
          ),
    ]);
  }
}

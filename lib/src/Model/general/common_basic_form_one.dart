import "package:flutter/material.dart";

import "../../View/widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart";
import "../../View/widgets/CommonUsageForm/textformfeild/text_form_field.dart";
import "../Const/height_width.dart";
import "../Const/text_const.dart";



class CommonBasicFormOne extends StatelessWidget {
  const CommonBasicFormOne(
      {super.key,
      required this.enabled,
      required this.firstNameController,
      required this.firstNameoptionalisEmpty,
      required this.lastNameController,
      required this.lastNameOptionalisEmpty,
      required this.phoneNumberController,
      required this.phoneNumberOptionalisEmpty,
      required this.star});
  final bool enabled;
  final star;
  final bool firstNameoptionalisEmpty;
  final bool lastNameOptionalisEmpty;
  final bool phoneNumberOptionalisEmpty;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextformField(
          controller: firstNameController,
          text: firstName,
          star: star,
          limitLength: 20,
          optionalisEmpty: firstNameoptionalisEmpty,
          inputformat: alphabats,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),
        formSizebox10,
        TextformField(
          controller: lastNameController,
          text: lastName,
          limitLength: 20,
          star: star,
          inputformat: alphabats,
          optionalisEmpty: lastNameOptionalisEmpty,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),
        formSizebox10,
        PhoneFormField(
          controller: phoneNumberController,
          text: phoneNumber,
          star: star,
          limitLength: 10,
          optionalisEmpty: phoneNumberOptionalisEmpty,
          inputformat: number,
          inputtype: keyboardTypeNumber,
          valuelength: 10,
          enabled: enabled,
        ),
      ],
    );
  }
}

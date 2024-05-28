import '/src/Model/Const/color.dart';
import 'package:flutter/material.dart';

import '../../View/widgets/CommonUsageForm/HintText.dart';
import '../../View/widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart';
import '../../View/widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../Const/height_width.dart';
import '../Const/text_const.dart';



class SecondaryContact extends StatelessWidget {
  const SecondaryContact({super.key,
  required this.enabled,
  required this.secondaryContactName,
  required this.secondaryNameController,
  required this.secondaryPhoneNumberController,
  required this.secondaryEmailController,
  required this.secondaryWhatsappController});
  final bool enabled;
  final TextEditingController secondaryNameController;
  final TextEditingController secondaryPhoneNumberController;
  final TextEditingController secondaryEmailController;
  final TextEditingController secondaryWhatsappController;
  final String secondaryContactName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         formSizebox10,
         StackText(
          stacktext: secondaryContactName,
          color: grey,
        ),
        formSizebox10,
        TextformField(
          controller: secondaryNameController,
          text: name,
          star: estar,
          limitLength: 20,
          optionalisEmpty: false,
          inputformat: alphabatsSpace,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),
        formSizebox10,
        PhoneFormField(
          controller: secondaryPhoneNumberController,
          text: phoneNumber,
          star: estar,
          limitLength: 10,
          optionalisEmpty: false,
          inputformat: number,
          inputtype: keyboardTypeNumber,
          valuelength: 10,
          enabled: enabled,
        ),
        formSizebox10,
        TextformField(
          controller: secondaryEmailController,
          text: email,
          star: estar,
          limitLength: 30,
          optionalisEmpty: false,
          inputformat: emailonly,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),
        formSizebox10,
        PhoneFormField(
          controller: secondaryWhatsappController,
          text: whatsapp,
          star: estar,
          limitLength: 10,
          optionalisEmpty: false,
          inputformat: number,
          inputtype: keyboardTypeNumber,
          valuelength: 10,
          enabled: enabled,
        ),
      ],
    );
  }
}

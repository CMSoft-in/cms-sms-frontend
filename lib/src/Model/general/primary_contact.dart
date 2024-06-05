import "package:flutter/material.dart";

import "../../View/widgets/CommonUsageForm/HintText.dart";
import "../../View/widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart";
import "../../View/widgets/CommonUsageForm/textformfeild/text_form_field.dart";
import "../Const/color.dart";
import "../Const/height_width.dart";
import "../Const/text_const.dart";

class PrimaryContact extends StatelessWidget {
  PrimaryContact(
      {super.key,
      required this.enabled,
      required this.primaryContactName,
      required this.primaryNameController,
      required this.primaryEmailController,
      required this.primaryPhoneNumberController,
      required this.primaryWhatsappController,
      this.emailOptionalIsEmpty = false,
      this.eStarIsFalse = false});
  final bool enabled;
  final TextEditingController primaryNameController;
  final TextEditingController primaryPhoneNumberController;
  final TextEditingController primaryEmailController;
  final TextEditingController primaryWhatsappController;
  final String primaryContactName;
  bool emailOptionalIsEmpty;
  bool eStarIsFalse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox10,
        StackText(
          stacktext: primaryContactName,
          color: grey,
        ),
        formSizebox10,
        TextformField(
          controller: primaryNameController,
          text: name,
          limitLength: 40,
          star: star,
          inputformat: alphabatsSpace,
          optionalisEmpty: true,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),
        formSizebox10,
        PhoneFormField(
          controller: primaryPhoneNumberController,
          text: phoneNumber,
          star: star,
          limitLength: 10,
          optionalisEmpty: true,
          inputformat: number,
          inputtype: keyboardTypeNumber,
          valuelength: 10,
          enabled: enabled,
        ),
        formSizebox10,
        TextformField(
          controller: primaryEmailController,
          text: email,
          star: eStarIsFalse ? star :estar,
          limitLength: 20,
          optionalisEmpty: emailOptionalIsEmpty,
          inputformat: emailonly,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),
        formSizebox10,
        PhoneFormField(
          controller: primaryWhatsappController,
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

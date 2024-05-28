import "/src/View/widgets/CommonUsageForm/HintText.dart";
import "/src/Model/Const/height_width.dart";
import "package:flutter/material.dart";
import "../../../../../widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart";
import "../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart";
import "../../../../../../Model/Const/color.dart";
import "../../../../../../Model/Const/text_const.dart";

class SiteCommonUsePages extends StatelessWidget {
  const SiteCommonUsePages(
      {super.key,
      required this.stacktext,
       required this.nameController,
       required this.phoneNumberController,
      required this.emailController,
      required this.whatsappController,
      required this.enabled});
  final bool enabled;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController whatsappController;
  final String stacktext;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
       StackText(stacktext: stacktext, color: grey),
      formSizebox10,
      TextformField(
          controller: nameController,
          text: name,
          limitLength: 25,
          optionalisEmpty: false,
          inputformat: alphabatsSpace,
          star: estar,
          inputtype: keyboardTypeNone,
          enabled: enabled),
      formSizebox10,
      PhoneFormField(
          controller: phoneNumberController,
          text: phoneNumber,
          limitLength: 10,
          optionalisEmpty: false,
          inputformat: number,
          star: estar,
          inputtype: keyboardTypeNumber,
          valuelength: 10,
          enabled: enabled),
      formSizebox10,
      TextformField(
          controller: emailController,
          text: email,
          limitLength: 30,
          optionalisEmpty: false,
          inputformat: emailonly,
          star: estar,
          inputtype: keyboardTypeEmail,
          enabled: enabled),
      formSizebox10,
      PhoneFormField(
          controller: whatsappController,
          text: whatsapp,
          limitLength: 10,
          optionalisEmpty: false,
          inputformat: number,
          star: estar,
          inputtype: keyboardTypeNumber,
          valuelength: 10,
          enabled: enabled),
      formSizebox10,
    ]);
  }
}

import "/src/View/widgets/CommonUsageForm/HintText.dart";
import "/src/View/widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart";
import "/src/View/widgets/CommonUsageForm/textformfeild/text_form_field.dart";
import "/src/Model/Const/height_width.dart";
import "/src/Model/Const/text_const.dart";
import "package:flutter/material.dart";

import "../../../../../../Model/Const/color.dart";
import "../../../../../../Model/utility/sites/site_text_const.dart";

class SiteViewDetailsFour extends StatelessWidget {
  const SiteViewDetailsFour({super.key, required this.enabled,
   required this.emailController, required this.nameController, required this.phoneNumberController, required this.secondaryEmailController, required this.secondaryNameController, required this.secondaryPhoneNumberController, required this.secondaryWhatsappController, required this.whatsappController});
  final bool enabled;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController whatsappController;
  final TextEditingController secondaryNameController;
  final TextEditingController secondaryPhoneNumberController;
  final TextEditingController secondaryEmailController;
  final TextEditingController secondaryWhatsappController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StackText(stacktext: sitePrimaryContact, color: grey),
        formSizebox10,
        TextformField(
            controller: nameController,
            text: name,
            limitLength: 25,
            optionalisEmpty: true,
            inputformat: alphabatsSpace,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: enabled),
        formSizebox10,
        PhoneFormField(
            controller: phoneNumberController,
            text: phoneNumber,
            limitLength: 10,
            optionalisEmpty: true,
            inputformat: number,
            star: star,
            inputtype: keyboardTypeNumber,
            valuelength: 10,
            enabled: enabled),
        formSizebox10,
        TextformField(
            controller: emailController,
            text: email,
            limitLength: 30,
            optionalisEmpty: true,
            inputformat: emailonly,
            star: star,
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
        const StackText(stacktext: siteSecondaryContact, color: grey),
        formSizebox10,
        TextformField(
            controller: secondaryNameController,
            text: name,
            limitLength: 30,
            optionalisEmpty: false,
            inputformat: alphabatsSpace,
            star: estar,
            inputtype: keyboardTypeNone,
            enabled: enabled),
        formSizebox10,
        PhoneFormField(
            controller: secondaryPhoneNumberController,
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
            controller: secondaryEmailController,
            text: email,
            limitLength: 40,
            optionalisEmpty: false,
            inputformat: emailonly,
            star: estar,
            inputtype: keyboardTypeNumber,
            enabled: enabled),
        formSizebox10,
        PhoneFormField(
            controller: secondaryWhatsappController,
            text: whatsapp,
            limitLength: 10,
            optionalisEmpty: false,
            inputformat: number,
            star: estar,
            inputtype: keyboardTypeNumber,
            valuelength: 10,
            enabled: enabled)
      ],
    );
  }
}

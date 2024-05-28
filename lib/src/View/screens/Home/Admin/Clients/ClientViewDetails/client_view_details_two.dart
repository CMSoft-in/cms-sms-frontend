import 'package:flutter/material.dart';

import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';


class ClientViewDetailsTwo extends StatelessWidget {
  const ClientViewDetailsTwo(
      {Key? key,
      required this.firstNamee,
      required this.lastNamee,
      required this.phoneNumberr,
      required this.whatsappp,
      required this.emaill,
      required this.enabled})
      : super(key: key);
  final TextEditingController firstNamee;
  final TextEditingController lastNamee;
  final TextEditingController phoneNumberr;
  final TextEditingController emaill;
  final TextEditingController whatsappp;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const StackText(
        stacktext: ownerDetails,
        color: grey,
      ),
      formSizebox10,
      TextformField(
        controller: firstNamee,
        text: firstName,
        star: star,
        limitLength: 20,
        optionalisEmpty: true,
        inputformat: alphabats,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      formSizebox10,
      TextformField(
        controller: lastNamee,
        // validator: newMethod,
        text: lastName,
        limitLength: 20,
        star: star,
        inputformat: alphabats,
        optionalisEmpty: true,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      formSizebox10,
      PhoneFormField(
        controller: phoneNumberr,
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
        controller: emaill,
        text: email,
        star: estar,
        limitLength: 40,
        optionalisEmpty: false,
        inputformat: emailonly,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      formSizebox10,
      PhoneFormField(
        controller: whatsappp,
        text: whatsapp,
        star: estar,
        limitLength: 10,
        optionalisEmpty: false,
        inputformat: number,
        inputtype: keyboardTypeNumber,
        valuelength: 10,
        enabled: enabled,
      ),
    ]);
  }
}

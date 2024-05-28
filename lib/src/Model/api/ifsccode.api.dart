import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../View/widgets/CommonUsageForm/textformfeild/code_text_form_field.dart';
import '../Const/text_const.dart';

class IFSCAPI extends StatelessWidget {
  const IFSCAPI(
      {Key? key,
      required this.bankControllerName,
      required this.bankControllerLocation,
      required this.ifscCodeController,
      required this.star,
      required this.optionalisEmpty,
      required this.enabled,
      required this.valueLength})
      : super(key: key);
  final TextEditingController bankControllerName;
  final TextEditingController bankControllerLocation;
  final TextEditingController ifscCodeController;
  final star;
  final optionalisEmpty;
  final bool enabled;
  final valueLength;
  @override
  Widget build(BuildContext context) {
    void getIfsc(String ifsc) async {
      var apiURL =
          Uri.parse("https://bank-apis.justinclicks.com/API/V1/IFSC/$ifsc/");
      var response = await http.get(apiURL);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data.isNotEmpty) {
          var bankName = data["BANK"];
          var bankLocation = data["BRANCH"];
          bankControllerName.text = bankName;
          bankControllerLocation.text = bankLocation;
        }
      }
    }

    ifscCodeController.addListener(() {
      String text = ifscCodeController.text;
      String upperCaseText = text.toUpperCase();
      if (text != upperCaseText) {
        ifscCodeController.value = ifscCodeController.value.copyWith(
          text: upperCaseText,
          selection: TextSelection.collapsed(offset: upperCaseText.length),
        );
      }
    });

    return CodeTextField(
        controller: ifscCodeController,
        text: ifscCode,
        star: star,
        valueLength: valueLength,
        limitLength: 11,
        inputtype: keyboardTypeNone,
        optionalisEmpty: false,
        inputformat: alphabatsAndNumbers,
        enabled: enabled,
        onchange: (value) {
          if (value.length == 11) {
            getIfsc(value);
          }
        });
  }
}

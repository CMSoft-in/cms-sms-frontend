import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../../../../Model/Const/height_width.dart';
import '../../../../Model/Const/text_const.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    super.key,
    required this.controller,
    required this.text,
    required this.limitLength,
    required this.optionalisEmpty,
    required this.inputformat,
    required this.star,
    required this.inputtype,
    required this.valuelength,
    required this.enabled
  });

  final TextEditingController controller;
  final String text;
  final RegExp inputformat;
  final bool optionalisEmpty;
  final int limitLength;
  final String star;
  final inputtype;
  final valuelength;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: primaryWidth,
        child: TextFormField(
            // onChanged: (value) {
            //   validMethod(value);
            // },
            inputFormatters: [
              FilteringTextInputFormatter.allow(inputformat),
              LengthLimitingTextInputFormatter(limitLength),
            ],
            keyboardType: inputtype,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                     text: text,
                      style: textStyleGrey18,
                    ),
                    TextSpan(
                     text:star,
                      style: textStyleRedStar,
                    ),
                  ],
                ),
              ),
              errorStyle: const TextStyle(color: Colors.red),
            ),
            validator: validMethod,
            controller: controller,
             style:textStyleBlack18,
            enabled:enabled));
  }

  String? validMethod(value) {
    if (optionalisEmpty == true) {
      if (value == null || value.isEmpty) {
        return "Please enter Phone Number" /*${text == '+91-' ? 'Phone Number' : text}*/;
      } else if (value.length < valuelength) {
        return "Please enter Valid Number";
      }

      return null;
    } else if (value.length == 0) {
      return null;
    } else if (value.length < valuelength) {
      return "Please enter Valid Number";
    }
    return null;
  }
}

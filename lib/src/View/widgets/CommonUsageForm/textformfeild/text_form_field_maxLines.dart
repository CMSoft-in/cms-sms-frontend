import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "../../../../Model/Const/height_width.dart";
import "../../../../Model/Const/text_const.dart";

class MaxMinTextFormField extends StatelessWidget {
  const MaxMinTextFormField({super.key,required this.controller,
      required this.text,
      required this.limitLength,
      required this.optionalisEmpty,
      required this.inputformat,
      required this.star,
      required this.inputtype,
      required this.enabled,
      required this.maxLines,
      required this.minLines});
  final inputformat;
  final limitLength;
  final inputtype;
  final maxLines;
  final minLines;
  final String text;
  final String star;
  final TextEditingController controller;
  final bool enabled;
  final bool optionalisEmpty;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width:
            primaryWidth /*isMobile ? primaryWidth : screenSize.width * 0.7*/,
        child: TextFormField(
          maxLines: maxLines,
          minLines: minLines,
          inputFormatters: [
            FilteringTextInputFormatter.allow(inputformat),
            LengthLimitingTextInputFormatter(limitLength),
          ],
          keyboardType: inputtype,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: RichText(
              textAlign: TextAlign.end,
              text: TextSpan(
                
                children: [
                  TextSpan(
                    text: text,
                    style: textStyleGrey18,
                  ),
                  TextSpan(
                    text: star,
                    style: textStyleRedStar,
                  ),
                ],
              ),
            ),
            errorStyle: const TextStyle(color: Colors.red),
          ),
          validator: validMethod,
          controller: controller,
          enabled: enabled,
           style:textStyleBlack18,
        ));
  }

  String? validMethod(value) {
    if (optionalisEmpty == true) {
      if (value == null || value.isEmpty) {
        return "Please enter ${text == '+91-' ? 'Phone Number' : text}";
      }
      return null;
    }
    return null;
  }
}

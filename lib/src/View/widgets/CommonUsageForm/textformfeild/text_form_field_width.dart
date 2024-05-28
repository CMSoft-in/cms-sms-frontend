import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../Model/Const/text_const.dart';

class TextFormFieldWidth extends StatelessWidget {
  const TextFormFieldWidth({
    super.key,
    required this.controller,
    required this.text,
    required this.limitLength,
    required this.optionalisEmpty,
    required this.inputformat,
    required this.star,
    required this.inputtype,
    required this.enabled,
    required this.Width
  });

  final TextEditingController controller;
  final String text;
  final RegExp inputformat;
  final bool optionalisEmpty;
  final int limitLength;
  final String star;
  final inputtype;
  final double Width;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final isMobile = screenSize.width < 600;
    return SizedBox(
        width: Width /*isMobile ? primaryWidth : screenSize.width * 0.7*/,
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

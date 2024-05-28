import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../../../../Model/Const/height_width.dart';
import '../../../../Model/Const/text_const.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    super.key,
    required this.onchange,
    required this.controller,
    required this.text,
    required this.limitLength,
    required this.optionalisEmpty,
    required this.inputformat,
    required this.star,
    required this.inputtype,
    required this.enabled,required this.valueLength
  });

  final TextEditingController controller;
  final int valueLength;
  final  onchange;
  final String text;
  final inputformat;
  final optionalisEmpty;
  final int limitLength;
  final star;
  final inputtype;
  final enabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: primaryWidth,
      child: TextFormField(
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
                  text:text,
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
        onChanged: onchange,
        enabled:enabled,
         style:textStyleBlack18,
      ),
    );
  }

  String? validMethod(value) {
    if (optionalisEmpty == true) {
      if (value == null || value.isEmpty) {
        return "Please enter $text";
      } else if (value.length < valueLength) {
        return 'Please enter Valid $text';
      }
      return null;
    }else if (value.length == 0) {
      return null;
    } else if (value.length < valueLength) {
      return "Please enter Valid $text";
    }
    return null;
  }
}

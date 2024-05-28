import 'package:flutter/material.dart';

import '../../../Model/Const/color.dart';
import '../../../Model/Const/height_width.dart';
import '../../../Model/Const/padding_const.dart';
import '../../../Model/Const/text_const.dart';

class LongButton extends StatelessWidget {
  const LongButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isEnabled,
    required this.formKey,
  }) : super(key: key);
  final String text;
  final bool isEnabled;
  final onPressed;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: all,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(primaryWidth, primaryHeight),
            backgroundColor: formButtonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: isEnabled
            ? () {
                if (formKey.currentState!.validate()) {
                  onPressed();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill out all mandatory fields.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              }
            : null,
        child: Text(text, style: textStyleWhite18),
      ),
    );
  }
}

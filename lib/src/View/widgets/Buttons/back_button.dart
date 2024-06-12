import 'package:flutter/material.dart';

import '../../../Model/Const/color.dart';
import '../../../Model/Const/height_width.dart';
import '../../../Model/Const/text_const.dart';

class Backbutton extends StatelessWidget {
  const Backbutton({
    Key? key,
    required this.text,
    required this.isEnabled,
  }) : super(key: key);

  final String text;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: black,
        minimumSize: const Size(nextButtonWidth, nextButtonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: isEnabled ? () => Navigator.pop(context) : null,
      child: Text(text, style: textStyleWhite18),
    );
  }
}

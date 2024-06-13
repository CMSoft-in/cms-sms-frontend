import 'package:flutter/material.dart';

import '../../../Model/Const/color.dart';
import '../../../Model/Const/height_width.dart';
import '../../../Model/Const/text_const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressEvent,
    required this.buttonText,
    required this.backgroundColor,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressEvent;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressEvent,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // This sets the button color to red
        minimumSize: const Size(nextButtonWidth, nextButtonHeight),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(buttonText, style: textStyleWhite18),
    );
  }
}

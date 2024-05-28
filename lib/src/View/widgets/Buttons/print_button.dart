import 'package:flutter/material.dart';

import '../../../Model/Const/color.dart';
import '../../../Model/Const/height_width.dart';
import '../../../Model/Const/text_const.dart';
class PrintButton extends StatelessWidget {
  const PrintButton({super.key,this.text,this.onpress,this.printbuttonWidth});
  final text;
  final onpress;
  final printbuttonWidth;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: formButtonColor,
          minimumSize: Size(printbuttonWidth, deleteprintHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed:()=>  onpress,
        child: Text(text, style: textStyleWhite18),
      ),
    );
  }
}
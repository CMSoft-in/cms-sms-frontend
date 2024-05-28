import 'package:flutter/material.dart';

import '../../../Model/Const/color.dart';
import '../../../Model/Const/height_width.dart';
import '../../../Model/Const/text_const.dart';
class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key,this.text,this.onpress});
  final text;
  final onpress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: black,
        minimumSize:  Size(deleteButtonWidth, deleteprintHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed:  () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>onpress)),
      child: Text(text, style: textStyleWhite18),
    );
  }
}
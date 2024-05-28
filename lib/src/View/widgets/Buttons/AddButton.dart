import 'package:flutter/material.dart';
import '../../../Model/Const/color.dart';
import '../../../Model/Const/height_width.dart';
import '../../../Model/Const/padding_const.dart';
import '../../../Model/Const/text_const.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key, required this.onPressed, required this.addtext})
      : super(key: key);
  final addtext;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: right10,
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => onPressed));
          },
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(addButtonWidth, addButtonHeight),
              backgroundColor: formButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: Text(addtext, style: textStyleWhite18)),
    );
  }
}

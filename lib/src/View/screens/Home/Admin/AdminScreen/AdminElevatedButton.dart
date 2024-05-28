// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Model/Const/color.dart';
import '../../../../../Model/Const/height_width.dart';
import '../../../../../Model/Const/text_const.dart';

class BuildElevatedButton extends StatelessWidget {
  const BuildElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.label})
      : super(key: key);
  final icon;
  final label;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (contect) => onPressed));
      },
      icon: SvgPicture.asset(icon),
      label: Text(
        label,
        style: textStyleBoldBlack18,
      ),
      style: ElevatedButton.styleFrom(
          elevation: 10,
          minimumSize: const Size(adminEleBtnWidth, adminEleBtnHeight),
          backgroundColor: white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}

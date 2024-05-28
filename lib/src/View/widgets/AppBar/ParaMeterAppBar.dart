// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../../Model/Const/color.dart';
import '../../../Model/Const/image_const.dart';

class ParaMeterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ParaMeterAppBar({Key? key, required this.drawerOrIcon})
      : super(key: key);
  final drawerOrIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: white,
      title: Center(
          child: Image.asset(
        titleImage,
        fit: BoxFit.fill,
      )),
      leading: drawerOrIcon,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

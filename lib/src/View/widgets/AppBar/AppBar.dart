import 'package:flutter/material.dart';

import '../../../Model/Const/color.dart';
import '../../../Model/Const/image_const.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({Key? key}) : super(key: key);

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
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

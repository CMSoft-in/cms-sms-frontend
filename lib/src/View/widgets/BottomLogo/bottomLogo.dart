import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Model/Const/color.dart';

import '../../../Model/Const/padding_const.dart';
import '../../../Model/Const/text_const.dart';

class BottomLogo extends StatelessWidget {
  const BottomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: bottom10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: right10,
                  child: Text('Powered by',
                      style: TextStyle(
                          color: poweredbycolor, fontWeight: fontWeight)),
                ),
                SvgPicture.asset(
                  'assets/logo.svg',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Model/Const/padding_const.dart';
import '../../../Model/Const/text_const.dart';

class StackText extends StatelessWidget {
  const StackText({Key? key, required this.stacktext, required this.color})
      : super(key: key);
  final stacktext;
  final color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: left20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  stacktext,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: fontFamily,
                    fontSize: fontSize18,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

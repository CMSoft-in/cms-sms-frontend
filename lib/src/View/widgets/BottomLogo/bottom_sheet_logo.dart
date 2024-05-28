import 'package:flutter/material.dart';

import '../../../Model/Const/color.dart';
import 'bottomLogo.dart';

class BottomSheetLogo extends StatelessWidget {
  const BottomSheetLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: white,
      child: const BottomLogo(),
    );
  }
}

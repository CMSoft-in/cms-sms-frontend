import 'package:flutter/material.dart';

import '../../../Model/Const/text_const.dart';

class DetailsText extends StatelessWidget {
  const DetailsText({Key? key, required this.enterDetails}) : super(key: key);

  final enterDetails;
  @override
  Widget build(BuildContext context) {

    return Text(
      enterDetails,
      style: textStyle20,
      textAlign: TextAlign.center,
    );
  }
}

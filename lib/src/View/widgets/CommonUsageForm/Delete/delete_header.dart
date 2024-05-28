import 'package:flutter_svg/svg.dart';
import '../../../../Model/Const/padding_const.dart';
import '../../../../Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeleteHeader extends StatelessWidget {
  const DeleteHeader({
    super.key,
    required this.deleteText,
    required this.image,
  });
  final deleteText;
  final image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Padding(
            padding: left20,
            child: SvgPicture.asset(image),
          ),
          Padding(
            padding: left20,
            child: Text(
              deleteText,
              style: textStyleBoldBlack18,
            ),
          ),
        ],
     ),
);
}
}
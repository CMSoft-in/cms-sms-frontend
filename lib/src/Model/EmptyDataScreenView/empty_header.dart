import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../View/widgets/Buttons/AddButton.dart';
import '../Const/padding_const.dart';
import '../Const/text_const.dart';

class EmptyViewHeaderBar extends StatelessWidget {
  const EmptyViewHeaderBar(
      {Key? key,
      required this.image,
      required this.onpress,
      required this.text})
      : super(key: key);
  final image;
  final text;
  final onpress;
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
              text,
              style: textStyleBoldBlack18,
            ),
          ),
          const Spacer(),
          Padding(
            padding: right10,
            child: AddButton(onPressed: onpress, addtext: "Add"),
          )
        ],
      ),
    );
  }
}

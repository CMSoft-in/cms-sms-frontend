import '../../../Model/Const/image_const.dart';
import '../../../Model/Const/padding_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'DetailsText.dart';
import '../../../Model/Const/height_width.dart';

class ViewDetailsText extends StatelessWidget {
  const ViewDetailsText(
      {Key? key,
      required this.editOnPress,
      required this.deleteOnPress,
      required this.viewClientDetailsTextt})
      : super(key: key);
  final editOnPress;
  final deleteOnPress;
  final viewClientDetailsTextt;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 320;
    return Row(children: [
      Padding(
        padding: isMobile ? left10 : left30,
        child: DetailsText(enterDetails: viewClientDetailsTextt),
      ),
      const Spacer(),
      Padding(
          padding: isMobile ? right10 : right20,
          child: SizedBox(
            width: editdeleteWidth,
            height: editdeleteHeight,
            child: FloatingActionButton(
              onPressed: editOnPress,
              child: SvgPicture.asset(editicon),
            ),
          )),
      Padding(
          padding: isMobile ? right10 : right20,
          child: SizedBox(
            width: editdeleteWidth,
            height: editdeleteHeight,
            child: FloatingActionButton(
              onPressed: () {
                // Show confirmation dialog when delete button is pressed
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return deleteOnPress;
                    });
              },
              child: SvgPicture.asset(deleteicon),
            ),
          )),
    ]);
  }
}

import '/src/View/widgets/Buttons/validate_button.dart';
import '/src/Model/Const/color.dart';
import 'package:flutter/material.dart';
import '../../../Model/Const/height_width.dart';
import '../../../Model/Const/text_const.dart';
import 'back_button.dart';

class BackNextButton extends StatelessWidget {
  const BackNextButton({
    Key? key,
    required this.formKey,
    required this.isEnabled,
    required this.onPress,
  }) : super(key: key);

  final bool isEnabled;
  final formKey;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final isMobile = screenSize.width < 600;
    return Container(
      color: white,
      child: SizedBox(
        width: primaryWidth,
        /*isMobile ? primaryWidth : screenSize.width * 0.8,
        height: isMobile ? primaryHeight : primaryHeight,*/
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Backbutton(
              text: backText,
              isEnabled: isEnabled,
            ),
            formSizebox8,
            ValidateButton(
              formKey: formKey,
              text: nextText,
              onPressed: onPress,
            ),
          ],
        ),
      ),
    );
  }
}

import '/src/View/widgets/Buttons/print_button.dart';
import '/src/Model/Const/color.dart';
import'package:flutter/material.dart';

import '../../../../Model/Const/height_width.dart';
import '../../../../Model/Const/padding_const.dart';
import '../delete_button.dart';

class DeletePrintButton extends StatelessWidget {
  const DeletePrintButton({super.key,this.deleteonpress,this.deleteText,this.printonPress,this.printText});
  final deleteonpress;
  final deleteText;
  final printonPress;
  final printText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child:Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            DeleteButton(
              text: deleteText,
            onpress: deleteonpress,
            ),
            
            Padding(
              padding: left10,
              child: PrintButton(
               printbuttonWidth: printButtonWidth,
                text: printText,
                onpress: printonPress,
              ),
            ),
          ],
        ), 
    );
  }
}
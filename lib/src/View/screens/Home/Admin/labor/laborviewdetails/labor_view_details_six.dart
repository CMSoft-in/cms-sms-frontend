import '/src/Model/Const/padding_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_width.dart';
import '../labor_text_const.dart';

class LaborViewDetailsSix extends StatelessWidget {
  const LaborViewDetailsSix(
      {Key? key,
      required this.teamMemberController,
      required this.rateController,
      required this.enabled})
      : super(key: key);
  final TextEditingController teamMemberController;
  final TextEditingController rateController;
 
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
        formSizebox10,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        TextFormFieldWidth(
          Width: 250,
          controller: teamMemberController,
          text: teamMember,
          limitLength: 35,
          star: estar,
          inputformat: number,
          optionalisEmpty: false,
          inputtype: keyboardTypeNumber,
          enabled: enabled,
        ),
        formSizebox10,
       Padding(
         padding:left10,
         child: TextFormFieldWidth(
            Width: 80,
            controller: rateController,
            text: rate,
            limitLength: 6,
            star: estar,
            inputformat: number,
            optionalisEmpty: false,
            inputtype: keyboardTypeNumber,
            enabled: enabled,
          ),
       ),
        ],)
      ]),
    );
  }
}

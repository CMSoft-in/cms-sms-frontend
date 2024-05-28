import '../labor_outturn_text.dart';
import '/src/Model/Const/padding_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_width.dart';

class LaborOuttrnViewDetailsTWo extends StatelessWidget {
  const LaborOuttrnViewDetailsTWo(
      {Key? key,
      required this.teamMemberController,
      required this.outturnMeasurementController,
      required this.dailyOuttrnController,
      required this.countController,
      required this.enabled})
      : super(key: key);
  final TextEditingController teamMemberController;
  final TextEditingController outturnMeasurementController;
  final TextEditingController dailyOuttrnController;

  final TextEditingController countController;

  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        formSizebox10,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldWidth(
              Width: 110,
              controller: dailyOuttrnController,
              text: dailyOuttrn,
              limitLength: 35,
              star: estar,
              inputformat: number,
              optionalisEmpty: false,
              inputtype: keyboardTypeNumber,
              enabled: enabled,
            ),
            formSizebox10,
            Padding(
              padding: left10,
              child: TextFormFieldWidth(
                Width: 210,
                controller: outturnMeasurementController,
                text: outturnMeasurement,
                limitLength: 6,
                star: estar,
                inputformat: number,
                optionalisEmpty: false,
                inputtype: keyboardTypeNumber,
                enabled: enabled,
              ),
            ),
          ],
        ),
        formSizebox10,
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldWidth(
              Width: 210,
              controller: teamMemberController,
              text: teamMeamber,
              limitLength: 35,
              star: estar,
              inputformat: number,
              optionalisEmpty: false,
              inputtype: keyboardTypeNumber,
              enabled: enabled,
            ),
            formSizebox10,
            Padding(
              padding: left10,
              child: TextFormFieldWidth(
                Width: 110,
                controller: countController,
                text: count,
                limitLength: 6,
                star: estar,
                inputformat: number,
                optionalisEmpty: false,
                inputtype: keyboardTypeNumber,
                enabled: enabled,
              ),
            ),
          ],
          
        ),
        formSizebox10,
        GestureDetector(
          child: Text(addTeamBreakup,style: textStyleBoldBlack18,),
          onTap: (){

          },
        )
      ]),
    );
  }
}

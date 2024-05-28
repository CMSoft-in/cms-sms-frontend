import 'package:cmssms/src/View/widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../labor_outturn_text.dart';
import '/src/Model/Const/padding_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_width.dart';

class LaborOuttrnViewDetailsThree extends StatelessWidget {
  const LaborOuttrnViewDetailsThree(
      {Key? key,
      required this.companyRateController,
      required this.outturnMeasurementController,
      required this.thresholdLimitController,
      required this.countController,
      required this.enabled})
      : super(key: key);
  final TextEditingController companyRateController;
  final TextEditingController outturnMeasurementController;
  final TextEditingController thresholdLimitController;

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
              Width: 120,
              controller: companyRateController,
              text: companyRate,
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
        TextformField(
            controller: thresholdLimitController,
            text: thresholdLimit,
            limitLength: 40,
            optionalisEmpty: false,
            inputformat: alphabatsAndNumbers,
            star: estar,
            inputtype: keyboardTypeNone,
            enabled: enabled)
      ]),
    );
  }
}

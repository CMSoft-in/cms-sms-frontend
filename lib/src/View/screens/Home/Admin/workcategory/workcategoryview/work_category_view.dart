import '/src/View/widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';
import '../../../../../../Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../work_category_text.dart';

class WorkCategoryView extends StatelessWidget {
  const WorkCategoryView(
      {super.key,
      required this.enabled,
      required this.workCategoryController,
      required this.categorydistributionController,
      required this.outturnValueController,
      required this.outturnMeasurementController});
  final enabled;
  final TextEditingController workCategoryController;
  final TextEditingController categorydistributionController;
  final TextEditingController outturnMeasurementController;
  final TextEditingController outturnValueController;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          formSizebox10,
          TextformField(
            controller: workCategoryController,
            text: workCategoryText,
            star: star,
            limitLength: 20,
            optionalisEmpty: true,
            inputformat: alphabatsSpace,
            inputtype: keyboardTypeNone,
            enabled: enabled,
          ),
          formSizebox10,
          MaxMinTextFormField(
              controller: categorydistributionController,
              text: categorydistribution,
              limitLength: 150,
              optionalisEmpty: true,
              inputformat: alphabatsAndNumbers,
              star: star,
              inputtype: keyboardTypeNone,
              enabled: enabled,
              maxLines: 5,
              minLines: 5),
          formSizebox10,
          TextformField(
            controller: outturnValueController,
            text: outturnValue,
            star: star,
            limitLength: 20,
            optionalisEmpty: true,
            inputformat: number,
            inputtype: keyboardTypeNone,
            enabled: enabled,
          ),
          formSizebox10,
          TextformField(
            controller: outturnMeasurementController,
            text: outturnMeasurement,
            star: star,
            limitLength: 20,
            optionalisEmpty: true,
            inputformat: number,
            inputtype: keyboardTypeNone,
            enabled: enabled,
          )
        ],
      ),
    );
  }
}

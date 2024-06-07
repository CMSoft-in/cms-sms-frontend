import 'package:cmssms/src/View/widgets/CommonUsageForm/textformfeild/datepicker/date_picker_text_form_field.dart';
import 'package:cmssms/src/View/widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';

import '/src/View/widgets/CommonUsageForm/HintText.dart';
import '/src/View/widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '/src/Model/Const/height_width.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';

class SiteViewDetailsTwo extends StatelessWidget {
  const SiteViewDetailsTwo(
      {super.key,
      required this.enabled,
      required this.isEditing,
      required this.expectedCompletionDateController,
      required this.projectSizeController,
      required this.projectStartDateController,
      required this.projectWorkDescriptionofController,
      required this.projectWorkNameController});
  final bool enabled;
  final bool isEditing;
  final TextEditingController projectWorkNameController;
  final TextEditingController projectWorkDescriptionofController;
  final TextEditingController projectSizeController;
  final TextEditingController projectStartDateController;
  final TextEditingController expectedCompletionDateController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StackText(stacktext: projectDetails, color: grey),
        formSizebox10,
        TextformField(
            controller: projectWorkNameController,
            text: projectWorkName,
            limitLength: 20,
            optionalisEmpty: true,
            inputformat: alphabatsSpace,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: enabled),
        formSizebox10,
     
        MaxMinTextFormField(
          maxLines:4 ,
          minLines: 1,
            controller: projectWorkDescriptionofController,
            text: shortDescriptionofProjectWork,
            limitLength: 120,
            optionalisEmpty: true,
            inputformat: alphabatsAndNumbers,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: enabled),
        formSizebox10,
        TextformField(
            controller: projectSizeController,
            text: projectSize,
            limitLength: 10,
            optionalisEmpty: true,
            inputformat: number,
            star: star,
            inputtype: keyboardTypeNumber,
            enabled: enabled),
        formSizebox10,
        isEditing ?
        DateTextFormField(
            controller: projectStartDateController,
            text: projectStartDate,
            optionalisEmpty: true,
            star: star,
            enabled: enabled)
       : TextformField(
            controller: projectStartDateController,
            text: projectStartDate,
            limitLength: 14,
            optionalisEmpty: true,
            inputformat: alphabatsAndNumbers,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: enabled),
        formSizebox10,
        isEditing ?
        DateTextFormField(
            controller: expectedCompletionDateController,
            text: expectedCompletionDate,
            optionalisEmpty: false,
            star: estar,
            enabled: enabled)
       :
        TextformField(
            controller: expectedCompletionDateController,
            text: expectedCompletionDate,
            limitLength: 14,
            optionalisEmpty: false,
            inputformat: alphabatsAndNumbers,
            star: estar,
            inputtype: keyboardTypeNumber,
            enabled: enabled),
      ],
    );
  }
}

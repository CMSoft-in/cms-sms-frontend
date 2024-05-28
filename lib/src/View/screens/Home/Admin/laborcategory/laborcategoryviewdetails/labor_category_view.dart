import '/src/View/widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';

import '../../../../../../Model/Const/text_const.dart';
import '../labor_category_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';

class LaborCategoryViewDetails extends StatelessWidget {
  const LaborCategoryViewDetails(
      {super.key,
      required this.enabled,
      required this.laborCategoryController,
      required this.categorydistributionController});
  final enabled;
  final TextEditingController laborCategoryController;
  final TextEditingController categorydistributionController;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          formSizebox10,
          TextformField(
            controller: laborCategoryController,
            text: laborCategoryText,
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
              minLines: 5)
        ],
      ),
    );
  }
}

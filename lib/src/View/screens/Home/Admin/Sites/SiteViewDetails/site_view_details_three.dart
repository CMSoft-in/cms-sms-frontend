import '/src/View/widgets/CommonUsageForm/HintText.dart';
import '/src/View/widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/height_width.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/utility/sites/site_text_const.dart';

class SiteViewDetailsThree extends StatelessWidget {
  const SiteViewDetailsThree(
      {super.key,
      required this.enabled,
      required this.companySiteEngineersAllocatedController,
      required this.laborsAllocatedController});
  final bool enabled;
  final TextEditingController companySiteEngineersAllocatedController;
  final TextEditingController laborsAllocatedController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StackText(stacktext: siteAllocation, color: grey),
        formSizebox10,
        TextformField(
            controller: companySiteEngineersAllocatedController,
            text: companySiteEngineersAllocated,
            limitLength: 120,
            optionalisEmpty: false,
            inputformat: alphabatsSpace,
            star: estar,
            inputtype: keyboardTypeNone,
            enabled: enabled),
        formSizebox10,
        TextformField(
            controller: laborsAllocatedController,
            text: laborsAllocated,
            limitLength: 120,
            optionalisEmpty: false,
            inputformat: alphabatsAndNumbers,
            star: estar,
            inputtype: keyboardTypeNone,
            enabled: enabled)
      ],
    );
  }
}

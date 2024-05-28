import '/src/View/widgets/CommonUsageForm/HintText.dart';
import '/src/View/widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '/src/Model/Const/height_width.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';

class SiteViewDetailsFive extends StatelessWidget {
  const SiteViewDetailsFive({super.key, required this.enabled,required this.governmentApprovalsController});
  final bool enabled;
  final TextEditingController governmentApprovalsController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StackText(stacktext: siteDocumentation, color: grey),
        formSizebox10,
        TextformField(
            controller: governmentApprovalsController,
            text: governmentApprovals,
            limitLength: 40,
            optionalisEmpty: false,
            inputformat: alphabatsAndNumbers,
            star: estar,
            inputtype: keyboardTypeNone,
            enabled: enabled)
      ],
    );
  }
}

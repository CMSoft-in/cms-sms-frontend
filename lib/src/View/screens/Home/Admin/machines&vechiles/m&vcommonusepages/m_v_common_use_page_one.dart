import "package:flutter/material.dart";

import "../../../../../../Model/Const/height_width.dart";
import "../../../../../../Model/Const/text_const.dart";
import "../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart";

class MVCommonBasicFormOne extends StatelessWidget {
  const MVCommonBasicFormOne(
      {super.key,
      required this.enabled,
      required this.NameController,
      required this.secondNameController,
      required this.nameOne,required this.nameTwo
      });
  final bool enabled;
  final TextEditingController NameController;
  final String nameOne;
  final String nameTwo;
  final TextEditingController secondNameController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextformField(
          controller: NameController,
          text: nameOne,
          star: star,
          limitLength: 20,
          optionalisEmpty: true,
          inputformat: alphabatsAndNumbers,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),
        formSizebox10,
        TextformField(
          controller: secondNameController,
          text: nameTwo,
          limitLength: 20,
          star: star,
          inputformat: alphabatsSpace,
          optionalisEmpty: true,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),

      ],
    );
  }
}

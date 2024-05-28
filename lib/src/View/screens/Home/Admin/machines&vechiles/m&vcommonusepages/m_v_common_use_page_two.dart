import "package:flutter/material.dart";

import "../../../../../../Model/Const/color.dart";
import "../../../../../../Model/Const/height_width.dart";
import "../../../../../../Model/Const/text_const.dart";
import "../../../../../widgets/CommonUsageForm/HintText.dart";
import "../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart";
import "../m_v_text.dart";

class MVCommonBasicFormTwo extends StatelessWidget {
  const MVCommonBasicFormTwo(
      {super.key,
      required this.enabled,
      required this.stackText,
      required this.CompanyController,
      required this.ModelController,
      required this.yearofMakeController,
     
      });
  final bool enabled;
  final TextEditingController CompanyController;
  final String stackText;
  final TextEditingController ModelController;
   final TextEditingController yearofMakeController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          StackText(
        stacktext: stackText,
        color: grey,
      ),
      formSizebox10,
        TextformField(
          controller: CompanyController,
          text: company,
          star: star,
          limitLength: 50,
          optionalisEmpty: true,
          inputformat: alphabatsAndNumbers,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),
        formSizebox10,
        TextformField(
          controller: ModelController,
          text: model,
          limitLength: 20,
          star: star,
          inputformat: alphabatsAndNumbers,
          optionalisEmpty: true,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),
           formSizebox10,
        TextformField(
          controller: yearofMakeController,
          text: yearofMake,
          star: star,
          limitLength: 10,
          optionalisEmpty: true,
          inputformat: number,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),
      ],
    );
  }
}

import "package:flutter/material.dart";
import "../../../../../../Model/Const/height_width.dart";
import "../../../../../../Model/Const/text_const.dart";
import "../../../../../widgets/CommonUsageForm/textformfeild/datepicker/date_picker_text_form_field.dart";
import "../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart";
import "../m_v_text.dart";

class MVCommonBasicFormFour extends StatelessWidget {
  const MVCommonBasicFormFour(
      {super.key,
      required this.enabled,
      required this.insuranceExpiryDateController,
      required this.nextFCDateController,
      required this.isEditing
      });
  final bool enabled;
  final bool isEditing;
  final TextEditingController insuranceExpiryDateController;
  final TextEditingController nextFCDateController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox10,
        isEditing?
      DateTextFormField(controller: insuranceExpiryDateController, 
      text: insuranceExpiryDate,
        optionalisEmpty: false,
         star: estar,
          enabled: enabled)
      :
        TextformField(
          controller: insuranceExpiryDateController,
          text: insuranceExpiryDate,
          star: estar,
          limitLength: 20,
          optionalisEmpty: false,
          inputformat: alphabatsAndNumbers,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),
        formSizebox10,
           isEditing?
      DateTextFormField(controller: nextFCDateController, 
      text: nextFCDate,
        optionalisEmpty: false,
         star: estar,
          enabled: enabled)
      :
        TextformField(
          controller: nextFCDateController,
          text: nextFCDate,
          limitLength: 20,
          star: estar,
          inputformat: alphabatsAndNumbers,
          optionalisEmpty: false,
          inputtype: keyboardTypeNone,
          enabled: enabled,
        ),

      ],
    );
  }
}

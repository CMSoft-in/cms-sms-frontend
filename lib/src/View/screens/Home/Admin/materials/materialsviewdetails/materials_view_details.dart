import '/src/View/widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';
import '../../../../../../Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../materials_text.dart';

class MaterialsViewDetails extends StatelessWidget {
  const MaterialsViewDetails(
      {super.key,
      required this.enabled,
      required this.isEditing,
      required this.materialController,
      required this.variantController,
      required this.quantityMeasurementController,
      required this.quantityValuesController,
      required this.hSNCodeController,
      required this.cGstController,
      required this.sGstController,
      required this.iGstController,
      });
  final bool enabled;
  final bool isEditing;
  final TextEditingController materialController;
  final TextEditingController variantController;
  final TextEditingController quantityValuesController;
  final TextEditingController quantityMeasurementController;
    final TextEditingController hSNCodeController;
  final TextEditingController cGstController;
  final TextEditingController sGstController;
  final TextEditingController iGstController;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          formSizebox10,
          TextformField(
            controller: materialController,
            text: material,
            star: star,
            limitLength: 20,
            optionalisEmpty: true,
            inputformat: alphabatsSpace,
            inputtype: keyboardTypeNone,
            enabled: enabled,
          ),
          formSizebox10,
          TextformField(
            controller: variantController,
            text: variant,
            star: star,
            limitLength: 20,
            optionalisEmpty: true,
            inputformat: alphabatsAndNumbers,
            inputtype: keyboardTypeNone,
            enabled: enabled,
          ),
          formSizebox10,
          isEditing?
          DropDownForm(dropdownItems: ["10.00","20.00","15.00"],
           dropDownName: quantityValues,
            star: star, 
            optionalisEmpty: true,
             controller: quantityValuesController)
          :TextformField(
            controller: quantityValuesController,
            text: quantityValues,
            star: star,
            limitLength: 20,
            optionalisEmpty: true,
            inputformat: alphabatsAndNumbers,
            inputtype: keyboardTypeNone,
            enabled: enabled,
          ),
            formSizebox10,
            isEditing?
          DropDownForm(dropdownItems: ['Tons','Unit'],
           dropDownName: quantityMeasurement,
            star: star, 
            optionalisEmpty: true,
             controller: quantityMeasurementController)
          :TextformField(
            controller: quantityMeasurementController,
            text: quantityMeasurement,
            star: star,
            limitLength: 20,
            optionalisEmpty: true,
            inputformat: alphabatsAndNumbers,
            inputtype: keyboardTypeNone,
            enabled: enabled,
          ),
           formSizebox10,
          TextformField(
            controller: hSNCodeController,
            text: hSNCode,
            star: estar,
            limitLength: 20,
            optionalisEmpty: false,
            inputformat: alphabatsAndNumbers,
            inputtype: keyboardTypeNone,
            enabled: enabled,
          ),
             formSizebox10,
          TextformField(
            controller: cGstController,
            text: cGst,
            star: estar,
            limitLength: 20,
            optionalisEmpty: false,
            inputformat: alphabatsAndNumbers,
            inputtype: keyboardTypeNone,
            enabled: enabled,
          ),
             formSizebox10,
          TextformField(
            controller: sGstController,
            text: sGst,
            star: estar,
            limitLength: 20,
            optionalisEmpty: false,
            inputformat: alphabatsAndNumbers,
            inputtype: keyboardTypeNone,
            enabled: enabled,
          ),
             formSizebox10,
          TextformField(
            controller: iGstController,
            text: iGst,
            star: estar,
            limitLength: 20,
            optionalisEmpty: false,
            inputformat: alphabatsAndNumbers,
            inputtype: keyboardTypeNone,
            enabled: enabled,
          ),
        ],
      ),
    );
  }
}

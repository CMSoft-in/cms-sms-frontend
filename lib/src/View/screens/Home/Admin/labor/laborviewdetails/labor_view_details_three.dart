import '/src/View/widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../labor_text_const.dart';

class LaborViewDetailsThree extends StatelessWidget {
  const LaborViewDetailsThree(
      {Key? key,
      required this.aadharfilePathController,
      required this.aadharController,
      required this.siteWorkedController,
      required this.cuurentSiteAllocationController,
      required this.enabled,
      required this.isEditing})
      : super(key: key);
  final TextEditingController aadharfilePathController;
  final TextEditingController aadharController;
  final TextEditingController siteWorkedController;
  final TextEditingController cuurentSiteAllocationController;
  final bool isEditing;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      formSizebox10,
      // FilePickerr(
      //     optionalisEmpty: false,
      //     text: "Aadhar",
      //     star: estar,
      //     filePathController: aadharfilePathController),
      formSizebox10,
      TextformField(
          controller: aadharController,
          text: aadharNumber,
          limitLength: 12,
          optionalisEmpty: true,
          inputformat: number,
          star: star,
          inputtype: keyboardTypeNumber,
          enabled: enabled),
      formSizebox10,
      TextformField(
          controller: siteWorkedController,
          text: siteWorked,
          limitLength: 30,
          optionalisEmpty: true,
          inputformat: alphabatsAndNumbers,
          star: star,
          inputtype: keyboardTypeNone,
          enabled: enabled),
          formSizebox10,
          isEditing?
      DropDownForm(
          dropdownItems: ['chennai', 'Theni','2'],
          dropDownName: cuurentSiteAllocation,
          star: estar,
          optionalisEmpty: false,
          controller: cuurentSiteAllocationController):
          TextformField(
          controller: cuurentSiteAllocationController,
          text: cuurentSiteAllocation,
          limitLength: 30,
          optionalisEmpty: false,
          inputformat: alphabatsSpace,
          star: estar,
          inputtype: keyboardTypeNone,
          enabled: enabled),
    ]);
  }
}

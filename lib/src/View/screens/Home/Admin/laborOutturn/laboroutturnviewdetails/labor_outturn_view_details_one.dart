import 'package:cmssms/src/View/screens/Home/Admin/laborOutturn/labor_outturn_text.dart';
import 'package:cmssms/src/View/screens/Home/Admin/workcategory/work_category_text.dart';
import 'package:cmssms/src/View/widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';
import 'package:cmssms/src/View/widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';

class LaborOutturnViewDetailsOne extends StatelessWidget {
  const LaborOutturnViewDetailsOne(
      {Key? key,
      required this.workCategorycontroller,
      required this.laborCategorycontroller,
      required this.isEditing,
      required this.enabled})
      : super(key: key);
  final TextEditingController workCategorycontroller;
  final TextEditingController laborCategorycontroller;
  final bool isEditing;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      formSizebox15,
      isEditing
          ? DropDownForm(
              dropdownItems: ["Mesan","Painter","StoneWorker"],
              dropDownName: workCategoryText,
              star: star,
              optionalisEmpty: true,
              controller: workCategorycontroller)
          : TextformField(
              controller: workCategorycontroller,
              text: workCategoryText,
              limitLength: 40,
              optionalisEmpty: true,
              inputformat: alphabatsAndNumbers,
              star: star,
              inputtype: keyboardTypeNone,
              enabled: enabled),
              formSizebox10,
      isEditing
          ? DropDownForm(
              dropdownItems: ["Mesan","Painter","StoneWorker"],
              dropDownName: laborCategoryText,
              star: star,
              optionalisEmpty: true,
              controller: laborCategorycontroller)
          : TextformField(
              controller: laborCategorycontroller,
              text: laborCategoryText,
              limitLength: 40,
              optionalisEmpty: true,
              inputformat: alphabatsAndNumbers,
              star: star,
              inputtype: keyboardTypeNone,
              enabled: enabled)
    ]);
  }
}

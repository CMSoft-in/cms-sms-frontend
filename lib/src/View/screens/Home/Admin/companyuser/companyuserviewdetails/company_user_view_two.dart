import 'package:cmssms/src/View/widgets/CommonUsageForm/textformfeild/datepicker/date_picker_text_form_field.dart';

import '/src/View/widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../companyuser_text.dart';


class CompanyUserViewDetailsTwo extends StatelessWidget {
  const CompanyUserViewDetailsTwo(
      {Key? key,
      required this.bloodGroupController,
      required this.joinDateController,
      required this.officeDesignationController,
      required this.applicationRoleController,
      required this.enabled,
      required this.isEditing})
      : super(key: key);
  final TextEditingController bloodGroupController;
  final TextEditingController joinDateController;
  final TextEditingController officeDesignationController;
  final TextEditingController applicationRoleController;
  final bool enabled;
  final bool isEditing;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      formSizebox10,
      TextformField(
        controller: bloodGroupController,
        text: bloodGroup,
        limitLength: 6,
        star: star,
        inputformat: alphabatsAndNumbers,
        optionalisEmpty: true,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      formSizebox10,
     isEditing?
      DateTextFormField(controller: joinDateController, 
      text: joinDate,
        optionalisEmpty: true,
         star: star,
          enabled: enabled)
      :TextformField(
        controller: joinDateController,
        text: joinDate,
        star: star,
        limitLength: 8,
        optionalisEmpty: true,
        inputformat: alphabatsAndNumbers,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      formSizebox10,
       isEditing?
      DropDownForm(dropdownItems: ["Site Engineer","SIte Manager","Admin 1"], 
      dropDownName: officeDesignation, 
      star: star,
       optionalisEmpty: true,
        controller: officeDesignationController)
      :
      TextformField(
        controller: officeDesignationController,
        text: officeDesignation,
        star: star,
        limitLength: 25,
        optionalisEmpty: true,
        inputformat: alphabatsSpace,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      
      formSizebox10,
      isEditing?
      DropDownForm(dropdownItems: ["Site Engineer","SIte Manager","Admin 1"], 
      dropDownName: applicationRole, 
      star: star,
       optionalisEmpty: true,
        controller: applicationRoleController)
      :TextformField(
        controller: applicationRoleController,
        text: applicationRole,
        star: star,
        limitLength: 25,
        optionalisEmpty: true,
        inputformat: alphabatsSpace,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      )
    ,]);
  }
}

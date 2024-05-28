import 'package:flutter/material.dart';

import '../../View/widgets/CommonUsageForm/HintText.dart';
import '../../View/widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';
import '../../View/widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../Const/color.dart';
import '../Const/height_width.dart';
import '../Const/text_const.dart';
import '../api/ifsccode.api.dart';

class CommonBasicFormTwo extends StatelessWidget {
  const CommonBasicFormTwo(
      {Key? key,
      
    required this.accountNameController,
      required this.accountNumberController,
      required this.accountTypeController,
      required this.bankLocationController,
      required this.bankNameController,
      required this.ifscCodeController,
      required this.enabled,
      required this.isEditing})
      : super(key: key);
  final TextEditingController accountNameController;
  final TextEditingController accountNumberController;
  final TextEditingController accountTypeController;
  final TextEditingController bankLocationController;
  final TextEditingController bankNameController;
  final TextEditingController ifscCodeController;
  final bool enabled;
  final bool isEditing;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      
      formSizebox10,
      const StackText(
        stacktext: bankAccountDetails,
        color: grey,
      ),
      formSizebox10,
      TextformField(
        controller: accountNumberController,
        text: accountNumber,
        limitLength: 20,
        star: estar,
        inputformat: number,
        optionalisEmpty: false,
        inputtype: keyboardTypeNumber,
        enabled: enabled,
      ),
      formSizebox10,
      IFSCAPI(
        bankControllerName: bankNameController,
        bankControllerLocation: bankLocationController,
        ifscCodeController: ifscCodeController,
        optionalisEmpty: false,
        star: estar,
        enabled: enabled,
        valueLength: 11,
      ),
      formSizebox10,
      TextformField(
        controller:accountNameController ,
        text: accountName,
        star: estar,
        limitLength: 20,
        optionalisEmpty: false,
        inputformat: alphabats,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      formSizebox10,
      isEditing?
      DropDownForm(dropdownItems: ["Saving","Current",], 
      dropDownName: accountType, 
      star: estar,
       optionalisEmpty: false,
        controller: accountTypeController)
      :
      TextformField(
        controller: accountTypeController,
        text: accountType,
        star: estar,
        limitLength: 20,
        optionalisEmpty: false,
        inputformat: alphabats,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      formSizebox10,
      TextformField(
        controller: bankNameController,
        text: bankName,
        star: estar,
        limitLength: 20,
        optionalisEmpty: false,
        inputformat: alphabats,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      formSizebox10,
      TextformField(
        controller: bankLocationController,
        text: bankLocation,
        star: estar,
        limitLength: 20,
        optionalisEmpty: false,
        inputformat: alphabats,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
    ]);
  }
}

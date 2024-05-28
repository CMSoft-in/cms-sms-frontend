import 'package:flutter/material.dart';
import '../../../../../../Model/general/common_basic_form_two.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../labor_text_const.dart';

class LaborViewDetailsFive extends StatelessWidget {
  const LaborViewDetailsFive(
      {Key? key,
      required this.gpayNumber,
      required this.accountNameController,
      required this.accountNumberController,
      required this.accountTypeController,
      required this.bankLocationController,
      required this.bankNameController,
      required this.ifscCodeController,
      required this.isEditing,
      required this.enabled})
      : super(key: key);
  final TextEditingController gpayNumber;
  final TextEditingController accountNumberController;
  final TextEditingController bankNameController;
  final TextEditingController bankLocationController;
  final TextEditingController ifscCodeController;
  final TextEditingController accountNameController;
  final TextEditingController accountTypeController;
  final bool enabled;
  final bool isEditing;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      formSizebox10,
      TextformField(
        controller: gpayNumber,
        text: gPay,
        limitLength: 10,
        star: estar,
        inputformat: number,
        optionalisEmpty: false,
        inputtype: keyboardTypeNumber,
        enabled: enabled,
      ),
      CommonBasicFormTwo(
        isEditing: isEditing,
          accountNameController: accountNameController,
          accountNumberController: accountNumberController,
          accountTypeController: accountTypeController,
          bankLocationController: bankLocationController,
          bankNameController: bankNameController,
          ifscCodeController: ifscCodeController,
          enabled: enabled)
    ]);
  }
}

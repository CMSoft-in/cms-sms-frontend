import 'package:flutter/material.dart';
import '../../../../../../Model/general/common_basic_form_two.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';


class ClientViewDetailsFive extends StatelessWidget {
  const ClientViewDetailsFive(
      {Key? key,
      required this.gstNumber,
      required this.accountNameController,
      required this.accountNumberController,
      required this.accountTypeController,
      required this.bankLocationController,
      required this.bankNameController,
      required this.ifscCodeController,
      required this.isEditing,
      required this.enabled})
      : super(key: key);
  final TextEditingController gstNumber;
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
        controller: gstNumber,
        text: gstNo,
        limitLength: 15,
        star: estar,
        inputformat: alphabatsAndNumbers,
        optionalisEmpty: false,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      CommonBasicFormTwo(
          accountNameController: accountNameController,
          accountNumberController: accountNumberController,
          accountTypeController: accountTypeController,
          bankLocationController: bankLocationController,
          bankNameController: bankNameController,
          ifscCodeController: ifscCodeController,
          enabled: enabled,
          isEditing: isEditing,)
    ]);
  }
}

import "package:flutter/material.dart";
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/general/common_basic_form_two.dart';

class CompanyUserViewDetailsFive extends StatelessWidget {
  const CompanyUserViewDetailsFive(
      {Key? key,
      required this.accountNameController,
      required this.accountNumberController,
      required this.accountTypeController,
      required this.bankLocationController,
      required this.bankNameController,
      required this.ifscCodeController,
      required this.isEditing,
      required this.enabled})
      : super(key: key);
  final TextEditingController accountNameController;
  final TextEditingController accountNumberController;
  final TextEditingController accountTypeController;
  final TextEditingController bankLocationController;
  final TextEditingController bankNameController;
  final TextEditingController ifscCodeController;
final bool isEditing;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      formSizebox10,
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

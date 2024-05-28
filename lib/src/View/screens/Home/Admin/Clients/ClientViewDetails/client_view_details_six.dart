import 'package:flutter/material.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';

class ClientViewDetailsSix extends StatelessWidget {
  const ClientViewDetailsSix({Key? key, required this.enabled})
      : super(key: key);
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    // final _aadharfilePathController = TextEditingController();
    // final _panfilePathController = TextEditingController();
    final _aadharNumber = TextEditingController();
    final _panNumber = TextEditingController();

    return Column(children: [
      formSizebox8,
      // FilePickerr(
      //   optionalisEmpty: true,
      //   text: "Upload Aadhar",
      //   star: estar,
      //   filePathController: _aadharfilePathController,
      // ),
      // formSizebox8,
      // FilePickerr(
      //   optionalisEmpty: true,
      //   text: "Pan",
      //   star: estar,
      //   filePathController: _panfilePathController,
      // ),
      formSizebox8,
      TextformField(
        controller: _aadharNumber,
        text: aadharNumber,
        limitLength: 16,
        optionalisEmpty: false,
        inputformat: number,
        star: estar,
        inputtype: keyboardTypeNumber,
        enabled: enabled,
      ),
      formSizebox8,
      TextformField(
        controller: _panNumber,
        text: panNumber,
        limitLength: 11,
        optionalisEmpty: false,
        inputformat: pan,
        star: estar,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
    ]);
  }
}

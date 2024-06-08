import 'package:flutter/material.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';

class CompanyUserViewDetailsFour extends StatelessWidget {
   CompanyUserViewDetailsFour({Key? key, required this.enabled,
  required this.aadharNumberController,required this.aadharfilePathController,required this.panNumberController,required this.panfilePathController})
      : super(key: key);
  final bool enabled;
      final TextEditingController aadharfilePathController;
    final TextEditingController panfilePathController;
    final  TextEditingController aadharNumberController ;
    final  TextEditingController panNumberController;
  @override
  Widget build(BuildContext context) {


    return Column(children: [
      formSizebox10,
      // FilePickerr(
      //   optionalisEmpty: false,
      //   text: "Upload Aadhar",
      //   star: estar,
      //   filePathController: aadharfilePathController,
      // ),
      // formSizebox10,
      // FilePickerr(
      //   optionalisEmpty: false,
      //   text: "Pan",
      //   star: estar,
      //   filePathController: panfilePathController,
      // ),
      formSizebox10,
      TextformField(
        controller: aadharNumberController,
        text: aadharNumber,
        limitLength: 16,
        optionalisEmpty: false,
        inputformat: number,
        star: estar,
        inputtype: keyboardTypeNumber,
        enabled: enabled,
      ),
      formSizebox10,
      TextformField(
        controller: panNumberController,
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

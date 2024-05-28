import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/general/primary_contact.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';

class SupplierViewDetailsTwo extends StatelessWidget {
  const SupplierViewDetailsTwo(
      {super.key,
      required this.enabled,
      required this.gstController,
      required this.primaryEmailController,
      required this.primaryNameController,
      required this.primaryPhoneNumberController,
      required this.primaryWhatsappController,
      required this.timeLineController});
  final TextEditingController gstController;
  final bool enabled;
  final TextEditingController primaryNameController;
  final TextEditingController primaryPhoneNumberController;
  final TextEditingController primaryEmailController;
  final TextEditingController primaryWhatsappController;
  final TextEditingController timeLineController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox10,
        TextformField(
            controller: gstController,
            text: gstNo,
            limitLength: 15,
            optionalisEmpty: true,
            inputformat: number,
            star: star,
            inputtype: keyboardTypeNumber,
            enabled: enabled),
        formSizebox10,
        TextformField(
            controller: timeLineController,
            text: timeLine,
            limitLength: 2,
            optionalisEmpty: true,
            inputformat: number,
            star: star,
            inputtype: keyboardTypeNumber,
            enabled: enabled),
        formSizebox10,
        PrimaryContact(
          primaryContactName: primaryContact,
            enabled: enabled,
            primaryEmailController: primaryEmailController,
            primaryNameController: primaryNameController,
            primaryPhoneNumberController: primaryPhoneNumberController,
            primaryWhatsappController: primaryWhatsappController)
      ],
    );
  }
}

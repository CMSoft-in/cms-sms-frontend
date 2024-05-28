import 'package:flutter/material.dart';

import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/general/common_basic_form_one.dart';
import '../../../../../../Model/general/secondary_contact.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';

class SupplierViewDetailsFour extends StatelessWidget {
  const SupplierViewDetailsFour({
    super.key,
    required this.enabled,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneNumberController,
    required this.secondaryNameController,
  required this.secondaryPhoneNumberController,
  required this.secondaryEmailController,
  required this.secondaryWhatsappController
  });
  final bool enabled;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;
   final TextEditingController secondaryNameController;
  final TextEditingController secondaryPhoneNumberController;
  final TextEditingController secondaryEmailController;
  final TextEditingController secondaryWhatsappController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox15,
        const StackText(
          
          stacktext: ownerDetails,
          color: grey,
        ),
        formSizebox10,
        CommonBasicFormOne(
            enabled: enabled,
            star: estar,
            firstNameController: firstNameController,
            firstNameoptionalisEmpty: false,
            lastNameController: lastNameController,
            lastNameOptionalisEmpty: false,
            phoneNumberController: phoneNumberController,
            phoneNumberOptionalisEmpty: false),
        formSizebox10,
        SecondaryContact(
          secondaryContactName: secondaryContact,
            enabled: enabled,
            secondaryNameController: secondaryNameController,
            secondaryPhoneNumberController: secondaryPhoneNumberController,
            secondaryEmailController: secondaryEmailController,
            secondaryWhatsappController: secondaryWhatsappController)
      ],
    );
  }
}

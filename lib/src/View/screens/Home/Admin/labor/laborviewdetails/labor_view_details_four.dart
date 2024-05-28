import '/src/Model/general/primary_contact.dart';
import '/src/Model/general/secondary_contact.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';


class LaborViewDetailsFour extends StatelessWidget {
  const LaborViewDetailsFour(
      {Key? key,
      required this.primaryNameController,
      required this.primaryPhoneNumberController,
      required this.primaryEmailController,
      required this.primaryWhatsappController,
      required this.secondaryNameController,
      required this.secondaryPhoneNumberController,
      required this.secondaryEmailController,
      required this.secondaryWhatsappController,
      required this.enabled})
      : super(key: key);

  final TextEditingController primaryNameController;
  final TextEditingController primaryPhoneNumberController;
  final TextEditingController primaryWhatsappController;
  final TextEditingController primaryEmailController;
  final TextEditingController secondaryNameController;
  final TextEditingController secondaryPhoneNumberController;
  final TextEditingController secondaryEmailController;
  final TextEditingController secondaryWhatsappController;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      formSizebox15,
     
      PrimaryContact(
        primaryContactName: emergencyContact1,
          enabled: enabled,
          primaryEmailController: primaryEmailController,
          primaryNameController: primaryNameController,
          primaryPhoneNumberController: primaryPhoneNumberController,
          primaryWhatsappController: primaryWhatsappController),
          formSizebox10,
           
      SecondaryContact(
        secondaryContactName: emergencyContact2,
          enabled: enabled,
          secondaryNameController: secondaryNameController,
          secondaryPhoneNumberController: secondaryPhoneNumberController,
          secondaryEmailController: secondaryEmailController,
          secondaryWhatsappController: secondaryWhatsappController)
    ]);
  }
}

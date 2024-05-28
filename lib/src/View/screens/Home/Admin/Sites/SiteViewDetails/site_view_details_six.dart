import "/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_common_use_pages.dart";
import "/src/Model/utility/sites/site_text_const.dart";
import "package:flutter/material.dart";

class SiteViewDetailsSix extends StatelessWidget {
  const SiteViewDetailsSix(
      {super.key,
      required this.clientArchitectEmailController,
      required this.clientArchitectNameController,
      required this.clientArchitectPhoneNumberController,
      required this.clientArchitectWhatsappController,
      required this.clientEngineerEmailController,
      required this.clientEngineerNameController,
      required this.clientEngineerPhoneNumberController,
      required this.clientEngineerWhatsappController,
      required this.enabled});
  final bool enabled;
  final TextEditingController clientArchitectNameController;
  final TextEditingController clientArchitectPhoneNumberController;
  final TextEditingController clientArchitectEmailController;
  final TextEditingController clientArchitectWhatsappController;
  final TextEditingController clientEngineerNameController;
  final TextEditingController clientEngineerPhoneNumberController;
  final TextEditingController clientEngineerEmailController;
  final TextEditingController clientEngineerWhatsappController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SiteCommonUsePages(
            emailController: clientArchitectEmailController,
            nameController: clientArchitectNameController,
            phoneNumberController: clientArchitectPhoneNumberController,
            whatsappController: clientArchitectWhatsappController,
            stacktext: clientArchitect,
            enabled: enabled),
        SiteCommonUsePages(
            emailController: clientEngineerEmailController,
            nameController: clientEngineerNameController,
            phoneNumberController: clientEngineerPhoneNumberController,
            whatsappController: clientEngineerWhatsappController,
            stacktext: clientEngineer,
            enabled: enabled)
      ],
    );
  }
}

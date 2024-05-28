import "/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_common_use_pages.dart";
import "/src/Model/utility/sites/site_text_const.dart";
import "package:flutter/material.dart";

class SiteViewDetailsEight extends StatelessWidget {
  const SiteViewDetailsEight(
      {super.key,
      required this.clientQualityOfficerEmailController,
      required this.clientQualityOfficerNameController,
      required this.clientQualityOfficerPhoneNumberController,
      required this.clientQualityOfficerWhatsappController,
      required this.enabled});
  final bool enabled;
  final TextEditingController clientQualityOfficerNameController;
  final TextEditingController clientQualityOfficerPhoneNumberController;
  final TextEditingController clientQualityOfficerEmailController;
  final TextEditingController clientQualityOfficerWhatsappController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SiteCommonUsePages(
          stacktext: clientQualityOfficer,
          nameController: clientQualityOfficerNameController,
          phoneNumberController: clientQualityOfficerPhoneNumberController,
          emailController: clientQualityOfficerEmailController,
          whatsappController: clientQualityOfficerWhatsappController,
          enabled: enabled)
    ]);
  }
}

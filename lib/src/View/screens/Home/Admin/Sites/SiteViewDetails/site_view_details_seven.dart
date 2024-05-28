import "/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_common_use_pages.dart";
import "/src/Model/utility/sites/site_text_const.dart";
import "package:flutter/material.dart";


class SiteViewDetailsSeven extends StatelessWidget {
  const SiteViewDetailsSeven(
      {super.key,
      required this.siteEngineerEmailController,
      required this.siteEngineerNameController,
      required this.siteEngineerPhoneNumberController,
      required this.siteEngineerWhatsappController,
      required this.clientPurchaseOfficerEmailController,
      required this.clientPurchaseOfficerNameController,
      required this.clientPurchaseOfficerPhoneNumberController,
      required this.clientPurchaseOfficerWhatsappController,
      required this.enabled});
  final bool enabled;
  final TextEditingController siteEngineerNameController;
  final TextEditingController siteEngineerPhoneNumberController;
  final TextEditingController siteEngineerEmailController;
  final TextEditingController siteEngineerWhatsappController;
  final TextEditingController clientPurchaseOfficerNameController;
  final TextEditingController clientPurchaseOfficerPhoneNumberController;
  final TextEditingController clientPurchaseOfficerEmailController;
  final TextEditingController clientPurchaseOfficerWhatsappController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SiteCommonUsePages(
            nameController: siteEngineerNameController,
            emailController: siteEngineerEmailController,
            phoneNumberController: siteEngineerPhoneNumberController,
            whatsappController: siteEngineerWhatsappController,
            stacktext: siteEngineer,
            enabled: enabled),
        SiteCommonUsePages(
            nameController: clientPurchaseOfficerNameController,
            phoneNumberController: clientPurchaseOfficerPhoneNumberController,
            emailController: clientPurchaseOfficerEmailController,
            whatsappController: clientPurchaseOfficerWhatsappController,
            stacktext: clientPurchaseOfficer,
            enabled: enabled),
        
      ],
    );
  }
}

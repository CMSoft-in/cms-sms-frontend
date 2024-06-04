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

  // void populateClientArchitectControllers(Map<String, dynamic> data) {
  //   if (data.containsKey("CoSiteContacts") && data["CoSiteContacts"] is List) {
  //     List contacts = data["CoSiteContacts"];
  //     int index = 0;
  //     for (var contact in contacts) {
  //       if (contact["contact_category_name"] == "Client Architect") {
  //         if (index < clientArchitectControllers.length) {
  //           clientArchitectControllers[index][0].text =
  //               contact["contact_name"]?.toString() ?? "";
  //           clientArchitectControllers[index][1].text =
  //               contact["contact_no"]?.toString() ?? "";
  //           clientArchitectControllers[index][2].text =
  //               contact["contact_email"]?.toString() ?? "";
  //           clientArchitectControllers[index][3].text =
  //               contact["contact_whatsapp"]?.toString() ?? "";
  //         } else {
  //           clientArchitectControllers.add([
  //             TextEditingController(
  //                 text: contact["contact_name"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_no"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_email"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_whatsapp"]?.toString() ?? ""),
  //           ]);
  //         }
  //         index++;
  //       }
  //     }
  //   }
  // }

  // void populateClientEngineerControllers(Map<String, dynamic> data) {
  //   if (data.containsKey("CoSiteContacts") && data["CoSiteContacts"] is List) {
  //     List contacts = data["CoSiteContacts"];
  //     int index = 0;
  //     for (var contact in contacts) {
  //       if (contact["contact_category_name"] == "Client Engineer") {
  //         if (index < clientEngineerControllers.length) {
  //           clientEngineerControllers[index][0].text =
  //               contact["contact_name"]?.toString() ?? "";
  //           clientEngineerControllers[index][1].text =
  //               contact["contact_no"]?.toString() ?? "";
  //           clientEngineerControllers[index][2].text =
  //               contact["contact_email"]?.toString() ?? "";
  //           clientEngineerControllers[index][3].text =
  //               contact["contact_whatsapp"]?.toString() ?? "";
  //         } else {
  //           clientEngineerControllers.add([
  //             TextEditingController(
  //                 text: contact["contact_name"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_no"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_email"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_whatsapp"]?.toString() ?? ""),
  //           ]);
  //         }
  //         index++;
  //       }
  //     }
  //   }
  // }

  // void populateSiteEngineerControllers(Map<String, dynamic> data) {
  //   if (data.containsKey("CoSiteContacts") && data["CoSiteContacts"] is List) {
  //     List contacts = data["CoSiteContacts"];
  //     int index = 0;
  //     for (var contact in contacts) {
  //       if (contact["contact_category_name"] == "Site Engineer") {
  //         if (index < siteEngineerControllers.length) {
  //           siteEngineerControllers[index][0].text =
  //               contact["contact_name"]?.toString() ?? "";
  //           siteEngineerControllers[index][1].text =
  //               contact["contact_no"]?.toString() ?? "";
  //           siteEngineerControllers[index][2].text =
  //               contact["contact_email"]?.toString() ?? "";
  //           siteEngineerControllers[index][3].text =
  //               contact["contact_whatsapp"]?.toString() ?? "";
  //         } else {
  //           siteEngineerControllers.add([
  //             TextEditingController(
  //                 text: contact["contact_name"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_no"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_email"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_whatsapp"]?.toString() ?? ""),
  //           ]);
  //         }
  //         index++;
  //       }
  //     }
  //   }
  // }

  // void populateClientPurchaseOfficerControllers(Map<String, dynamic> data) {
  //   if (data.containsKey("CoSiteContacts") && data["CoSiteContacts"] is List) {
  //     List contacts = data["CoSiteContacts"];
  //     int index = 0;
  //     for (var contact in contacts) {
  //       if (contact["contact_category_name"] == "Client Purchase Officer") {
  //         if (index < clientPurchaseOfficerControllers.length) {
  //           clientPurchaseOfficerControllers[index][0].text =
  //               contact["contact_name"]?.toString() ?? "";
  //           clientPurchaseOfficerControllers[index][1].text =
  //               contact["contact_no"]?.toString() ?? "";
  //           clientPurchaseOfficerControllers[index][2].text =
  //               contact["contact_email"]?.toString() ?? "";
  //           clientPurchaseOfficerControllers[index][3].text =
  //               contact["contact_whatsapp"]?.toString() ?? "";
  //         } else {
  //           clientPurchaseOfficerControllers.add([
  //             TextEditingController(
  //                 text: contact["contact_name"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_no"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_email"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_whatsapp"]?.toString() ?? ""),
  //           ]);
  //         }
  //         index++;
  //       }
  //     }
  //   }
  // }

  // void populateClientQualityOfficerControllers(Map<String, dynamic> data) {
  //   if (data.containsKey("CoSiteContacts") && data["CoSiteContacts"] is List) {
  //     List contacts = data["CoSiteContacts"];
  //     int index = 0;
  //     for (var contact in contacts) {
  //       if (contact["contact_category_name"] == "Client Quality Officer") {
  //         if (index < clientQualityOfficerControllers.length) {
  //           clientQualityOfficerControllers[index][0].text =
  //               contact["contact_name"]?.toString() ?? "";
  //           clientQualityOfficerControllers[index][1].text =
  //               contact["contact_no"]?.toString() ?? "";
  //           clientQualityOfficerControllers[index][2].text =
  //               contact["contact_email"]?.toString() ?? "";
  //           clientQualityOfficerControllers[index][3].text =
  //               contact["contact_whatsapp"]?.toString() ?? "";
  //         } else {
  //           clientQualityOfficerControllers.add([
  //             TextEditingController(
  //                 text: contact["contact_name"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_no"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_email"]?.toString() ?? ""),
  //             TextEditingController(
  //                 text: contact["contact_whatsapp"]?.toString() ?? ""),
  //           ]);
  //         }
  //         index++;
  //       }
  //     }
  //   }
  // }

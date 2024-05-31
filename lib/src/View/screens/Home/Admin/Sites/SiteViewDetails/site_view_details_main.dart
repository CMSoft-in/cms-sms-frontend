import 'dart:convert';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_four.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_one.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_three.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_two.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import '../../../../../../controler/GetDate/get_date.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/Buttons/Long_SizeButton.dart';
import '../../../../../widgets/CommonUsageForm/AlartBox/alart_popup.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_data_item.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_header.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/view_details_text.dart';

import '../SiteDataView/site_data_view_main.dart';

class SiteViewDetailsMain extends StatefulWidget {
  const SiteViewDetailsMain({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<SiteViewDetailsMain> createState() => _SiteViewDetailsMainState();
}

List<List<TextEditingController>> clientArchitectControllers = [
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ]
];
List<List<TextEditingController>> clientEngineerControllers = [
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ]
];
List<List<TextEditingController>> siteEngineerControllers = [
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ]
];
List<List<TextEditingController>> clientPurchaseOfficerControllers = [
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ]
];
List<List<TextEditingController>> clientQualityOfficerControllers = [
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ]
];

class _SiteViewDetailsMainState extends State<SiteViewDetailsMain> {
  Map<String, dynamic>? data;
  var updatedData;

  @override
  void initState() {
    super.initState();
    fetchData();

    getToken();
  }

  bool isEditing = false;
  bool isEnabled = false;

Future<void> fetchData() async {
  try {
    final response = await http.get(
      Uri.parse('${ApiEndpoints.getSite}/${widget.id}'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic>? data = jsonDecode(response.body) as Map<String, dynamic>?;

      setState(() {
        if (data != null) {
          siteNameController.text = data[dbSiteName]?.toString() ?? "";
          addressline1Controller.text = data[dbSiteAddressOne]?.toString() ?? "";
          addressline2Controller.text = data[dbSiteAddressTwo]?.toString() ?? "";
          pincodeController.text = data[dbSitePincode]?.toString() ?? "";
          cityController.text = data[dbSiteTown]?.toString() ?? "";
          stateController.text = data[dbSiteState]?.toString() ?? "";
          primaryEmailController.text = data[dbPrimaryEmail]?.toString() ?? "";
          createBy.text = data["created_by"]?.toString() ?? "";
          createOn.text = Date.getDate(data["created_at"])?.toString() ?? "";
          primaryNameController.text = data[dbPrimaryName]?.toString() ?? "";
          primaryPhoneNumberController.text = data[dbPrimaryNumber]?.toString() ?? "";
          primaryWhatsappController.text = data[""]?.toString() ?? "";
          sitegpsController.text = data[dbSiteGpsLocation]?.toString() ?? "";
          projectWorkNameController.text = data[dbSiteProjectWorkName]?.toString() ?? "";
          projectSizeController.text = data[dbSiteProjectSize]?.toString() ?? "";
          projectStartDateController.text = Date.getDate(data[dbSiteProjectStartDate])?.toString() ?? "";
          expectedCompletionDateController.text = Date.getDate(data[dbSiteProjectCompletionDate])?.toString() ?? "";
          projectWorkDescriptionofController.text = data[dbSiteProjectDesc]?.toString() ?? "";
          companySiteEngineersAllocatedController.text = data[""]?.toString() ?? "";
          laborsAllocatedController.text = data[" "]?.toString() ?? "";
          secondaryEmailController.text = data[dbSecondaryEmail]?.toString() ?? "";
          secondaryNameController.text = data[dbSecondaryName]?.toString() ?? "";
          secondaryPhoneNumberController.text = data[dbSecondaryNumber]?.toString() ?? "";
          secondaryWhatsappController.text = data[dbPrimaryWhatsapp]?.toString() ?? "";

          populateContactControllers(data, "Client Architect", clientArchitectControllers);
          populateContactControllers(data, "Site Engineer", siteEngineerControllers);
          populateContactControllers(data, "Client Engineer", clientEngineerControllers);
          populateContactControllers(data, "Client Purchase Officer", clientPurchaseOfficerControllers);
          populateContactControllers(data, "Client Quality Officer", clientQualityOfficerControllers);
        }
      });
    }
  } catch (e) {
    print(e);
  }
}

void populateContactControllers(Map<String, dynamic> data, String category, List<List<TextEditingController>> controllers) {
  if (data.containsKey("CoSiteContacts") && data["CoSiteContacts"] is List) {
    List contacts = data["CoSiteContacts"];
    int index = 0;

    // Iterate through each contact and filter by the category
    for (var contact in contacts) {
      if (contact["contact_category_name"] == category) {
        if (index < controllers.length) {
          controllers[index][0].text = contact["contact_name"]?.toString() ?? "";
          controllers[index][1].text = contact["contact_no"]?.toString() ?? "";
          controllers[index][2].text = contact["contact_email"]?.toString() ?? "";
          controllers[index][3].text = contact["contact_whatsapp"]?.toString() ?? "";
        } else {
          // Add new controllers dynamically if more contacts are found
          controllers.add([
            TextEditingController(text: contact["contact_name"]?.toString() ?? ""),
            TextEditingController(text: contact["contact_no"]?.toString() ?? ""),
            TextEditingController(text: contact["contact_email"]?.toString() ?? ""),
            TextEditingController(text: contact["contact_whatsapp"]?.toString() ?? ""),
          ]);
        }
        index++;
      }
    }

    // Clear any extra controllers that are no longer needed
    while (index < controllers.length) {
      controllers[index][0].clear();
      controllers[index][1].clear();
      controllers[index][2].clear();
      controllers[index][3].clear();
      index++;
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Container(
        
          child: Column(
            children: [
              ViewDetailsText(
                viewClientDetailsTextt:
                    isEditing ? editSiteDetailsText : viewSiteDetailsText,
                editOnPress: () {
                  setState(() {
                    isEditing = !isEditing;
                    isEnabled = !isEnabled;
                  });
                },
                deleteOnPress: AlartMessage(
                  api: '${ApiEndpoints.deleteSite}/${widget.id}',
                  onPress: const SiteDataView(),
                ),
              ),
              SiteViewDetailsOne(
                  isEditing: isEditing,
                  enabled: isEnabled,
                  addressline1Controller: addressline1Controller,
                  addressline2Controller: addressline2Controller,
                  cityControllerName: cityController,
                  pincodeControllerName: pincodeController,
                  siteNameController: siteNameController,
                  stateControllerName: stateController,
                  sitegpsController: sitegpsController),
              SiteViewDetailsTwo(
                  enabled: isEnabled,
                  isEditing: isEditing,
                  expectedCompletionDateController:
                      expectedCompletionDateController,
                  projectSizeController: projectSizeController,
                  projectStartDateController: projectStartDateController,
                  projectWorkDescriptionofController:
                      projectWorkDescriptionofController,
                  projectWorkNameController: projectWorkNameController),
              SiteViewDetailsThree(
                  enabled: isEnabled,
                  companySiteEngineersAllocatedController:
                      companySiteEngineersAllocatedController,
                  laborsAllocatedController: laborsAllocatedController),
              SiteViewDetailsFour(
                  enabled: isEnabled,
                  emailController: primaryEmailController,
                  nameController: primaryNameController,
                  phoneNumberController: primaryPhoneNumberController,
                  secondaryEmailController: secondaryEmailController,
                  secondaryNameController: secondaryNameController,
                  secondaryPhoneNumberController:
                      secondaryPhoneNumberController,
                  secondaryWhatsappController: secondaryWhatsappController,
                  whatsappController: primaryWhatsappController),
            
              formSizebox15,
              const StackText(stacktext: clientArchitect, color: grey),
              ..._buildContactFields(clientArchitectControllers),
              const StackText(stacktext: clientEngineer, color: grey),
              ..._buildContactFields(clientEngineerControllers),
              const StackText(stacktext: siteEngineer, color: grey),
              ..._buildContactFields(siteEngineerControllers),
              const StackText(stacktext: clientPurchaseOfficer, color: grey),
              ..._buildContactFields(clientPurchaseOfficerControllers),
              const StackText(stacktext: clientQualityOfficer, color: grey),
              ..._buildContactFields(clientQualityOfficerControllers),
              formSizebox15,
              LongButton(
                formKey: formKey,
                text: update,
                onPressed: () {},
                isEnabled: isEnabled,
              ),
              if (updatedData != null)
                if (updatedData.length != 0)
                  Column(
                    children: [
                      const UpdateHeader(
                        updatedByHeader: updateByHeaderText,
                        newValueHeader: newvalueHeaderText,
                        oldValueHeader: oldvlueHeaderText,
                      ),
                      ...updatedData.map((eachItem) {
                        return updatedDataItem(
                          eachItem["updated_old_value"] ?? "",
                          eachItem["updated_new_value"] ?? "",
                          eachItem["updated_by"].toString(),
                        );
                      }).toList(),
                      bottomHeight,
                    ],
                  ),
              bottomHeight,
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContactFields(
      List<List<TextEditingController>> controllers) {
    return List.generate(controllers.length, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextformField(
              controller: controllers[index][0],
              text: name,
              limitLength: 25,
              optionalisEmpty: false,
              inputformat: alphabatsSpace,
              star: estar,
              inputtype: keyboardTypeNone,
              enabled: isEnabled,
            ),
            formSizebox10,
            PhoneFormField(
              controller: controllers[index][1],
              text: phoneNumber,
              limitLength: 10,
              optionalisEmpty: false,
              inputformat: number,
              star: estar,
              inputtype: keyboardTypeNumber,
              valuelength: 10,
              enabled: isEnabled,
            ),
            formSizebox10,
            TextformField(
              controller: controllers[index][2],
              text: email,
              limitLength: 30,
              optionalisEmpty: false,
              inputformat: emailonly,
              star: estar,
              inputtype: keyboardTypeEmail,
              enabled: isEnabled,
            ),
            formSizebox10,
            PhoneFormField(
              controller: controllers[index][3],
              text: whatsapp,
              limitLength: 10,
              optionalisEmpty: false,
              inputformat: number,
              star: estar,
              inputtype: keyboardTypeNumber,
              valuelength: 10,
              enabled: isEnabled,
            ),
            if (index != 0)
              GestureDetector(
                onTap: () {
                  setState(() {
                    controllers[index].clear();
                    controllers.removeAt(index);
                  });
                },
                child: const Icon(
                  Icons.delete,
                  color: Color(0xFF6B74D6),
                  size: 35,
                ),
              ),
            const SizedBox(width: 10),
             
              isEnabled?  GestureDetector(
                  
                  onTap: () {
                    setState(() {
                      controllers.add([
                        TextEditingController(),
                        TextEditingController(),
                        TextEditingController(),
                        TextEditingController()
                      ]);
                    });
                  },
                  child: Text("Add More"),
                ):formSizebox10,
                const SizedBox(width: 10),
          ],
        ),
      );
    });
  }
}

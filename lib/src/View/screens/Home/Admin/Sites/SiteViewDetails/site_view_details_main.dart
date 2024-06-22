import 'dart:convert';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_four.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_one.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_two.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
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
  var oldData;

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

      if (response.statusCode == 200) {
        final Map<String, dynamic>? data =
            jsonDecode(response.body) as Map<String, dynamic>?;
            print(data);
        if (data != null) {
          // List<String> latlong = data[dbSiteGpsLocation]?.split(" ") ?? [];
          // double lat = double.parse(latlong[0]);
          // double long = double.parse(latlong[1]);
          // String location = await getPlace(lat, long);

          setState(() {
            siteNameController.text = data[dbSiteName]?.toString() ?? "";
            addressline1Controller.text =
                data[dbSiteAddressOne]?.toString() ?? "";
            addressline2Controller.text =
                data[dbSiteAddressTwo]?.toString() ?? "";
            pincodeController.text = data[dbSitePincode]?.toString() ?? "";
            cityController.text = data[dbSiteTown]?.toString() ?? "";
            stateController.text = data[dbSiteState]?.toString() ?? "";
            // sitegpsController.text = location;
            projectWorkNameController.text =
                data[dbSiteProjectWorkName]?.toString() ?? "";
            projectWorkDescriptionofController.text =
                data[dbSiteProjectDesc]?.toString() ?? "";
            projectSizeController.text =
                data[dbSiteProjectSize]?.toString() ?? "";
            projectStartDateController.text =
                data[dbSiteProjectStartDate] ?? "";
            expectedCompletionDateController.text =
                data[dbSiteProjectCompletionDate] ?? "";
            primaryNameController.text = data[dbPrimaryName]?.toString() ?? "";
            primaryPhoneNumberController.text =
                data[dbPrimaryNumber]?.toString() ?? "";
            primaryEmailController.text =
                data[dbPrimaryEmail]?.toString() ?? "";
            primaryWhatsappController.text = data[""]?.toString() ?? "";
            companySiteEngineersAllocatedController.text =
                data[""]?.toString() ?? "";
            laborsAllocatedController.text = data[" "]?.toString() ?? "";
            secondaryEmailController.text =
                data[dbSecondaryEmail]?.toString() ?? "";
            secondaryNameController.text =
                data[dbSecondaryName]?.toString() ?? "";
            secondaryPhoneNumberController.text =
                data[dbSecondaryNumber]?.toString() ?? "";
            secondaryWhatsappController.text =
                data[dbPrimaryWhatsapp]?.toString() ?? "";
            populateContactControllers(
                data, "Client Architect", clientArchitectControllers);
            populateContactControllers(
                data, "Client Site Engineer", siteEngineerControllers);
            populateContactControllers(
                data, "Client Engineer", clientEngineerControllers);
            populateContactControllers(data, "Client Purchase Officer",
                clientPurchaseOfficerControllers);
            populateContactControllers(data, "Client Quality Officer",
                clientQualityOfficerControllers);
            createBy.text = data["created_by"]?.toString() ?? "";
            createOn.text = data["created_at"] ?? "";
          });
        }
      } else {
        Fluttertoast.showToast(msg: 'Failed to load data');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'An error occurred: $e');
    }
  }

  void populateContactControllers(Map<String, dynamic> data, String category,
      List<List<TextEditingController>> controllers) {
    if (data.containsKey("CoSiteContacts") && data["CoSiteContacts"] is List) {
      List contacts = data["CoSiteContacts"];
      int index = 0;
      for (var contact in contacts) {
        if (contact["contact_category_name"] == category) {
          while (index >= controllers.length) {
            controllers.add([
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController()
            ]);
          }
          controllers[index][0].text =
              contact["contact_name"]?.toString() ?? "";
          controllers[index][1].text = contact["contact_no"]?.toString() ?? "";
          controllers[index][2].text =
              contact["contact_email"]?.toString() ?? "";
          controllers[index][3].text =
              contact["contact_whatsapp"]?.toString() ?? "";

          index++;
        }
      }
      while (index < controllers.length) {
        controllers[index][0].clear();
        controllers[index][1].clear();
        controllers[index][2].clear();
        controllers[index][3].clear();
        index++;
      }
    } else {
      print('No contacts found in data for category: $category');
    }
  }
void checkUpdatingValue() {
  oldData = data;
        print(data);
  if (oldData != null) {
    Map<String, dynamic> updatedData = {};

    var siteFields = {
      dbSiteName: siteNameController.text,
      dbSiteAddressOne: addressline1Controller.text,
      dbSiteAddressTwo: addressline2Controller.text,
      dbSitePincode: pincodeController.text,
      dbSiteTown: cityController.text,
      dbSiteState: stateController.text,
      dbSiteGpsLocation: sitegpsController.text,
      dbSiteProjectWorkName: projectWorkNameController.text,
      dbSiteProjectDesc: projectWorkDescriptionofController.text,
      dbSiteProjectSize: projectSizeController.text,
      dbSiteProjectStartDate: projectStartDateController.text,
      dbSiteProjectCompletionDate: expectedCompletionDateController.text,
      dbPrimaryName: primaryNameController.text,
      dbPrimaryNumber: primaryPhoneNumberController.text,
      dbPrimaryEmail: primaryEmailController.text,
      dbPrimaryWhatsapp: primaryWhatsappController.text,
      dbSiteEngineerAllocated: companySiteEngineersAllocatedController.text,
      dbSecondaryEmail: secondaryEmailController.text,
      dbSecondaryName: secondaryNameController.text,
      dbSecondaryNumber: secondaryPhoneNumberController.text,
     
    };

    siteFields.forEach((key, value) {
      if (value.isNotEmpty && (oldData[key] ?? '') != value) {
          updatedData[key] = value;
          print(updatedData);
        }
      });

    // checkContactUpdates(
    //     "Client Architect", clientArchitectControllers, oldData, updatedData);

    if (updatedData.isNotEmpty) {
      updateData(updatedData);
    } else {
      print("No changes detected.");
    }
  } else {
    print("Old data is null, unable to proceed.");
  }
}

void checkContactUpdates(
  String category,
  List<List<TextEditingController>> controllers,
  Map<String, dynamic> oldData,
  Map<String, dynamic> updatedData,
) {
  if (oldData["CoSiteContacts"] == null) {
    return;
  }

  List<Map<String, dynamic>> updatedContacts = [];

  for (var i = 0; i < controllers.length; i++) {
    var contact = controllers[i];
    if (contact[0].text.isNotEmpty) {
      var oldContactData = (oldData["CoSiteContacts"] as List).firstWhere(
          (element) => element["contact_category_name"] == category && element["co_site_contacts_id"] == contact[4].text,
          orElse: () => null);
      var updatedContactData = {
        "co_site_contacts_id": contact[4].text,
        "contact_category_name": category,
        "contact_name": contact[0].text,
        "contact_no": contact[1].text,
        "contact_whatsapp": contact[2].text,
        "contact_email": contact[3].text,
      };
      print(updatedContactData);
      if (oldContactData != null) {
        var oldContact = (oldContactData["contact_name"] ?? "") +
            (oldContactData["contact_no"] ?? "") +
            (oldContactData["contact_email"] ?? "") +
            (oldContactData["contact_whatsapp"] ?? "");
        var newContact = (updatedContactData["contact_name"] ?? "") +
            (updatedContactData["contact_no"] ?? "") +
            (updatedContactData["contact_email"] ?? "") +
            (updatedContactData["contact_whatsapp"] ?? "");
        if (oldContact != newContact) {
          updatedContacts.add({
            "co_site_contacts_id": contact[4].text,
            "updated_old_value": oldContact,
            "updated_new_value": newContact,
            "updated_by": "User",
          });
        }
      } else {
        updatedContacts.add({
          "co_site_contacts_id": contact[4].text,
          "updated_old_value": "",
          "updated_new_value": updatedContactData,
          "updated_by": "User"
        });
      }
    }
  }
  if (updatedContacts.isNotEmpty) {
    updatedData["CoSiteContacts"] = updatedContacts;
  }
}

void updateData(Map<String, dynamic> data) async {
  try {
    var response = await http.patch(
      Uri.parse('${ApiEndpoints.updateSite}/${widget.id}'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SiteDataView()));
    } else {
      print("Update failed with status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  } catch (e) {
    print("Update failed with error: $e");
  }
}


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
                  // sitegpsController: sitegpsController
                  ),
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
              // SiteViewDetailsThree(
              //     enabled: isEnabled,
              //     companySiteEngineersAllocatedController:
              //         companySiteEngineersAllocatedController,
              //     laborsAllocatedController: laborsAllocatedController),
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
              // isEditing
              //     ? ElevatedButton(
              //         onPressed: () => checkUpdatingValue(),
              //         child: const Text('Update'),
              //       )
              //     : const SizedBox.shrink(),

              LongButton(
                formKey: formKey,
                text: update,
                onPressed: () {
                   checkUpdatingValue();
                   },
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
              isEditing
                  ? GestureDetector(
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
                    )
                  : formSizebox10,
            formSizebox10,
            isEnabled
                ? GestureDetector(
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
                    child: const Text("Add More"),
                  )
                : formSizebox10,
            const SizedBox(width: 10),
          ],
        ),
      );
    });
  }
}

  // void checkUpdatingValue() {
  //   oldData = data;
  //   if (oldData != null) {
  //     Map<String, dynamic> updatedData = {};

  //     var siteFields = {
  //       dbSiteName: siteNameController.text,
  //       dbSiteAddressOne: addressline1Controller.text,
  //       dbSiteAddressTwo: addressline2Controller.text,
  //       dbSitePincode: pincodeController.text,
  //       dbSiteTown: cityController.text,
  //       dbSiteState: stateController.text,
  //       dbSiteGpsLocation: sitegpsController.text,
  //       dbSiteProjectWorkName: projectWorkNameController.text,
  //       dbSiteProjectDesc: projectWorkDescriptionofController.text,
  //       dbSiteProjectSize: projectSizeController.text,
  //       dbSiteProjectStartDate: projectStartDateController.text,
  //       dbSiteProjectCompletionDate: expectedCompletionDateController.text,
  //       dbPrimaryName: primaryNameController.text,
  //       dbPrimaryNumber: primaryPhoneNumberController.text,
  //       dbPrimaryEmail: primaryEmailController.text,
  //       dbPrimaryWhatsapp: primaryWhatsappController.text,
  //       dbSiteEngineerAllocated: companySiteEngineersAllocatedController.text,
  //       dbSecondaryEmail: secondaryEmailController.text,
  //       dbSecondaryName: secondaryNameController.text,
  //       dbSecondaryNumber: secondaryPhoneNumberController.text,
  //       "created_by": createBy.text,
  //       "created_at": createOn.text,
  //     };

  //     siteFields.forEach((key, value) {
  //       if (value.isNotEmpty && (oldData[key]?.toString() ?? '') != value) {
  //         updatedData[key] = value;
  //       }
  //     });

  //     checkContactUpdates(
  //         "Client Architect", clientArchitectControllers, oldData, updatedData);
  //     if (updatedData.isNotEmpty) {
  //       updateData(updatedData);
  //     } else {
  //       print("No changes detected.");
  //     }
  //   } else {
  //     print("Old data is null, unable to proceed.");
  //   }
  // }

  // void checkContactUpdates(
  //   String category,
  //   List<List<TextEditingController>> controllers,
  //   Map<String, dynamic> oldData,
  //   Map<String, dynamic> updatedData,
  // ) {
  //   if (oldData["CoSiteContacts"] == null) {
  //     return;
  //   }

  //   List<Map<String, dynamic>> updatedContacts = [];

  //   for (var i = 0; i < controllers.length; i++) {
  //     var contact = controllers[i];
  //     if (contact[0].text.isNotEmpty) {
  //       var oldContactData = (oldData["CoSiteContacts"] as List).firstWhere(
  //           (element) => element["contact_category_name"] == category,
  //           orElse: () => null);
  //       var updatedContactData = {
  //         "contact_name": contact[0].text,
  //         "contact_no": contact[1].text,
  //         "contact_email": contact[2].text,
  //         "contact_whatsapp": contact[3].text,
  //       };
  //       if (oldContactData != null) {
  //         var oldContact = (oldContactData["contact_name"] ?? "") +
  //             (oldContactData["contact_no"] ?? "") +
  //             (oldContactData["contact_email"] ?? "") +
  //             (oldContactData["contact_whatsapp"] ?? "");
  //         var newContact = (updatedContactData["contact_name"] ?? "") +
  //             (updatedContactData["contact_no"] ?? "") +
  //             (updatedContactData["contact_email"] ?? "") +
  //             (updatedContactData["contact_whatsapp"] ?? "");
  //         if (oldContact != newContact) {
  //           updatedContacts.add({
  //             "updated_old_value": oldContact,
  //             "updated_new_value": newContact,
  //             "updated_by": "User",
  //           });
  //         }
  //       } else {
  //         updatedContacts.add({
  //           "updated_old_value": "",
  //           "updated_new_value": updatedContactData,
  //           "updated_by": "User"
  //         });
  //       }
  //     }
  //   }
  //   if (updatedContacts.isNotEmpty) {
  //     updatedData["CoSiteContacts"] = updatedContacts;
  //   }
  // }

  // void updateData(data) async {
  //   try {
  //     var response = await http.patch(
  //       Uri.parse('${ApiEndpoints.updateSite}/${widget.id}'),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer $token",
  //       },
  //       body: jsonEncode(data),
  //     );
  //     if (response.statusCode == 200) {
  //       Navigator.of(context).push(
  //           MaterialPageRoute(builder: (context) => const SiteDataView()));
  //     } else {
  //       print("Update failed with status code: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     print("Update failed with error: $e");
  //   }
  // }

import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_four.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_one.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_two.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import '../../../../../../controler/GetLocationPlace/get_location_place.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/Buttons/Long_SizeButton.dart';
import '../../../../../widgets/Buttons/custom_button.dart';
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
    TextEditingController(),
    TextEditingController()
  ]
];
List<List<TextEditingController>> clientEngineerControllers = [
  [
    TextEditingController(),
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
    TextEditingController(),
    TextEditingController()
  ]
];
List<List<TextEditingController>> clientPurchaseOfficerControllers = [
  [
    TextEditingController(),
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
    TextEditingController(),
    TextEditingController()
  ]
];

class _SiteViewDetailsMainState extends State<SiteViewDetailsMain> {
  Map<String, dynamic> data = {};
  Map<String, dynamic> storeUpdatedData = {};
  Map<String, dynamic> oldData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
    getToken();
  }

  bool isEditing = false;
  bool isEnabled = false;
  bool isLoading = true;

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getSite}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        data = jsonDecode(response.body) as Map<String, dynamic>;
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
          projectStartDateController.text = data[dbSiteProjectStartDate] ?? "";
          expectedCompletionDateController.text =
              data[dbSiteProjectCompletionDate] ?? "";
          primaryNameController.text = data[dbPrimaryName]?.toString() ?? "";
          primaryPhoneNumberController.text =
              data[dbPrimaryNumber]?.toString() ?? "";
          primaryEmailController.text = data[dbPrimaryEmail]?.toString() ?? "";
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
          populateContactControllers(
              data, "Client Quality Officer", clientQualityOfficerControllers);
          createBy.text = data["created_by"]?.toString() ?? "";
          createOn.text = data["created_at"] ?? "";
          isLoading = false;
        });
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
              TextEditingController(),
              TextEditingController(),
            ]);
          }
          controllers[index][0].text =
              contact["contact_name"]?.toString() ?? "";
          controllers[index][1].text = contact["contact_no"]?.toString() ?? "";
          controllers[index][2].text =
              contact["contact_email"]?.toString() ?? "";
          controllers[index][3].text =
              contact["contact_whatsapp"]?.toString() ?? "";
          controllers[index][4].text =
              contact["co_site_contacts_id"]?.toString() ?? "";
          index++;
        }
      }

      while (index < controllers.length) {
        controllers[index][0].clear();
        controllers[index][1].clear();
        controllers[index][2].clear();
        controllers[index][3].clear();
        controllers[index][4].clear();
        index++;
      }
    } else {
      print('No contacts found in data for category: $category');
    }
  }

  void checkContactUpdates(
      String category,
      List<List<TextEditingController>> controllers,
      List<dynamic> oldData,
      Map<String, dynamic> result) {
    List<Map<String, dynamic>> updatedContacts = [];
    List<Map<String, dynamic>> addedContacts = [];
    List<int> deletedContacts = [];

    // Filter old data by category
    List filteredCategory = oldData.where((contact) {
      return contact['contact_category_name'] == category;
    }).toList();

    // Create a map for quick lookup of old contacts by their IDs
    Map<int, Map<String, dynamic>> oldContactsMap = {};
    for (var contact in filteredCategory) {
      oldContactsMap[contact['co_site_contacts_id']] = contact;
    }

    // Check for updates and additions
    for (var contactControllers in controllers) {
      int coSiteContactId = int.tryParse(contactControllers[4].text) ?? 0;
      String contactName = contactControllers[0].text;
      String contactNo = contactControllers[1].text;
      String contactEmail = contactControllers[2].text;
      String contactWhatsapp = contactControllers[3].text;

      Map<String, dynamic> newContact = {
        "contact_category_name": category,
        "contact_name": contactName,
        "contact_no": contactNo,
        "contact_whatsapp": contactWhatsapp,
        "contact_email": contactEmail
      };

      if (coSiteContactId == 0) {
        addedContacts.add(newContact);
      } else if (oldContactsMap.containsKey(coSiteContactId)) {
        var oldContact = oldContactsMap[coSiteContactId];
        if (oldContact!['contact_name'] != contactName ||
            oldContact['contact_no'] != contactNo ||
            oldContact['contact_whatsapp'] != contactWhatsapp ||
            oldContact['contact_email'] != contactEmail) {
          newContact['co_site_contacts_id'] = coSiteContactId;
          updatedContacts.add(newContact);
        }
        oldContactsMap.remove(coSiteContactId);
      }
    }

    // Remaining old contacts in the map are to be deleted
    for (var oldContactId in oldContactsMap.keys) {
      deletedContacts.add(oldContactId);
    }

    // Initialize lists in the result map if they don't exist
    if (result["Add_sitecontact"] == null) {
      result["Add_sitecontact"] = [];
    }
    if (result["Update_sitecontact"] == null) {
      result["Update_sitecontact"] = [];
    }
    if (result["delete_sitecontact"] == null) {
      result["delete_sitecontact"] = [];
    }

    // Add results to the result map
    if (addedContacts.isNotEmpty) {
      result["Add_sitecontact"].addAll(addedContacts);
    }
    if (updatedContacts.isNotEmpty) {
      result["Update_sitecontact"].addAll(updatedContacts);
    }
    if (deletedContacts.isNotEmpty) {
      result["delete_sitecontact"].addAll(deletedContacts);
    }
  }

  void checkUpdatingValue() {
    oldData = data;
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
      if (value.isNotEmpty && (oldData[key]?.toString() ?? '') != value) {
        storeUpdatedData[key] = value;
      }
    });

    Map<String, dynamic> result = {};
    checkContactUpdates("Client Architect", clientArchitectControllers,
        oldData["CoSiteContacts"], result);
    checkContactUpdates("Client Engineer", clientEngineerControllers,
        oldData["CoSiteContacts"], result);
    checkContactUpdates("Client Site Engineer", siteEngineerControllers,
        oldData["CoSiteContacts"], result);
    checkContactUpdates("Client Purchase Officer",
        clientPurchaseOfficerControllers, oldData["CoSiteContacts"], result);
    checkContactUpdates("Client Quality Officer",
        clientQualityOfficerControllers, oldData["CoSiteContacts"], result);

    if (result["Add_sitecontact"].length == 0) {
      result.remove("Add_sitecontact");
    }

    if (result["Update_sitecontact"].length == 0) {
      result.remove("Update_sitecontact");
    }

    if (result["delete_sitecontact"].length == 0) {
      result.remove("delete_sitecontact");
    }

    if (storeUpdatedData.isNotEmpty) {
      result = {...storeUpdatedData};
    }

    if (result.isNotEmpty) {
      print(result);
      updateData(result);
    } else {
      print("No changes detected.");
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            isLoading
                ? const SizedBox(
                    height: 400.0, // Adjust the height as needed
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          projectStartDateController:
                              projectStartDateController,
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
                          secondaryWhatsappController:
                              secondaryWhatsappController,
                          whatsappController: primaryWhatsappController),
                      formSizebox15,
                      const StackText(stacktext: clientArchitect, color: grey),
                      formSizebox15,
                      ..._buildContactFields(clientArchitectControllers),
                      const StackText(stacktext: clientEngineer, color: grey),
                      formSizebox15,
                      ..._buildContactFields(clientEngineerControllers),
                      const StackText(stacktext: siteEngineer, color: grey),
                      formSizebox15,
                      ..._buildContactFields(siteEngineerControllers),
                      const StackText(
                          stacktext: clientPurchaseOfficer, color: grey),
                      formSizebox15,
                      ..._buildContactFields(clientPurchaseOfficerControllers),
                      const StackText(
                          stacktext: clientQualityOfficer, color: grey),
                      ..._buildContactFields(clientQualityOfficerControllers),
                      formSizebox15,
                      isEditing
                          ?  Center(
                            child: CustomButton(
                                backgroundColor: red,
                                buttonText: update,
                                onPressEvent:  checkUpdatingValue,
                              ),
                          )
                          // ElevatedButton(
                          //     onPressed: () => checkUpdatingValue(),
                          //     child: const Text('Update'),
                          //   )
                          : const SizedBox.shrink(),
                      // LongButton(
                      //   formKey: formKey,
                      //   text: update,
                      //   onPressed: () {
                      //      checkUpdatingValue();
                      //      },
                      //   isEnabled: isEnabled,
                      // ),
                      // if (updatedData != null)
                      //   if (updatedData.length != 0)
                      //     Column(
                      //       children: [
                      //         const UpdateHeader(
                      //           updatedByHeader: updateByHeaderText,
                      //           newValueHeader: newvalueHeaderText,
                      //           oldValueHeader: oldvlueHeaderText,
                      //         ),
                      //         ...updatedData.map((eachItem) {
                      //           return updatedDataItem(
                      //             eachItem["updated_old_value"] ?? "",
                      //             eachItem["updated_new_value"] ?? "",
                      //             eachItem["updated_by"].toString(),
                      //           );
                      //         }).toList(),
                      //         bottomHeight,
                      //       ],
                      //     ),
                      bottomHeight
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContactFields(
      List<List<TextEditingController>> controllers) {
    return List.generate(controllers.length, (index) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            // if (index != 0)
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
                          TextEditingController(),
                          TextEditingController(),
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

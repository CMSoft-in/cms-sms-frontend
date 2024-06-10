// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

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
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_header.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_item.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';

class SiteFormDeleteView extends StatefulWidget {
  const SiteFormDeleteView({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<SiteFormDeleteView> createState() => _SiteFormDeleteViewState();
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
class _SiteFormDeleteViewState extends State<SiteFormDeleteView> {
  Map<String, dynamic>? data;
 

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
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic>? data = jsonDecode(response.body) as Map<String, dynamic>?;
      print('Data decoded: $data');

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
          createOn.text = data["created_at"]??  "";
          primaryNameController.text = data[dbPrimaryName]?.toString() ?? "";
          primaryPhoneNumberController.text = data[dbPrimaryNumber]?.toString() ?? "";
          primaryWhatsappController.text = data[""]?.toString() ?? "";
          sitegpsController.text = data[dbSiteGpsLocation]?.toString() ?? "";
          projectWorkNameController.text = data[dbSiteProjectWorkName]?.toString() ?? "";
          projectSizeController.text = data[dbSiteProjectSize]?.toString() ?? "";
          projectStartDateController.text = data[dbSiteProjectStartDate] ??"";
          expectedCompletionDateController.text = data[dbSiteProjectCompletionDate] ?? "";
          projectWorkDescriptionofController.text = data[dbSiteProjectDesc]?.toString() ?? "";
          companySiteEngineersAllocatedController.text = data[""]?.toString() ?? "";
          laborsAllocatedController.text = data[" "]?.toString() ?? "";
          secondaryEmailController.text = data[dbSecondaryEmail]?.toString() ?? "";
          secondaryNameController.text = data[dbSecondaryName]?.toString() ?? "";
          secondaryPhoneNumberController.text = data[dbSecondaryNumber]?.toString() ?? "";
          secondaryWhatsappController.text = data[dbPrimaryWhatsapp]?.toString() ?? "";

          print("Data fetched: $data");

          populateContactControllers(data, "Client Architect", clientArchitectControllers);
          populateContactControllers(data, "Client Site Engineer", siteEngineerControllers);
          populateContactControllers(data, "Client Engineer", clientEngineerControllers);
          populateContactControllers(data, "Client Purchase Officer", clientPurchaseOfficerControllers);
          populateContactControllers(data, "Client Quality Officer", clientQualityOfficerControllers);
        }
      });
    } else {
      print('Failed to load data');
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}



void populateContactControllers(
  Map<String, dynamic> data,
  String category,
  List<List<TextEditingController>> controllers
) {
  if (data.containsKey("CoSiteContacts") && data["CoSiteContacts"] is List) {
    List contacts = data["CoSiteContacts"];
    int index = 0;

    print('Populating contacts for category: $category');

    for (var contact in contacts) {
      if (contact["contact_category_name"] == category) {
        print('Found contact for category $category: ${contact["contact_name"]}');

        // Ensure the controllers list can accommodate the current index
        while (index >= controllers.length) {
          controllers.add([
            TextEditingController(),
            TextEditingController(),
            TextEditingController(),
            TextEditingController()
          ]);
        }

        controllers[index][0].text = contact["contact_name"]?.toString() ?? "";
        controllers[index][1].text = contact["contact_no"]?.toString() ?? "";
        controllers[index][2].text = contact["contact_email"]?.toString() ?? "";
        controllers[index][3].text = contact["contact_whatsapp"]?.toString() ?? "";

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
  } else {
    print('No contacts found in data for category: $category');
  }
}


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
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
              CreateByCreatedOn(
                createByController: createBy,
                createOnController: createOn,
                enabled: false,
              ),
              formSizebox15,
              const deleteTableHeader(
                deleteDate: deleteDate,
                deleteReason: deleteReason,
                deleteperson: deletePerson,
              ),
              DeleteDataItem(
                deletepersonName: 'Admin 1',
                deleteReason: () {
                  if (data == null) {
                    return "";
                  } else {
                    return data!["deletion_reason"].toString();
                  }
                }(),
                deletedDate: () {
                  if (data == null) {
                    return "";
                  } else {
                    return Date.getDate(data!["deleted_At"]).to;
                  }
                }(),
              ),
              bottomHeight,
            ],
          ),
        ),
      ),
      bottomSheet: const BottomSheetLogo(),
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
            isEditing ?  GestureDetector(
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
              ): formSizebox10,
        formSizebox10,
             
            formSizebox10,
                const SizedBox(width: 10),
          ],
        ),
      );
    });
  }
}

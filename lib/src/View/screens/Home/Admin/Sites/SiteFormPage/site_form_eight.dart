import 'dart:convert';
import 'package:cmssms/src/View/widgets/AppBar/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../SiteDataView/site_data_view_main.dart';

class SiteFormPageEight extends StatefulWidget {
  const SiteFormPageEight({super.key, required this.data});
  final data;

  @override
  State<SiteFormPageEight> createState() => _SiteFormPageEightState();
}

class _SiteFormPageEightState extends State<SiteFormPageEight> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  List<List<TextEditingController>> listController = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]
  ];
  final formKey = GlobalKey<FormState>();

  SitesTextEditingController sitesTextEditingController =
      SitesTextEditingController();

  Future<void> submitData() async {
  try {
    List<Map<String, dynamic>> additionalDataList = [];

    var apiURL = Uri.parse(ApiEndpoints.createSite);

    // Iterate through the listController to create additionalDataList
    for (int i = 0; i < listController.length; i++) {
      Map<String, dynamic> additionalOneData = {
        "contact_category_name": clientQualityOfficer,
        'contact_name': listController[i][0].text,
        'contact_no': listController[i][1].text.isNotEmpty ? int.parse(listController[i][1].text) : null,
        'contact_email': listController[i][2].text,
        'contact_whatsapp': listController[i][3].text.isNotEmpty ? int.parse(listController[i][3].text) : null,
      };
      additionalDataList.add(additionalOneData);
    }

    // Copy existing contacts
    List<Map<String, dynamic>> oldContacts = List<Map<String, dynamic>>.from(
      widget.data["sitecontact"].map((item) => Map<String, dynamic>.from(item))
    );

    // Combine oldContacts with additionalDataList
    var data = {
      ...widget.data,
      "sitecontact": [...oldContacts, ...additionalDataList]
    };

    print(data);

    var body = json.encode(data);
    var response = await http.post(
      apiURL,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: body,
    );
    print(response.body);
    if (response.statusCode == 201) {
      print('Response body: ${response.body}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SiteDataView()),
      );
    } else {
      print('Failed to load data: ${response.statusCode}');
      print('Failed to load data: ${response.body}');
    }
  } catch (e) {
    print("Exception in site: $e");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                formSizebox10,
                StackText(stacktext: sitepage8, color: red),
                const SizedBox(height: 15),
                StackText(stacktext: clientQualityOfficer, color: grey),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  itemCount: listController.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  TextformField(
                                    controller: listController[index][0],
                                    text: name,
                                    limitLength: 25,
                                    optionalisEmpty: false,
                                    inputformat: alphabatsSpace,
                                    star: estar,
                                    inputtype: keyboardTypeNone,
                                    enabled: true,
                                  ),
                                  formSizebox10,
                                  PhoneFormField(
                                    controller: listController[index][1],
                                    text: phoneNumber,
                                    limitLength: 10,
                                    optionalisEmpty: false,
                                    inputformat: number,
                                    star: estar,
                                    inputtype: keyboardTypeNumber,
                                    valuelength: 10,
                                    enabled: true,
                                  ),
                                  formSizebox10,
                                  TextformField(
                                    controller: listController[index][2],
                                    text: email,
                                    limitLength: 30,
                                    optionalisEmpty: false,
                                    inputformat: emailonly,
                                    star: estar,
                                    inputtype: keyboardTypeEmail,
                                    enabled: true,
                                  ),
                                  formSizebox10,
                                  PhoneFormField(
                                    controller: listController[index][3],
                                    text: whatsapp,
                                    limitLength: 10,
                                    optionalisEmpty: false,
                                    inputformat: number,
                                    star: estar,
                                    inputtype: keyboardTypeNumber,
                                    valuelength: 10,
                                    enabled: true,
                                  ),
                                  index != 0
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              listController[index].clear();
                                              listController.removeAt(index);
                                            });
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Color(0xFF6B74D6),
                                            size: 35,
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    );
                  },
                ),
                formSizebox10,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      listController.add([
                        TextEditingController(),
                        TextEditingController(),
                        TextEditingController(),
                        TextEditingController()
                      ]);
                    });
                  },
                  child: Text("Add More $clientQualityOfficer"),
                ),
               formSizebox15,
                bottomHeight,
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BackNextButton(formKey: formKey, isEnabled: true, onPress: submitData),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

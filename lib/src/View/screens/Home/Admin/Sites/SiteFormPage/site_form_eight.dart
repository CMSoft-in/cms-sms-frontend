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
      var apiURL = Uri.parse(ApiEndpoints.createSite);

//       List<Map<String, String>> additionalData = listController.map((controllers) {
//         return {
//           "contact_category_name": clientQualityOfficer,
//           'name': controllers[0].text,
//           'phoneNumber': controllers[1].text,
//           'email': controllers[2].text,
//           'whatsapp': controllers[3].text,
//         };
//       }).toList();
// var oldData = widget.data;
//       var data = {
        
//         ...oldData,
//         'sitecontact': additionalData,
       
//       };
Map<String, dynamic> additionalOneData = {
  "contact_category_name": clientQualityOfficer,
  'contact_name': listController[0][0].text,
  'contact_no': int.parse(listController[0][1].text),
  'contact_email': listController[0][2].text,
  'contact_whatsapp': int.parse(listController[0][3].text),
};

 List<Map<String, String>> old = List<Map<String, String>>.from(widget.data["sitecontact"]);
  print(old);

  var data = {
    ...widget.data,
    "sitecontact": [...old, additionalOneData]
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
                  child: Text("Add More"),
                ),
                const SizedBox(width: 10),
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

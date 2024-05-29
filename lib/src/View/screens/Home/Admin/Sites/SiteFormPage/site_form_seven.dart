import 'package:flutter/material.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import '/src/View/widgets/AppBar/AppBar.dart';
import 'site_form_eight.dart';

class SiteFormPageSeven extends StatefulWidget {
  const SiteFormPageSeven({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<SiteFormPageSeven> createState() => _SiteFormPageSevenState();
}

class _SiteFormPageSevenState extends State<SiteFormPageSeven> {
  List<List<TextEditingController>> listOneController = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]
  ];

  List<List<TextEditingController>> listTwoController = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]
  ];

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    void navigateToPageEight(BuildContext context) {
      try {
        Map<String, dynamic> additionalOneData = {
          "contact_category_name": siteEngineer,
          'contact_name': listOneController[0][0].text,
          'contact_no': int.tryParse(listOneController[0][1].text) ?? "",
          'contact_email': listOneController[0][2].text,
          'contact_whatsapp': int.tryParse(listOneController[0][3].text) ?? "",
        };

        Map<String, dynamic> additionalTwoData = {
          "contact_category_name": clientPurchaseOfficer,
          'contact_name': listTwoController[0][0].text,
          'contact_no': int.tryParse(listTwoController[0][1].text) ?? 0,
          'contact_email': listTwoController[0][2].text,
          'contact_whatsapp': int.tryParse(listTwoController[0][3].text) ?? 0,
        };

        List<Map<String, dynamic>> old = List<Map<String, dynamic>>.from(
          widget.data["sitecontact"].map((item) => Map<String, dynamic>.from(item))
        );

        var data = {
          ...widget.data,
          "sitecontact": [...old, additionalOneData, additionalTwoData]
        };

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SiteFormPageEight(data: data),
          ),
        );
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              formSizebox8,
              const StackText(stacktext: sitepage7, color: red),
              formSizebox15,
              StackText(stacktext: siteEngineer, color: grey),
              const SizedBox(height: 15),
              buildSiteEngineerFields(listOneController),
              formSizebox10,
              GestureDetector(
                onTap: () {
                  setState(() {
                    listOneController.add([
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
              const SizedBox(width: 10),
              StackText(stacktext: clientPurchaseOfficer, color: grey),
              formSizebox10,
              buildClientPurchaseOfficerFields(listTwoController),
              formSizebox10,
              GestureDetector(
                onTap: () {
                  setState(() {
                    listTwoController.add([
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
              formSizebox10,
              bottomHeight,
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
        formKey: formKey,
        isEnabled: true,
        onPress: () => navigateToPageEight(context),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }

  Widget buildSiteEngineerFields(List<List<TextEditingController>> controllers) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      itemCount: controllers.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  TextformField(
                    controller: controllers[index][0],
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
                    controller: controllers[index][1],
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
                    controller: controllers[index][2],
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
                    controller: controllers[index][3],
                    text: whatsapp,
                    limitLength: 10,
                    optionalisEmpty: false,
                    inputformat: number,
                    star: estar,
                    inputtype: keyboardTypeNumber,
                    valuelength: 10,
                    enabled: true,
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
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        );
      },
    );
  }

  Widget buildClientPurchaseOfficerFields(List<List<TextEditingController>> controllers) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      itemCount: controllers.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  TextformField(
                    controller: controllers[index][0],
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
                    controller: controllers[index][1],
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
                    controller: controllers[index][2],
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
                    controller: controllers[index][3],
                    text: whatsapp,
                    limitLength: 10,
                    optionalisEmpty: false,
                    inputformat: number,
                    star: estar,
                    inputtype: keyboardTypeNumber,
                    valuelength: 10,
                    enabled: true,
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
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        );
      },
    );
  }
}

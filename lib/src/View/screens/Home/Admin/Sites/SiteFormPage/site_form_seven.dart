import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '/src/View/widgets/AppBar/AppBar.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import 'site_form_eight.dart';

class SiteFormPageSeven extends StatefulWidget {
  const SiteFormPageSeven({super.key, required this.data});
  final Map data;

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
    // var oldData = widget.data;
  
  final formKey = GlobalKey<FormState>();

  // SitesTextEditingController sitesTextEditingController =
  //     SitesTextEditingController();


    void navigateToPageEight(BuildContext context) {
  Map<String, dynamic> additionalOneData = {
    "contact_category_name": siteEngineer,
    'contact_name': listOneController[0][0].text,
    'contact_no': int.parse(listOneController[0][1].text),
    'contact_email': listOneController[0][2].text,
    'contact_whatsapp': int.parse(listOneController[0][3].text),
  };

  Map<String, dynamic> additionalTwoData = {
    "contact_category_name":clientPurchaseOfficer,
    'contact_name': listTwoController[0][0].text,
    'contact_no': int.parse(listTwoController[0][1].text),
    'contact_email': listTwoController[0][2].text,
    'contact_whatsapp': int.parse(listTwoController[0][3].text),
  };
print(int.parse(listTwoController[0][1].text).runtimeType);
  List<Map<String, String>> old = List<Map<String, String>>.from(widget.data["sitecontact"]);
  print(old);

  var data = {
    ...widget.data,
    "sitecontact": [...old, additionalOneData, additionalTwoData]
  };
  print(data);

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SiteFormPageEight(data: data),
    ),
  );
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
      ),),
      bottomSheet: BackNextButton(formKey:formKey ,isEnabled: true,
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

  // void navigateToPageEight(BuildContext context) {
  //   List<Map<String, String>> additionalOneData = listOneController.map((controllers) {
  //     return {
  //       'name': controllers[0].text,
  //       'phoneNumber': controllers[1].text,
  //       'email': controllers[2].text,
  //       'whatsapp': controllers[3].text,
  //     };
  //     }).toList();

  //   List<Map<String, String>> additionalTwoData = listTwoController.map((controllers) {
  //     return {
  //       'name': controllers[0].text,
  //       'phoneNumber': controllers[1].text,
  //       'email': controllers[2].text,
  //       'whatsapp': controllers[3].text,
  //     };
  //   }).toList();

  //   var data = {
  //     ...widget.data,
  //     'additionalDataOne': additionalOneData,
  //     'additionalDataTwo': additionalTwoData,
  //   };
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => SiteFormPageSeven(data: data),
  //     ),
  //   );
  // }
}

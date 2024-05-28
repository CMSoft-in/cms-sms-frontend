import 'package:flutter/material.dart';
import '../../../../../../Model/Const/text_const.dart';
import 'site_form_seven.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import '/src/View/widgets/AppBar/AppBar.dart';

class SiteFormPageSix extends StatefulWidget {
  const SiteFormPageSix({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  State<SiteFormPageSix> createState() => _SiteFormPageSixState();
}
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
class _SiteFormPageSixState extends State<SiteFormPageSix> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

 

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
              formSizebox8,
              const StackText(stacktext: sitepage6, color: red),
              formSizebox15,
              StackText(stacktext: clientArchitect, color: grey),
              const SizedBox(height: 15),
              buildClientArchitectFields(listOneController),
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
              StackText(stacktext: clientEngineer, color: grey),
              formSizebox10,
              buildClientEngineerFields(listTwoController),
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
      bottomSheet: BackNextButton(formKey:formKey ,isEnabled: true,
        onPress: () => navigateToPageSeven(context),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }

  Widget buildClientArchitectFields(List<List<TextEditingController>> controllers) {
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

  Widget buildClientEngineerFields(List<List<TextEditingController>> controllers) {
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
void navigateToPageSeven(BuildContext context) {
  Map<String, dynamic> additionalOneData = {
    "contact_category_name": "Client Architect",
    'contact_name': listOneController[0][0].text, // Accessing the first TextEditingController's text property in the first sublist
    'contact_no': int.parse(listOneController[0][1].text),
    'contact_email': listOneController[0][2].text,
    'contact_whatsapp': int.parse(listOneController[0][3].text),
  };

  Map<String, dynamic> additionalTwoData = {
    "contact_category_name": "Client Engineer",
    'contact_name': listTwoController[0][0].text,
    'contact_no': int.parse(listTwoController[0][1].text),
    'contact_email': listTwoController[0][2].text,
    'contact_whatsapp': int.parse(listTwoController[0][3].text),
  };
// print(additionalOneData);
  var data = {
    ...widget.data,
    "sitecontact":[additionalOneData,additionalTwoData]
  };

  print(data);

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SiteFormPageSeven(data: data),
    ),
  );
}

// void navigateToPageSeven(BuildContext context) {
//   Map<String, String> additionalOneData = {
//     "contact_category_name": "Client Architect",
//     'name': listOneController[0].text,
//     'phoneNumber': listOneController[1].text,
//     'email': listOneController[2].text,
//     'whatsapp': listOneController[3].text,
//   };

//   Map<String, String> additionalTwoData = {
//     "contact_category_name": "Client Engineer",
//     'name': listTwoController[0].text,
//     'phoneNumber': listTwoController[1].text,
//     'email': listTwoController[2].text,
//     'whatsapp': listTwoController[3].text,
//   };

//   var data = {
//     ...widget.data,
//     ...additionalOneData,
//     ...additionalTwoData,
//   };

//   print(data);

//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => SiteFormPageSeven(data: data),
//     ),
//   );
// }

}

import 'package:flutter/material.dart';
import '../../../../../../Model/Const/text_const.dart';
import 'site_form_six.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/phone_text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import '/src/View/widgets/AppBar/AppBar.dart';

class SiteFormPageFive extends StatefulWidget {
  const SiteFormPageFive({Key? key, required this.data}) : super(key: key);
  final Map<String, dynamic> data;

  @override
  State<SiteFormPageFive> createState() => _SiteFormPageFiveState();
}
  
class _SiteFormPageFiveState extends State<SiteFormPageFive> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
   
    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              formSizebox8,
              const StackText(stacktext: sitepage5, color: red),
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
                child: Text("Add More $clientArchitect"),
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
                child: Text("Add More $clientEngineer"),
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
   List<Map<String, dynamic>> additionalDataList = [];
 
  for (int i = 0; i < listOneController.length; i++) {
    
      Map<String, dynamic> additionalOneData = {
        "contact_category_name": "Client Architect",
        'contact_name': listOneController[i][0].text,
        'contact_no': int.tryParse(listOneController[i][1].text) ?? null,
        'contact_email': listOneController[i][2].text,
        'contact_whatsapp': int.tryParse(listOneController[i][3].text) ?? null,
      };
      additionalDataList.add(additionalOneData);
    }
  

  
  for (int i = 0; i < listTwoController.length; i++) {
    
      Map<String, dynamic> additionalTwoData = {
        "contact_category_name": "Client Engineer",
        'contact_name': listTwoController[i][0].text,
        'contact_no': int.tryParse(listTwoController[i][1].text) ?? null,
        'contact_email': listTwoController[i][2].text,
        'contact_whatsapp': int.tryParse(listTwoController[i][3].text) ?? null,
      };
      additionalDataList.add(additionalTwoData);
    }
 

  var data = {
    ...widget.data,
    "sitecontact":  [...additionalDataList]
  };
print(data);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SiteFormPageSix(data: data),
    ),
  );
}

}

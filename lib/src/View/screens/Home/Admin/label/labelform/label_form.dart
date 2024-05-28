import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../label_text.dart';
import '/src/Model/api/local.dart';
import '/src/View/screens/Home/Admin/Clients/ClientDataView/client_data_view_main.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';


class LabelFormPage extends StatefulWidget {
  const LabelFormPage({
    super.key,
  });

  @override
  State<LabelFormPage> createState() => _LabelFormPageState();
}

class _LabelFormPageState extends State<LabelFormPage> {
  //  _labels = [];
  final List<TextEditingController> _labelController = [
    TextEditingController()
  ];

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

  final TextEditingController labelHeadingController=TextEditingController();

Future<void> navigateToPage(BuildContext context) async {
  print(token);
  var apiURL = Uri.parse('$ip/Admin/create-client');

  // Extracting labels from controllers
  List<String> labels = [];
  _labelController.forEach((controller) {
    labels.add(controller.text);
  });

  var values = {
    "label_heading":labelHeadingController.text,
    "labels": labels,
  };
  print(values);

  var body = json.encode(values);
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
      MaterialPageRoute(
        builder: (context) => const ClientDataView(),
      ),
    );
  } else {
    print(response.body);
    print('Failed to load data: ${response.statusCode}');
  }
}
 
// 
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      body:
      SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  formSizebox10,
                  const StackText(
                    stacktext: addLabel,
                    color: black,
                  ),
                  formSizebox15,
                  DropDownForm(
                    dropdownItems: [
                      "Client Label",
                      "Site Label",
                      "Labor Label",
                      "Materials Label"
                    ],
                    dropDownName: labelHeading,
                    star: star,
                    optionalisEmpty: true,
                    controller:
                       labelHeadingController, // Initialize or pass labelHeadingController
                  ),
                  formSizebox10,
                  Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _labelController.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              TextformField(
                                controller: _labelController[index],
                                text: titleLabel,
                                limitLength: 50,
                                optionalisEmpty: false,
                                inputformat: alphabatsAndNumbers,
                                star: estar,
                                inputtype: keyboardTypeNone,
                                enabled: true,
                              ),
                                formSizebox10,
                                  index != 0
                                          ? GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _labelController[index].clear();
                      
                                                  _labelController.removeAt(index);
                                                });
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                color: Color(0xFF6B74D6),
                                                size: 35,
                                              ),
                                            )
                                          : const SizedBox()
                            ],
                          )
                        ;
                        },
                      ),
                         ElevatedButton(
                    onPressed: () {
                      setState(() {
                       
                        _labelController.add(TextEditingController());
                        // _labelController.clear();
                      });
                    },
                    
                    child: Text('Add'),
                  ),
                    ],
                  ),
                  
               
                
                  formSizebox15,
                  bottomHeight,
                ],
              ),
            ),
          ),
        ),
      ),
    
  
      bottomSheet: BackNextButton(
        formKey: formKey,
        isEnabled: true,
        onPress: () => navigateToPage(context),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}
// void _printForm() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) => pw.Center(
//           child: pw.Column(
//             children: [
//               pw.Text('Labels:', style: pw.TextStyle(fontSize: 24)),
//               pw.SizedBox(height: 10),
//               for (var controller in _labelController)
//                 pw.Text(controller.text, style: pw.TextStyle(fontSize: 18)),
//             ],
//           ),
//         ),
//       ),
//     );

//     await Printing.layoutPdf(
//       onLayout: (PdfPageFormat format) async => pdf.save(),
//     );
//   }
  

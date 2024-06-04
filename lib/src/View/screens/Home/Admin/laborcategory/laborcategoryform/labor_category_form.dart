import 'dart:convert';

import 'package:cmssms/src/View/screens/Home/Admin/labor/labor_text_const.dart';

import '../../../../../../Model/api/api_model.dart';
import '/src/Model/Const/text_const.dart';
import '/src/View/widgets/AppBar/AppBar.dart';
import '/src/View/widgets/Buttons/Long_SizeButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../../Model/Const/padding_const.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';

import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_width.dart';
import '../labor_category_text.dart';
import '../laborcategorydataview/labor_category_data_view.dart';
import '../laborcategoryviewdetails/labor_category_view.dart';

class LaborCategoryForm extends StatefulWidget {
  const LaborCategoryForm({super.key});

  @override
  State<LaborCategoryForm> createState() => _LaborCategoryFormState();
}

class _LaborCategoryFormState extends State<LaborCategoryForm> {
  final List<TextEditingController> _labourController = [TextEditingController()];
  final List<TextEditingController> _rateController = [TextEditingController()];

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    LaborCategoryTextEditingController laborCategoryTextEditingController =
        LaborCategoryTextEditingController();

    Future navigateToPage(context) async {
      var apiURL = Uri.parse(ApiEndpoints.createLabourCategory);
      try {
        List<Map<String, String>> teamData = [];
        for (int i = 0; i < _labourController.length; i++) {
          teamData.add({
            "co_labour_category_team_name": _labourController[i].text  ,
            "co_labour_category_team_rate": _rateController[i].text,
          });
        }

        var values = {
          "co_labour_category_name":
              laborCategoryTextEditingController.laborCategoryController.text.isEmpty ? null :laborCategoryTextEditingController.laborCategoryController.text.trim(),
          "co_labour_category_desc": laborCategoryTextEditingController
              .categorydistributionController.text.isEmpty ? null :laborCategoryTextEditingController
              .categorydistributionController.text.trim(),
          "co_labour_category_team": teamData,
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

        if (response.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LaborCategoryDataView(),
            ),
          );
        } else {
          print(response.body);
          print('Failed to load data: ${response.statusCode}');
        }
      } catch (e) {
        print("Labour category creation error: $e");
      }
    }

    return Scaffold(
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              formSizebox8,
              const DetailsText(enterDetails: laborCategorydetails),
              formSizebox15,
              LaborCategoryViewDetails(
                enabled: true,
                laborCategoryController:
                    laborCategoryTextEditingController.laborCategoryController,
                categorydistributionController: laborCategoryTextEditingController
                    .categorydistributionController,
              ),
              formSizebox10,
              ListView.builder(
                shrinkWrap: true,
                itemCount: _labourController.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormFieldWidth(
                              Width: 230,
                              controller: _labourController[index],
                              text: teamMember,
                              limitLength: 50,
                              optionalisEmpty: false,
                              inputformat: alphabatsAndNumbers,
                              star: estar,
                              inputtype: keyboardTypeNone,
                              enabled: true,
                            ),
                            Padding(
                              padding: left10,
                              child: TextFormFieldWidth(
                                Width: 100,
                                controller: _rateController[index],
                                text: rate,
                                limitLength: 10,
                                optionalisEmpty: false,
                                inputformat: number,
                                star: estar,
                                inputtype: keyboardTypeNone,
                                enabled: true,
                              ),
                            ),
                          ],
                        ),
                        formSizebox10,
                        index != 0
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _labourController[index].clear();
                                    _rateController[index].clear();
                                    _labourController.removeAt(index);
                                    _rateController.removeAt(index);
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
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _labourController.add(TextEditingController());
                    _rateController.add(TextEditingController());
                  });
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: LongButton(
        text: submit,
        onPressed: () => navigateToPage(context),
        isEnabled: true,
        formKey: formKey,
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

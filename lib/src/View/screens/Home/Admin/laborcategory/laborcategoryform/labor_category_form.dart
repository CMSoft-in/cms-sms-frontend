import '../../../../../../Model/api/api_model.dart';
import '/src/Model/Const/text_const.dart';
import '/src/View/widgets/AppBar/AppBar.dart';
import '/src/View/widgets/Buttons/Long_SizeButton.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../labor_category_text.dart';
import '../laborcategorydataview/labor_category_data_view.dart';
import '../laborcategoryviewdetails/labor_category_view.dart';

class LaborCategoryForm extends StatefulWidget {
  const LaborCategoryForm({super.key});

  @override
  State<LaborCategoryForm> createState() => _LaborCategoryFormState();
}

class _LaborCategoryFormState extends State<LaborCategoryForm> {
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
        var values = {
          "co_labour_category_name":
              laborCategoryTextEditingController.laborCategoryController.text,
          "co_labour_category_desc": laborCategoryTextEditingController
              .categorydistributionController.text
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
        print("Labour category creation $e");
      }
    }

    return Scaffold(
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(children: [
              formSizebox8,
              const DetailsText(enterDetails: laborCategorydetails),
              formSizebox15,
              LaborCategoryViewDetails(
                  enabled: true,
                  laborCategoryController: laborCategoryTextEditingController
                      .laborCategoryController,
                  categorydistributionController:
                      laborCategoryTextEditingController
                          .categorydistributionController)
            ])),
      ),
      bottomSheet: LongButton(
          text: submit,
          onPressed: () => navigateToPage(context),
          isEnabled: true,
          formKey: formKey),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

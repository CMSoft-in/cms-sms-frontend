import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../Model/api/local.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/Long_SizeButton.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../work_category_text.dart';
import '../workcategoryview/work_category_view.dart';
import '../workcategorydataview/work_category_data_view.dart';

class WorkCategoryForm extends StatefulWidget {
  const WorkCategoryForm({Key? key}) : super(key: key);

  @override
  State<WorkCategoryForm> createState() => _WorkCategoryFormState();
}

class _WorkCategoryFormState extends State<WorkCategoryForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final WorkCategoryTextEditingController workCategoryTextEditingController =
      WorkCategoryTextEditingController();

  Future<void> navigateToPage(BuildContext context) async {
    try {
      var apiURL = Uri.parse('$ip/Admin/create-work-category');

      Map<String, dynamic> values = {
        "co_work_category_name":
            workCategoryTextEditingController.workCategoryController.text,
        "co_work_category_desc": workCategoryTextEditingController
            .categorydistributionController.text,
        "co_work_category_outturn_value":
            workCategoryTextEditingController.outturnValueController.text,
        "co_work_category_outturn_measurement":
            workCategoryTextEditingController.outturnMeasurementController.text
      };

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
      
        workCategoryTextEditingController.clearFields();

      
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WorkCategoryDataView(),
          ),
        );
      } else {
        print('Failed to load data: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print("Exception $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              formSizebox8,
              const DetailsText(enterDetails: workCategorydetails),
              formSizebox15,
              WorkCategoryView(
                enabled: true,
                workCategoryController:
                    workCategoryTextEditingController.workCategoryController,
                categorydistributionController:
                    workCategoryTextEditingController
                        .categorydistributionController,
                outturnValueController:
                    workCategoryTextEditingController.outturnValueController,
                outturnMeasurementController: workCategoryTextEditingController
                    .outturnMeasurementController,
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

class WorkCategoryTextEditingController {
  final TextEditingController workCategoryController = TextEditingController();
  final TextEditingController categorydistributionController =
      TextEditingController();
  final TextEditingController outturnValueController = TextEditingController();
  final TextEditingController outturnMeasurementController =
      TextEditingController();

  void clearFields() {
    workCategoryController.clear();
    categorydistributionController.clear();
    outturnValueController.clear();
    outturnMeasurementController.clear();
  }
}

import 'package:cmssms/src/Model/api/api_model.dart';

import '../materialsdataview/materials_data_view.dart';
import '/src/Model/Const/text_const.dart';
import '/src/View/screens/Home/Admin/materials/materialsviewdetails/materials_view_details.dart';
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
import '../materials_text.dart';

class MaterialForm extends StatefulWidget {
  const MaterialForm({super.key});

  @override
  State<MaterialForm> createState() => _MaterialFormState();
}

class _MaterialFormState extends State<MaterialForm> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    MaterialsTextEditingController materialsTextEditingController =
        MaterialsTextEditingController();

    Future navigateToPage(context) async {
      try {
        print(token);
        var apiURL = Uri.parse(ApiEndpoints.createMaterial);

        var values = {
          "co_material_name": materialsTextEditingController.materialController.text.isEmpty ? null :materialsTextEditingController.materialController.text.trim(),
          "material_variant": materialsTextEditingController.variantController.text.isEmpty ? null : materialsTextEditingController.variantController.text,
          "quantity_values":
              materialsTextEditingController.quantityValuesController.text.isEmpty ? null :materialsTextEditingController.quantityValuesController.text.trim(),
          "quantity_measurement":
              materialsTextEditingController.quantityMeasurementController.text.isEmpty ? null : materialsTextEditingController.quantityMeasurementController.text.trim(),
          "HSN_code": materialsTextEditingController.hSNCodeController.text.isEmpty ? null : materialsTextEditingController.hSNCodeController.text.trim(),
          "CGST": materialsTextEditingController.cGstController.text.isEmpty ? null :materialsTextEditingController.cGstController.text.trim(),
          "SGST": materialsTextEditingController.sGstController.text.isEmpty ? null :materialsTextEditingController.sGstController.text.trim(),
          "IGST": materialsTextEditingController.iGstController.text.isEmpty ? null :materialsTextEditingController.iGstController.text.trim(),
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
              builder: (context) => const MaterialsDataView(),
            ),
          );
        } else {
          print(response.body);
          print('Failed to load data: ${response.statusCode}');
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(children: [
              formSizebox8,
              const DetailsText(enterDetails: materialDetails),
              formSizebox15,
              MaterialsViewDetails(
                enabled: true,
                isEditing: true,
                materialController:
                    materialsTextEditingController.materialController,
                variantController:
                    materialsTextEditingController.variantController,
                quantityMeasurementController: materialsTextEditingController
                    .quantityMeasurementController,
                quantityValuesController:
                    materialsTextEditingController.quantityValuesController,
                cGstController: materialsTextEditingController.cGstController,
                hSNCodeController:
                    materialsTextEditingController.hSNCodeController,
                iGstController: materialsTextEditingController.iGstController,
                sGstController: materialsTextEditingController.sGstController,
              )
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

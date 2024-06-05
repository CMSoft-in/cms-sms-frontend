import 'package:cmssms/src/Model/api/api_model.dart';

import '../suppliercategorydataview/supplier_category_data_view.dart';
import '/src/Model/Const/text_const.dart';
import '../suppliercategoryviewdetails/supplier_category_view_details.dart';
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
import '../supplier_category_text.dart';

class SupplierCategoryForm extends StatefulWidget {
  const SupplierCategoryForm({super.key});

  @override
  State<SupplierCategoryForm> createState() => _SupplierCategoryFormState();
}

class _SupplierCategoryFormState extends State<SupplierCategoryForm> {
  List<dynamic> comaterialCategoryId = [];
   final formKey = GlobalKey<FormState>();
    SupplierCategoryTextEditingController
        supplierCategoryTextEditingController =
        SupplierCategoryTextEditingController();

    
  @override
  void initState() {
    super.initState();
    getToken();
  }

void changeValue(List<dynamic> v) {
    setState(() {
      comaterialCategoryId = v;
    });
  }

  
    Future navigateToPage(context) async {
      print(token);
      try {
        var apiURL = Uri.parse(ApiEndpoints.createSupplierCategory);

        var values = {
          "co_supplier_category_name":
              supplierCategoryTextEditingController.supplierCategoryController.text.isEmpty ? null :supplierCategoryTextEditingController.supplierCategoryController.text,
          "co_material_id":comaterialCategoryId.isEmpty ? null :comaterialCategoryId.toString()
            ,
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
        print(response.body);
        if (response.statusCode == 201) {
          print('Response body: ${response.body}');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SupplierCategoryDataView(),
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
  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(children: [
              formSizebox8,
              const DetailsText(enterDetails: supplierCategorydetails),
              formSizebox15,
              SupplierCategoryViewDetails(
                changeValue: changeValue,
                comaterialCategoryId: comaterialCategoryId.isNotEmpty ? comaterialCategoryId.first : null,
                  enabled: true,
                  isEditing: true,
                  supplierCategoryController:
                      supplierCategoryTextEditingController
                          .supplierCategoryController,
                  materialSuppliedController:
                      supplierCategoryTextEditingController
                          .materialSuppliedController)
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

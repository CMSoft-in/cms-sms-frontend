// // ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'package:cmssms/src/Model/api/api_model.dart';

import '../labor_text_const.dart';
import '../labordataview/labor_data_view.dart';
import '/src/Model/api/local.dart';
import '../laborviewdetails/labor_view_details_five.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import 'package:http/http.dart' as http;
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';


class LaborFormPageFive extends StatefulWidget {
  const LaborFormPageFive({super.key, required this.data});
  final Map data;

  @override
  State<LaborFormPageFive> createState() => _LaborFormPageFiveState();
}

class _LaborFormPageFiveState extends State<LaborFormPageFive> {

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final oldData = widget.data;
    final formKey = GlobalKey<FormState>();
   LaborTextEditingController laborTextEditingController=LaborTextEditingController();
    Future navigateToPage(context) async {
      var apiURL = Uri.parse(ApiEndpoints.createLabour);
      var values = {
        ...oldData,
        "gpay_no": laborTextEditingController.gpayNumberController.text.isEmpty ? null :int.parse(laborTextEditingController.gpayNumberController.text.trim()),
        "bank_acc_name": laborTextEditingController.accountNameController.text.isEmpty ? null :laborTextEditingController.accountNameController.text.trim(),
        "bank_acc_no": laborTextEditingController.accountNumberController.text.isEmpty ? null :int.parse(laborTextEditingController.accountNumberController.text.trim()),
        "bank_acc_type": laborTextEditingController.accountTypeController.text.isEmpty ? null :laborTextEditingController.accountTypeController.text.trim(),
        "bank_name": laborTextEditingController.bankNameController.text.isEmpty ? null :laborTextEditingController.bankNameController.text.trim(),
        "bank_ifsc_code": laborTextEditingController.ifscCodeController.text.isEmpty ? null :laborTextEditingController.ifscCodeController.text.trim(),
        "bank_acc_location": laborTextEditingController.bankLocationController.text.isEmpty ? null :laborTextEditingController.bankLocationController.text.trim(),
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
        print ("ffnjjghjghj");
        print('Response body: ${response.body}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LaborDataView(),
          ),
        );
      } else {
          print ("else");
        print(response.body);
        print('Failed to load data: ${response.statusCode}');
      }
    }
  
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      const StackText(
                        stacktext: laborpage5,
                        color: red,
                      ),
                      const SizedBox(height: 15),
                      LaborViewDetailsFive(
                        isEditing: true,
                          gpayNumber:laborTextEditingController. gpayNumberController,
                          accountNameController:laborTextEditingController. accountNameController,
                          accountNumberController:laborTextEditingController. accountNumberController,
                          accountTypeController: laborTextEditingController.accountTypeController,
                          bankLocationController: laborTextEditingController.bankLocationController,
                          bankNameController: laborTextEditingController.bankNameController,
                          ifscCodeController:laborTextEditingController. ifscCodeController,
                          enabled: true),
                      formSizebox15,
                      bottomHeight,
                    ],
                  ),
                ),
              ),
            ],
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
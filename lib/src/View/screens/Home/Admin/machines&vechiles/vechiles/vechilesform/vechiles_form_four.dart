// // ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import '../../../../../../../Model/api/api_model.dart';
import '../vechilesdataview/vechiles_data_view.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/vechiles/vechilesviewdetails/vechiles_view_details_four.dart';
import '../../../../../../../Model/Const/color.dart';
import '../../../../../../../Model/Const/height_width.dart';
import '../../../../../../../Model/api/local.dart';
import '../../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../m_v_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VechilesFormPageFour extends StatefulWidget {
  const VechilesFormPageFour({super.key, required this.data});
  final Map data;

  @override
  State<VechilesFormPageFour> createState() => _VechilesFormPageFourState();
}

class _VechilesFormPageFourState extends State<VechilesFormPageFour> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final oldData = widget.data;
    final formKey = GlobalKey<FormState>();
    VechilesTextEditingController vechilesTextEditingController =
        VechilesTextEditingController();


    Future<void> navigateToPage(context) async {
      try{
           print(token);
      var apiURL = Uri.parse(ApiEndpoints.createVehicle);

      var values = {
        ...oldData,
        "co_vehicle_insurance_exp_date": vechilesTextEditingController. insuranceExpiryDateController.text.isEmpty ? null :vechilesTextEditingController. insuranceExpiryDateController.text.trim(),
          "co_vehicle_next_fitness_certificate_date": 
          vechilesTextEditingController.nextFCDateController.text.isEmpty ? null :
          vechilesTextEditingController.nextFCDateController.text,
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
            builder: (context) => const VechilesDataView(),
          ),
        );
      } else {
        print(response.body);
        print('Failed to load data: ${response.statusCode}');
      }
      }catch(e){
        print(e);
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
                        stacktext: mvpage4,
                        color: red,
                      ),
                      formSizebox15,
                      VechilesViewDetailsFour(
                          enabled: true,
                          isEditing: true,
                          insuranceExpiryDateController:
                              vechilesTextEditingController
                                  .insuranceExpiryDateController,
                          nextFCDateController: vechilesTextEditingController
                              .nextFCDateController),
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

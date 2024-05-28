// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../labor_outturn_text.dart';
import '../laboroutturnviewdetails/labor_outturn_view_details_four.dart';
import '/src/Model/api/local.dart';
import '/src/View/screens/Home/Admin/Clients/ClientDataView/client_data_view_main.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';

class LaborOutturnFormPageFour extends StatefulWidget {
  const LaborOutturnFormPageFour({super.key, required this.data});
  final Map data;

  @override
  State<LaborOutturnFormPageFour> createState() =>
      _LaborOutturnFormPageFourState();
}

class _LaborOutturnFormPageFourState extends State<LaborOutturnFormPageFour> {
  bool outturnBaseSelect = false;
  bool rateBaseSelect = true;

 
  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final oldData = widget.data;
    final formKey = GlobalKey<FormState>();
    LaborOutturnTextEditing laborOutturnTextEditing = LaborOutturnTextEditing();


void outturnBasedonChanged(bool? value) {
  if (value != null && value) {
    setState(() {
      outturnBaseSelect = value;
      rateBaseSelect = !value;
    });
  }
}

void rateBasedonChanged(bool? value) {
  if (value != null && value) {
    setState(() {
      rateBaseSelect = value;
      outturnBaseSelect = !value; 
    });
  }
}



    Future<void> navigateToPage(BuildContext context) async {
      print(token);
      var apiURL = Uri.parse('$ip/Admin/create-client');

      var values = {
        ...oldData,
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
                      formSizebox8,
                      const StackText(
                        stacktext: laborOutturnpage4,
                        color: red,
                      ),
                      formSizebox15,
                      LaborOuttrnViewDetailsFour(
                        siteBasedController:laborOutturnTextEditing.siteBasedController ,
                        siteController: laborOutturnTextEditing.siteController,
                        isEditing: true,
                        rateBasedonChanged: rateBasedonChanged, 
                        rateBasedvalue: rateBaseSelect,
                        outturnBasedvalue: outturnBaseSelect,
                        outturnBasedonChanged:  outturnBasedonChanged, 
                        enabled: true,
                      ),
                      formSizebox10,
                     
                      // laborOutturnTextEditing.siteController.text.toString()),
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

// // ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../controler/ClientController/db_client_controller.dart';
import '/src/Model/api/local.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../ClientViewDetails/client_view_details_five.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import 'package:http/http.dart' as http;
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/utility/client/client_text_const.dart';
import 'client_form_page_six.dart';

class ClientFormPageFive extends StatefulWidget {
  const ClientFormPageFive({super.key, required this.data});
  final Map data;

  @override
  State<ClientFormPageFive> createState() => _ClientFormPageFiveState();
}

class _ClientFormPageFiveState extends State<ClientFormPageFive> {
  void getToken() async {
    var pref = await SharedPreferences.getInstance();
    token = pref.getString("token")!;
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final oldData = widget.data;
    final formKey = GlobalKey<FormState>();
    final DBClientController dbClientController = DBClientController();

    Future<void> navigateToPageSix(context) async {
      print(token);
      try {
        var apiURL = Uri.parse(ApiEndpoints.createClient);

        var values = {
          ...oldData,
          dbClientController.dbGSTNumber:
              gstController.text.isEmpty ? null : gstController.text,
          dbClientController.dbBankAccountNumber:
              accountNumberController.text.isEmpty
                  ? null
                  : int.parse(accountNumberController.text),
          dbClientController.dbBankIFSCCode:
              ifscCodeController.text.isEmpty ? null : ifscCodeController.text,
          dbClientController.dbBankAccountName:
              accountNameController.text.isEmpty
                  ? null
                  : accountNameController.text,
          dbClientController.dbBankAccountType:
              accountTypeController.text.isEmpty
                  ? null
                  : accountTypeController.text,
          dbClientController.dbBankName:
              bankNameController.text.isEmpty ? null : bankNameController.text,
          dbClientController.dbBankAccountLocation:
              bankLocationController.text.isEmpty
                  ? null
                  : bankLocationController.text,
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
          var body = json.decode(response.body);
          String id = body["co_client_id"].toString();
          print(id);
          print('Response body: ${response.body}');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClientFormPageSix(id: id),
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
                        stacktext: clientpage5,
                        color: red,
                      ),
                      const SizedBox(height: 15),
                      ClientViewDetailsFive(
                        gstNumber: gstController,
                        accountNumberController: accountNumberController,
                        ifscCodeController: ifscCodeController,
                        accountNameController: accountNameController,
                        accountTypeController: accountTypeController,
                        bankNameController: bankNameController,
                        bankLocationController: bankLocationController,
                        enabled: true,
                        isEditing: true,
                      ),
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
        onPress: () => navigateToPageSix(context),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

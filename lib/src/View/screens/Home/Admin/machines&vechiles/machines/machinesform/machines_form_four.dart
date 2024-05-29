import 'dart:async';
import 'dart:convert';
import 'package:cmssms/src/Model/api/api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../Model/Const/color.dart';
import '../../../../../../../Model/Const/height_width.dart';
import '../../../../../../../Model/api/local.dart';
import '../../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../m_v_text.dart';
import '../machinesdataview/machines_data_view.dart';
import '../machinesviewdetails/machines_view_details_four.dart';

class MachinesFormPageFour extends StatefulWidget {
  const MachinesFormPageFour({super.key, required this.data});
  final Map data;

  @override
  State<MachinesFormPageFour> createState() => _MachinesFormPageFourState();
}

class _MachinesFormPageFourState extends State<MachinesFormPageFour> {
  // late Future<void> _futureNavigate;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final oldData = widget.data;
    final formKey = GlobalKey<FormState>();
    MachinesTextEditingController machinesTextEditingController =
        MachinesTextEditingController();
    Future<void> navigateToPage(BuildContext context) async {
      var apiURL = Uri.parse(ApiEndpoints.createMachine);

      var values = {
        ...oldData,
        "co_machine_insurance_exp_date":
            machinesTextEditingController.innsuranceExpiryDateController.text,
        "co_machine_next_fitness_certificate_date":
            machinesTextEditingController.nextFCDateController.text,
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
            builder: (context) => const MachinesDataView(),
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
                      const SizedBox(height: 8),
                      const StackText(
                        stacktext: mvpage4,
                        color: red,
                      ),
                      formSizebox15,
                      MachinesViewDetailsFour(
                          enabled: true,
                          isEditing: true,
                          insuranceExpiryDateController:
                              machinesTextEditingController
                                  .innsuranceExpiryDateController,
                          nextFCDateController: machinesTextEditingController
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
        onPress: () {
          navigateToPage(context);
          //  setState(() {
          //   _futureNavigate =
          // });
        },
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import '../../../../../../../Model/Const/text_const.dart';
import '../../../../../../../Model/api/api_model.dart';
import '../../../../../../../Model/api/local.dart';
import '../../../../../../../controler/GetDate/get_date.dart';
import '../../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../m_v_text.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/machines/machinesviewdetails/machines_view_details_four.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/machines/machinesviewdetails/machines_view_details_one.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/machines/machinesviewdetails/machines_view_details_three.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/machines/machinesviewdetails/machines_view_details_two.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../../Model/Const/color.dart';

class MachinesFormDeleteView extends StatefulWidget {
  const MachinesFormDeleteView({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<MachinesFormDeleteView> createState() => _MachinesFormDeleteViewState();
}

class _MachinesFormDeleteViewState extends State<MachinesFormDeleteView> {
  Map<String, dynamic>? data;
  var updatedData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getMachine}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            // var clint = ClientData.fromJson(jsonDecode(response.body));
            var controllers = {};
            controllers.forEach((key, controller) {
              controller.text = data![key]?.toString() ?? '';
            });
          }
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const DetailsText(enterDetails: deleteMachinesDetailsText),
              MachineViewDetailsOne(
                  NameController: mnameController,
                  secondNameController: msecondNameController,
                  addressline1Controller: addressline1Controller,
                  addressline2Controller: addressline2Controller,
                  cityController: cityController,
                  pincodeController: pincodeController,
                  stateController: stateController,
                  enabled: false),
              MachinesViewDetailsTwo(
                  enabled: false,
                  CompanyController: mcompanyController,
                  ModelController: mmodelController,
                  yearofMakeController: myearofMakeController),
              MachinesViewDetailsThree(
                  machineImagesFilePathController:
                      mmachineImagesFilePathController,
                  registrationCertificateFilePathController:
                      mregistrationCertificateFilePathController,
                  insuranceFilePathController: minsuranceFilePathController,
                  fitnessCertificateFilePathController:
                      mfitnessCertificateFilePathController,
                  enabled: false),
              MachinesViewDetailsFour(
                  enabled: false,
                  isEditing: false,
                  insuranceExpiryDateController: minsuranceExpiryDateController,
                  nextFCDateController: mnextFCDateController),
              CreateByCreatedOn(
                createByController: createBy,
                createOnController: createOn,
                enabled: false,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: const BottomSheetLogo(),
    );
  }
}

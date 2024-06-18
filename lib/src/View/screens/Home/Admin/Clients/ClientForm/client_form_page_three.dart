// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../controler/ClientController/db_client_controller.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../ClientViewDetails/client_view_details_three.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import 'client_form_page_four.dart';
import '../../../../../../Model/utility/client/client_text_const.dart';

class ClientFormPageThree extends StatelessWidget {
  const ClientFormPageThree({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    final oldData = data;
    final formKey = GlobalKey<FormState>();
    
    final DBClientController dbClientController = DBClientController();

    void navigateToPageFour(BuildContext context) {
      var updatedData = {
        ...oldData,
        dbClientController.dbGSTNumber:
              gstNumberController.text.isEmpty ? null : gstNumberController.text,
        dbClientController.dbResidentialAddressLine1:
            secondaryAddressline1Controller.text.isEmpty
                ? null
                : secondaryAddressline1Controller.text.trim(),
        dbClientController.dbResidentialAddressLine2:
            secondaryAddressline1Controller.text.isEmpty
                ? null
                : secondaryAddressline2Controller.text.trim(),
        dbClientController.dbResidentialTown:
            secondaryCityController.text.isEmpty ? null : secondaryCityController.text.trim(),
        dbClientController.dbResidentialPincode:
            secondaryPincodeController.text.isEmpty ? null : secondaryPincodeController.text,
        dbClientController.dbResidentialState:
            secondaryStateController.text.isEmpty ? null : secondaryStateController.text.trim(),
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClientFormPageFour(data: updatedData),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    formSizebox8,
                    const StackText(
                      stacktext: clientpage3,
                      color: red,
                    ),
                    formSizebox15,
                    ClientViewDetailsThree(
                      gstNumberController:gstNumberController ,
                      addressline1Controller: secondaryAddressline1Controller,
                      addressline2Controller: secondaryAddressline2Controller,
                      cityController: secondaryCityController,
                      pincodeController: secondaryPincodeController,
                      stateController: secondaryStateController,
                      enabled: true,
                    ),
                    formSizebox15,
                    bottomHeight,
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
          formKey: formKey,
          isEnabled: true,
          onPress: () => navigateToPageFour(context)),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

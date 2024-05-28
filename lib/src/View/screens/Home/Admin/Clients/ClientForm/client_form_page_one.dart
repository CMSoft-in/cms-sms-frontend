// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../controler/ClientController/db_client_controller.dart';
import '../../../../../../controler/ClientController/edit_text.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../ClientViewDetails/client_view_details_one.dart';
import '../../../../../../Model/utility/client/client_text_const.dart';
import 'client_form_page_two.dart';


class ClientFormPageOne extends StatelessWidget {
  const ClientFormPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> data;

    final formKey = GlobalKey<FormState>();
 
    final DBClientController dbClientController = DBClientController();

    void navigateToPageTwo(BuildContext context) {
      var data = {
        dbClientController.dbClientName: primaryClientNameController.text.trim(),
        dbClientController.dbOfficeAddressLine1:primaryAddressline1Controller.text.trim(),
        dbClientController.dbOfficeAddressLine2: primaryAddressline2Controller.text.isEmpty
            ? null
            : primaryAddressline2Controller.text.trim(),
        dbClientController.dbOfficeTown: primaryCityControllerName.text.trim(),
        dbClientController.dbOfficeState: primaryStateControllerName.text.trim(),
       dbClientController.dbOfficePincode: primaryPincodeControllerName.text,
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClientFormPageTwo(data: data),
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
                    const DetailsText(enterDetails: clientdetails),
                    formSizebox15,
                    const StackText(
                      stacktext: clientpage1,
                      color: red,
                    ),
                    ClientViewDetailsOne(
                      clientNamee: primaryClientNameController,
                      addressline1Controller: primaryAddressline1Controller,
                      addressline2Controller: primaryAddressline2Controller,
                      cityController: primaryCityControllerName,
                      pincodeController: primaryPincodeControllerName,
                      stateController: primaryStateControllerName,
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
          isEnabled: false,
          onPress: () => navigateToPageTwo(context)),
      bottomNavigationBar: BottomSheetLogo(),
    );
  }
}

// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/utility/client/client_text_const.dart';
import '../../../../../../controler/ClientController/db_client_controller.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../ClientViewDetails/client_view_details_two.dart';
import 'client_form_page_three.dart';

class ClientFormPageTwo extends StatelessWidget {
  const ClientFormPageTwo({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    final oldData = data;
    final formKey = GlobalKey<FormState>();
    final DBClientController dbClientController = DBClientController();
    void navigateToPageThree(BuildContext context) {
      var updatedData = {
        ...oldData,
        dbClientController.dbOwnerFirstName: firstNameController.text.trim(),
        dbClientController.dbOwnerLastName: lastNameController.text.trim(),
        dbClientController.dbMobileNumber: phoneNumberController.text.trim(),
        dbClientController.dbEmail:
            EmailController.text.isEmpty ? null : EmailController.text.trim(),
        dbClientController.dbWhatsApp:
            whatsappController.text.isEmpty ? null : whatsappController.text
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClientFormPageThree(data: updatedData),
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
                      stacktext: clientpage2,
                      color: red,
                    ),
                    formSizebox15,
                    ClientViewDetailsTwo(
                      firstNamee: firstNameController,
                      lastNamee: lastNameController,
                      phoneNumberr: phoneNumberController,
                      emaill: EmailController,
                      whatsappp: whatsappController,
                      enabled: true,
                    ),
                    formSizebox15,
                    bottomHeight
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
          onPress: () => navigateToPageThree(context)),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

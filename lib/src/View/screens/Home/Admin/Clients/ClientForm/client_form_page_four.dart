// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../controler/ClientController/db_client_controller.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../ClientViewDetails/client_view_details_four.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import 'client_form_page_five.dart';
import '../../../../../../Model/utility/client/client_text_const.dart';

class ClientFormPageFour extends StatelessWidget {
  const ClientFormPageFour({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    var oldData = data;
    final formKey = GlobalKey<FormState>();
    final DBClientController dbClientController = DBClientController();

    void navigateToPageFive(BuildContext context) {
      var updatedData = {
        ...oldData,
        dbClientController.dbPrimaryContactName:
            primaryNameController.text.isEmpty ? null : primaryNameController.text.trim(),
        dbClientController.dbPrimaryContactNumber:
            primaryPhoneNumberController.text.isEmpty
                ? null
                : int.parse(primaryPhoneNumberController.text),
        dbClientController.dbPrimaryContactWhatsApp:
            primaryWhatsappController.text.isEmpty ? null : primaryWhatsappController.text,
        dbClientController.dbPrimaryContactEmail:
            primaryEmailController.text.isEmpty ? null : primaryEmailController.text.trim(),
        dbClientController.dbSecondaryContactName:
            secondaryNameController.text.isEmpty ? null : secondaryNameController.text.trim(),
        dbClientController.dbSecondaryContactNumber:
            secondaryPhoneNumberController.text.isEmpty
                ? null
                : secondaryPhoneNumberController.text,
        dbClientController.dbSecondaryContactWhatsApp:
            secondaryWhatsappController.text.isEmpty ? null : secondaryWhatsappController.text,
        dbClientController.dbSecondaryContactEmail:
            secondaryEmailController.text.isEmpty ? null : secondaryEmailController.text.trim(),
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClientFormPageFive(data: updatedData),
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
                      stacktext: clientpage4,
                      color: red,
                    ),
                    formSizebox15,
                    ClientViewDetailsFour(
                      primaryNameController: primaryNameController,
                      primaryPhoneNumberController: primaryPhoneNumberController,
                      primaryEmailController: primaryEmailController,
                      primaryWhatsappController: primaryWhatsappController,
                      secondaryNameController: secondaryNameController,
                      secondaryPhoneNumberController: secondaryPhoneNumberController,
                      secondaryEmailController: secondaryEmailController,
                      secondaryWhatsappController: secondaryWhatsappController,
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
          onPress: () => navigateToPageFive(context)),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

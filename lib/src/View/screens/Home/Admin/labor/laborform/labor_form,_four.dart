// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_four.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../labor_text_const.dart';
import 'labor_form_five.dart';

class LaborFormPageFour extends StatelessWidget {
  const LaborFormPageFour({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    var oldData = data;
    final formKey = GlobalKey<FormState>();
    LaborTextEditingController laborTextEditingController=LaborTextEditingController();

    void navigateToPageFive(BuildContext context) {
      var updatedData = {
        ...oldData,
       "emergency_contact_name":laborTextEditingController.primaryNameController.text.isEmpty ? null :laborTextEditingController.primaryNameController.text.trim(),
        "emergency_contact_no":laborTextEditingController. primaryPhoneNumberController.text.isEmpty ? null :int.parse(laborTextEditingController. primaryPhoneNumberController.text.trim()),
         "primary_contact_email":laborTextEditingController. primaryEmailController.text.isEmpty ? null :laborTextEditingController. primaryEmailController.text.trim(),
            "primary_contact_whatsapp": laborTextEditingController.primaryWhatsappController.text.isEmpty ? null :int.parse(laborTextEditingController.primaryWhatsappController.text..trim()),
            "secondary_contact_name": laborTextEditingController.secondaryNameController.text.isEmpty ? null :laborTextEditingController.secondaryNameController.text.trim(),
            "secondary_contact_no": laborTextEditingController.secondaryPhoneNumberController.text.isEmpty ? null :int.parse( laborTextEditingController.secondaryPhoneNumberController.text..trim()),
            "secondary_contact_email": laborTextEditingController.secondaryEmailController.text.isEmpty ? null :laborTextEditingController.secondaryEmailController.text.trim(),
            "secondary_contact_whatsapp": laborTextEditingController.secondaryWhatsappController.text.isEmpty ? null :int.parse(laborTextEditingController.secondaryWhatsappController.text..trim()),
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LaborFormPageFive(data: updatedData),
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
                      stacktext: laborpage4,
                      color: red,
                    ),
                    formSizebox15,
                    LaborViewDetailsFour(
                        primaryNameController:laborTextEditingController. primaryNameController,
                        primaryPhoneNumberController:
                           laborTextEditingController. primaryPhoneNumberController,
                        primaryEmailController:laborTextEditingController. primaryEmailController,
                        primaryWhatsappController:laborTextEditingController. primaryWhatsappController,
                        secondaryNameController: laborTextEditingController.secondaryNameController,
                        secondaryPhoneNumberController:
                          laborTextEditingController.  secondaryPhoneNumberController,
                        secondaryEmailController: laborTextEditingController.secondaryEmailController,
                        secondaryWhatsappController:
                            laborTextEditingController.secondaryWhatsappController,
                        enabled: true),
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

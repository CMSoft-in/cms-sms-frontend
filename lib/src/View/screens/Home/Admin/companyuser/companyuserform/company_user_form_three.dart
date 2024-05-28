// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import '/src/View/screens/Home/Admin/companyuser/companyuserviewdetails/company_user_view_three.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../companyuser_text.dart';
import 'company_user_form_four.dart';

class ComapnyUserFormPageThree extends StatelessWidget {
  const ComapnyUserFormPageThree({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    final oldData = data;
    final formKey = GlobalKey<FormState>();
    CompanyUserTextEditingController companyUserTextEditingController=CompanyUserTextEditingController(); 
    

    void navigateToPageFour(BuildContext context) {
      var updatedData = {
        ...oldData,
      "primary_contact_name": companyUserTextEditingController.primaryNameController.text,
    "primary_contact_no":companyUserTextEditingController.primaryPhoneNumberController.text,
    "email":companyUserTextEditingController. primaryEmailController.text,
    "password":companyUserTextEditingController. primaryEmailController.text,
    "primary_contact_whatsapp":companyUserTextEditingController.primaryWhatsappController.text,
     "secondary_contact_name":companyUserTextEditingController.secondaryNameController.text,
    "secondary_contact_no":companyUserTextEditingController.secondaryPhoneNumberController.text,
    "secondary_contact_email":companyUserTextEditingController.secondaryEmailController.text,
    "secondary_contact_whatsapp":companyUserTextEditingController.secondaryWhatsappController.text,
     
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CompanyUserFormPageFour(data: updatedData),
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
                    formSizebox10,
                    const StackText(
                      stacktext: companyUserpage3,
                      color: red,
                    ),
                    formSizebox15,
                    CompanyUserViewDetailsThree(primaryNameController: companyUserTextEditingController.primaryNameController, 
                    primaryPhoneNumberController:companyUserTextEditingController. primaryPhoneNumberController, 
                    primaryEmailController:companyUserTextEditingController. primaryEmailController,
                     primaryWhatsappController:companyUserTextEditingController. primaryWhatsappController,
                      secondaryNameController: companyUserTextEditingController.secondaryNameController,
                       secondaryPhoneNumberController: companyUserTextEditingController.secondaryPhoneNumberController,
                        secondaryEmailController: companyUserTextEditingController.secondaryEmailController,
                         secondaryWhatsappController: companyUserTextEditingController.secondaryWhatsappController, enabled: true)
                    ,formSizebox15,
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

// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import '../companyuser_text.dart';
import '/src/View/screens/Home/Admin/companyuser/companyuserviewdetails/company_user_view_four.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';

import '../../../../../../Model/utility/client/client_text_const.dart';
import 'company_user_form_five.dart';

class CompanyUserFormPageFour extends StatelessWidget {
  const CompanyUserFormPageFour({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    var oldData = data;
    final formKey = GlobalKey<FormState>();
    CompanyUserTextEditingController companyUserTextEditingController=CompanyUserTextEditingController(); 

    void navigateToPageFive(BuildContext context) {
      var updatedData = {
        ...oldData,
    "Aadhar": companyUserTextEditingController.aadharNumberController.text.isEmpty ? null :int.parse(companyUserTextEditingController.aadharNumberController.text.trim()),
    "Pan": companyUserTextEditingController.panNumberController.text.isEmpty ? null :companyUserTextEditingController.panNumberController.text.trim(),

      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CompanyUserFormPageFive(data: updatedData),
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
                  
                           CompanyUserViewDetailsFour(enabled: true, aadharNumberController: companyUserTextEditingController.aadharNumberController,
                            aadharfilePathController: companyUserTextEditingController.aadharfilePathController,
                             panNumberController: companyUserTextEditingController.panNumberController,
                              panfilePathController:companyUserTextEditingController. panfilePathController)            ,formSizebox15,
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

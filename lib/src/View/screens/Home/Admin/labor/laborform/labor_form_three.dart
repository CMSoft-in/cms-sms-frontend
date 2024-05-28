// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_three.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../labor_text_const.dart';
import 'labor_form,_four.dart';

class LaborFormPageThree extends StatelessWidget {
  const LaborFormPageThree({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    final oldData = data;
    final formKey = GlobalKey<FormState>();
        LaborTextEditingController laborTextEditingController=LaborTextEditingController();
   
    void navigateToPageFour(BuildContext context) {
       print(oldData);
      var updatedData = {
        ...oldData,
       
        "aadhar_image":laborTextEditingController.aadharfilePathController.text,
        "aadhar_no": laborTextEditingController.aadharNumberController.text,
          "co_sites_worked":[laborTextEditingController.siteWorkedController.text] ,
        "co_current_sites_allocation": laborTextEditingController.cuurentSiteAllocationController.text,
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LaborFormPageFour(data: updatedData),
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
                      stacktext: laborpage3,
                      color: red,
                    ),
                    formSizebox15,
                    LaborViewDetailsThree(
                        aadharfilePathController: laborTextEditingController.aadharfilePathController,
                        aadharController: laborTextEditingController.aadharNumberController,
                        siteWorkedController: laborTextEditingController.siteWorkedController,
                        cuurentSiteAllocationController:
                           laborTextEditingController. cuurentSiteAllocationController,
                            isEditing: true,
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
          onPress: () => navigateToPageFour(context)),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers
import '/src/View/screens/Home/Admin/companyuser/companyuser_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../companyuserviewdetails/company_user_view_two.dart';
import 'company_user_form_three.dart';

class ComapnyUserFormPageTwo extends StatelessWidget {
  const ComapnyUserFormPageTwo({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    final oldData = data;
    final formKey = GlobalKey<FormState>();
    CompanyUserTextEditingController companyUserTextEditingController=CompanyUserTextEditingController(); 
    void navigateToPageThree(BuildContext context) {
      var updatedData = {
        ...oldData,
      "bloodgroup":companyUserTextEditingController. bloodGroupController.text,
    "dateofjoining":companyUserTextEditingController.joinDateController.text,
     "designation_id": companyUserTextEditingController.officeDesignationController.text,
     "co_app_role_id": 
      companyUserTextEditingController. applicationRoleController.text,
   
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ComapnyUserFormPageThree(data: updatedData),
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
                      stacktext: companyUserpage2,
                      color: red,
                    ),
                    formSizebox15,
                    CompanyUserViewDetailsTwo(bloodGroupController:companyUserTextEditingController. bloodGroupController,
                     joinDateController: companyUserTextEditingController.joinDateController,
                      officeDesignationController:companyUserTextEditingController. officeDesignationController,
                       applicationRoleController:companyUserTextEditingController. applicationRoleController,
                        enabled: true, 
                       isEditing: true)
                    ,formSizebox15,
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

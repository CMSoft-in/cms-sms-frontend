import 'package:flutter/material.dart';
import '/src/View/screens/Home/Admin/companyuser/companyuser_text.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../companyuserviewdetails/company_user_view_two.dart';
import 'company_user_form_three.dart';
class ComapnyUserFormPageTwo extends StatefulWidget {
  const ComapnyUserFormPageTwo({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<ComapnyUserFormPageTwo> createState() => _ComapnyUserFormPageTwoState();
}
class _ComapnyUserFormPageTwoState extends State<ComapnyUserFormPageTwo> {
  List<Map<String, dynamic>> coLabourCategoryIds = [];
  List<int>? coLabourCategoryIdsOne;
  
  final formKey = GlobalKey<FormState>();
  final CompanyUserTextEditingController companyUserTextEditingController =
      CompanyUserTextEditingController();

  void changeValue(List<int>? v) {
    setState(() {
      coLabourCategoryIds = v?.map((id) => {"id": id})?.toList() ?? [];
      coLabourCategoryIdsOne = v;
    });
  }


  void navigateToPageThree(BuildContext context) {
    final oldData = widget.data;
    var updatedData = {
      ...oldData,
      "bloodgroup": companyUserTextEditingController.bloodGroupController.text
              .isEmpty
          ? null
          : companyUserTextEditingController.bloodGroupController.text.trim(),
      "dateofjoining": companyUserTextEditingController.joinDateController.text
              .isEmpty
          ? null
          : companyUserTextEditingController.joinDateController.text.trim(),
      "designation_id": [
        companyUserTextEditingController.officeDesignationController.text
                .isEmpty
            ? null
            : companyUserTextEditingController.officeDesignationController.text
                .trim()
      ],
      "co_app_role_id": coLabourCategoryIdsOne ?? null, // Ensure it's nullable
    };

    print(updatedData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ComapnyUserFormPageThree(data: updatedData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Column(
                    children: [
                      formSizebox10,
                      const StackText(
                        stacktext: companyUserpage2,
                        color: red,
                      ),
                      formSizebox15,
                     CompanyUserViewDetailsTwo(
                changeValue: changeValue,
                coLabourCategoryId: coLabourCategoryIdsOne,
                bloodGroupController:
                    companyUserTextEditingController.bloodGroupController,
                joinDateController:
                    companyUserTextEditingController.joinDateController,
                officeDesignationController:
                    companyUserTextEditingController.officeDesignationController,
                applicationRoleController:
                    companyUserTextEditingController.applicationRoleController,
                enabled: true,
                isEditing: true,
              ),
                      formSizebox15,
                      bottomHeight,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
        formKey: formKey,
        isEnabled: true,
        onPress: () => navigateToPageThree(context),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

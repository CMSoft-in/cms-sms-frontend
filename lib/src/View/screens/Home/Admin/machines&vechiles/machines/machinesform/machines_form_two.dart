// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';

import '../../../../../../../Model/Const/color.dart';
import '../../../../../../../Model/Const/height_width.dart';
import '../../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../m_v_text.dart';
import '../machinesviewdetails/machines_view_details_two.dart';
import 'machines_form_three.dart';




class MachinesFormPageTwo extends StatelessWidget {
  const MachinesFormPageTwo({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    final oldData = data;
    final formKey = GlobalKey<FormState>();
    MachinesTextEditingController machinesTextEditingController=MachinesTextEditingController();
    void navigateToPageThree(BuildContext context) {
      var updatedData = {
        ...oldData,
      "co_machine_company_name":machinesTextEditingController. companyController.text.isEmpty ? null :machinesTextEditingController. companyController.text.trim(),
    "co_machine_model": machinesTextEditingController.modelController.text.isEmpty ? null :machinesTextEditingController.modelController.text.trim(),
    "co_machine_yearofmake":machinesTextEditingController. yearofMakeController.text.isEmpty ? null :machinesTextEditingController. yearofMakeController.text.trim(),
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MachinesFormPageThree(data: updatedData),
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
                      stacktext: mvpage2,
                      color: red,
                    ),
                    formSizebox15,
                   MachinesViewDetailsTwo(enabled: true, CompanyController:machinesTextEditingController. companyController,
                    ModelController: machinesTextEditingController.modelController,
                     yearofMakeController: machinesTextEditingController.yearofMakeController,)
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

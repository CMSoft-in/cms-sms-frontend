// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';

import '../../../../../../../Model/Const/color.dart';
import '../../../../../../../Model/Const/height_width.dart';
import '../../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../m_v_text.dart';
import '../vechilesviewdetails/vechiles_view_details_two.dart';
import 'vechiles_form_three.dart';

class VechilesFormPageTwo extends StatelessWidget {
  const VechilesFormPageTwo({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    final oldData = data;
    final formKey = GlobalKey<FormState>();
   VechilesTextEditingController vechilesTextEditingController=VechilesTextEditingController();
    void navigateToPageThree(BuildContext context) {
      var updatedData = {
        ...oldData,
       "co_vehicle_company_name":vechilesTextEditingController.companyController.text,
    "co_vehicle_model":vechilesTextEditingController. modelController.text,
    "co_vehicle_yearofmake":vechilesTextEditingController.yearofMakeController.text,
    "co_vehicle_engine_no":  vechilesTextEditingController.engineChassisNoController.text,
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VechilesFormPageThree(data: updatedData),
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
                   VechilesViewDetailsTwo(enabled: true, CompanyController:vechilesTextEditingController. companyController,
                    ModelController:vechilesTextEditingController. modelController,
                     yearofMakeController:vechilesTextEditingController. yearofMakeController,
                      engineChassisNoController:vechilesTextEditingController. engineChassisNoController)
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

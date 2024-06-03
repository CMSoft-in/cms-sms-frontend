// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers


import 'package:flutter/material.dart';

import '../../../../../../../Model/Const/color.dart';
import '../../../../../../../Model/Const/height_width.dart';
import '../../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../m_v_text.dart';
import '../vechilesviewdetails/vechiles_view_details_one.dart';
import 'vechiles_form_two.dart';



class VechilesFormPageOne extends StatelessWidget {
  const VechilesFormPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> data;

    final formKey = GlobalKey<FormState>();
    VechilesTextEditingController vechilesTextEditingController=VechilesTextEditingController();
    void navigateToPageTwo(BuildContext context) {
      var data = {
          "co_vehicle_reg_no": vechilesTextEditingController. nameController.text.isEmpty ? null :vechilesTextEditingController. nameController.text.trim(),
    "owner_first_name": vechilesTextEditingController. secondNameController.text.isEmpty ? null :vechilesTextEditingController. secondNameController.text.trim(),
     "off_address_line1":vechilesTextEditingController. addressline1Controller.text.isEmpty ? null :vechilesTextEditingController. addressline1Controller.text.trim(),
        "off_address_line2":vechilesTextEditingController. addressline2Controller.text.isEmpty ? null :vechilesTextEditingController. addressline2Controller.text.trim(),
        "city":vechilesTextEditingController. cityController.text.isEmpty ? null :vechilesTextEditingController. cityController.text.trim(),
        "state":vechilesTextEditingController. stateController.text.isEmpty ? null :vechilesTextEditingController. stateController.text.trim(),
        "pincode":vechilesTextEditingController. pincodeController.text.isEmpty ? null :int.parse(vechilesTextEditingController. pincodeController.text.trim()),
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VechilesFormPageTwo(data: data),
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
                    const DetailsText(enterDetails: vechilesDetails),
                    formSizebox15,
                    const StackText(
                      stacktext: mvpage1,
                      color: red,
                    ),
                    VechilesViewDetailsOne(NameController:vechilesTextEditingController. nameController,
                     secondNameController:vechilesTextEditingController. secondNameController,
                      addressline1Controller: vechilesTextEditingController.addressline1Controller,
                       addressline2Controller: vechilesTextEditingController.addressline2Controller,
                        cityController: vechilesTextEditingController.cityController,
                         pincodeController:vechilesTextEditingController. pincodeController,
                          stateController: vechilesTextEditingController.stateController,
                           enabled: true)
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
          isEnabled: false,
          onPress: () => navigateToPageTwo(context)),
      bottomNavigationBar: BottomSheetLogo(),
    );
  }
}

// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../../../../../../Model/Const/color.dart';
import '../../../../../../../Model/Const/height_width.dart';
import '../../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../m_v_text.dart';
import '../machinesviewdetails/machines_view_details_three.dart';
import 'machines_form_four.dart';



class MachinesFormPageThree extends StatelessWidget {
  const MachinesFormPageThree({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    final oldData = data;
    final formKey = GlobalKey<FormState>();
     MachinesTextEditingController machinesTextEditingController=MachinesTextEditingController();
    void navigateToPageFour(BuildContext context) {
      var updatedData = {
        ...oldData,
    
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MachinesFormPageFour(data: updatedData),
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
                      stacktext: mvpage3,
                      color: red,
                    ),
                    formSizebox15,
                   MachinesViewDetailsThree(machineImagesFilePathController: machinesTextEditingController.machineImagesFilePathController,
                    registrationCertificateFilePathController: machinesTextEditingController.registrationCertificateFilePathController,
                     insuranceFilePathController:machinesTextEditingController. insuranceFilePathController,
                      fitnessCertificateFilePathController: machinesTextEditingController.fitnessCertificateFilePathController, 
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

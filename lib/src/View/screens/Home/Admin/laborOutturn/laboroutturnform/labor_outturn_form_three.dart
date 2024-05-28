// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import '../labor_outturn_text.dart';
import '../laboroutturnviewdetails/labor_outturn_view_details_three.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import 'labor_outturn_form_four.dart';

class LaborOutturnFormPageThree extends StatelessWidget {
  const LaborOutturnFormPageThree({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    final oldData = data;
    final formKey = GlobalKey<FormState>();
    LaborOutturnTextEditing laborOutturnTextEditing =
        LaborOutturnTextEditing();

    void navigateToPageFour(BuildContext context) {
      var updatedData = {
        ...oldData,
       
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LaborOutturnFormPageFour(data: updatedData),
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
                      stacktext: laborOutturnpage3,
                      color: red,
                    ),
                    
                     formSizebox10,
                      const StackText(
                        stacktext: rateBased,
                        color: grey,
                      ),formSizebox15,
                    LaborOuttrnViewDetailsThree(
                        companyRateController: laborOutturnTextEditing.companyRateController,
                        outturnMeasurementController:
                            laborOutturnTextEditing.outturnMeasurementController,
                        thresholdLimitController: laborOutturnTextEditing.thresholdLimitController,
                        countController: laborOutturnTextEditing.countController,
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

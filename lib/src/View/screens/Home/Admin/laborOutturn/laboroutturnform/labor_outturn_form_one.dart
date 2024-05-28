// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:cmssms/src/View/screens/Home/Admin/laborOutturn/laboroutturnviewdetails/labor_outturn_view_details_one.dart';

import '../labor_outturn_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import 'labor_outturn_form_two.dart';

class LaborOutturnFormPageOne extends StatelessWidget {
  const LaborOutturnFormPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> data;

    final formKey = GlobalKey<FormState>();

    void navigateToPageTwo(BuildContext context) {
      var data = {};
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LaborOutturnFormPageTwo(data: data),
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
                    const DetailsText(enterDetails: laborOutturndetails),
                    formSizebox15,
                    const StackText(
                      stacktext: laborOutturnpage1,
                      color: red,
                    ),
                    LaborOutturnViewDetailsOne(
                        workCategorycontroller: LaborOutturnTextEditing().workCategoryController,
                        laborCategorycontroller: LaborOutturnTextEditing().laborCategorycontroller,
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
          isEnabled: false,
          onPress: () => navigateToPageTwo(context)),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

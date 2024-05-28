// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers
import '../labor_outturn_text.dart';
import '../laboroutturnviewdetails/labor-outturn_view_details_two.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import 'labor_outturn_form_three.dart';

class LaborOutturnFormPageTwo extends StatelessWidget {
  const LaborOutturnFormPageTwo({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    final oldData = data;
    final formKey = GlobalKey<FormState>();

    final LaborOutturnTextEditing laborOutturnTextEditing = LaborOutturnTextEditing();
    void navigateToPageThree(BuildContext context) {
      var updatedData = {
        ...oldData,
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LaborOutturnFormPageThree(data: updatedData),
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
                      stacktext: laborOutturnpage2,
                      color: red,
                    ),
                    formSizebox10,
                     const StackText(
                      stacktext: outturnBased,
                      color: grey,
                    ),
                    formSizebox15,
                    LaborOuttrnViewDetailsTWo(
                        teamMemberController:laborOutturnTextEditing. teamMemberController,
                        outturnMeasurementController:
                           laborOutturnTextEditing. outturnMeasurementController,
                        dailyOuttrnController:laborOutturnTextEditing. dailyOuttrnController,
                        countController: laborOutturnTextEditing.countController,
                        enabled: true),
                    formSizebox15,
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

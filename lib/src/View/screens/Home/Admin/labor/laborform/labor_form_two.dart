import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../labor_text_const.dart';
import '../laborviewdetails/labor_view_details_two.dart';

import 'labor_form_three.dart';

class LaborFormPageTwo extends StatefulWidget {
  const LaborFormPageTwo({required this.data,
    Key? key,
  }) : super(key: key);
final data
;  @override
  State<LaborFormPageTwo> createState() => _LaborFormPageTwoState();
}

class _LaborFormPageTwoState extends State<LaborFormPageTwo> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LaborTextEditingController laborTextEditingController =
      LaborTextEditingController();
  int? coLabourCategoryId;

  void changeValue(int v) {
    setState(() {
      coLabourCategoryId = v;
    });
  }

  void navigateToPageThree(BuildContext context) {

    var updatedData = {
      "bloodgroup": laborTextEditingController.bloodGroupController.text,
      "co_labour_category_id": [coLabourCategoryId],
      "co_labour_rate_model":
          laborTextEditingController.rateModelController.text,
      "co_labour_rate": laborTextEditingController.laborRateController.text,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LaborFormPageThree(data: updatedData),
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
                      formSizebox8,
                      const StackText(
                        stacktext: laborpage2,
                        color: red,
                      ),
                      formSizebox15,
                      LaborViewDetailsTwo(
                        changeValue: changeValue,
                        coLabourCategoryId: coLabourCategoryId,
                        bloodGroupController:
                            laborTextEditingController.bloodGroupController,
                        laborCategoryController:
                            laborTextEditingController.laborCategoryController,
                        rateModelController:
                            laborTextEditingController.rateModelController,
                        laborRateController:
                            laborTextEditingController.laborRateController,
                        isEditing: true,
                        enabled: true,
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
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   navigateToPageThree();
      // }),
      bottomSheet: BackNextButton(
        formKey: formKey,
        isEnabled: true,
        onPress: ()=>navigateToPageThree(context),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}
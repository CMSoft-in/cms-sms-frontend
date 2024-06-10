import 'package:flutter/material.dart';
import 'package:cmssms/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_three.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../labor_text_const.dart';
import 'labor_form_four.dart';
class LaborFormPageThree extends StatefulWidget {
  const LaborFormPageThree({required this.data, Key? key}) : super(key: key);
  final data;

  @override
  State<LaborFormPageThree> createState() => _LaborFormPageThreeState();
}

class _LaborFormPageThreeState extends State<LaborFormPageThree> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LaborTextEditingController laborTextEditingController = LaborTextEditingController();
  List<int> coSiteWorkedIds = [];
 int? coCurrentSiteAllocationIds ;

    void changeValue(List<String> v) {
    setState(() {
      coSiteWorkedIds = v.map((id) => int.parse(id)).toList();
    });
  }
  

  // void changeValueOne(List<String> v) {
  //   setState(() {
  //     coCurrentSiteAllocationIds = v.map((id) => int.parse(id)).toList();
  //   });
  // }
 void changeValueOne(int? v) {
    setState(() {
      coCurrentSiteAllocationIds = v;
    });
  }
  void navigateToPageFour(BuildContext context) {
    var oldData = widget.data;
    var updatedData = {
      ...oldData,
      "aadhar_no": laborTextEditingController.aadharNumberController.text.isEmpty
          ? null
          : int.parse(laborTextEditingController.aadharNumberController.text.trim()),
             "co_current_sites_allocation": coCurrentSiteAllocationIds,
          "co_sites_worked": coSiteWorkedIds,
       
    };
    print(updatedData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LaborFormPageFour(data: updatedData),
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
                        stacktext: laborpage3,
                        color: red,
                      ),
                      formSizebox15,
                      LaborViewDetailsThree(
                        currentSiteAllocationController: laborTextEditingController.currentSiteAllocationController,
                        siteWorkedController: laborTextEditingController.siteWorkedController,
                        coCurrentSiteAllocationIds: coCurrentSiteAllocationIds,
                        changeValueOne: changeValueOne,
                        changeValue: changeValue,
                        coLabourCategoryId: coSiteWorkedIds.isNotEmpty ? coSiteWorkedIds.first : null,
                        aadharController: laborTextEditingController.aadharNumberController,
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
      bottomSheet: BackNextButton(
        formKey: formKey,
        isEnabled: true,
        onPress: () => navigateToPageFour(context),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

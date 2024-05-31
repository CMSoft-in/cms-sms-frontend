// import 'package:cmssms/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_three.dart';
// import 'package:flutter/material.dart';
// import '../../../../../../Model/Const/color.dart';
// import '../../../../../../Model/Const/height_width.dart';
// import '../../../../../widgets/AppBar/AppBar.dart';
// import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
// import '../../../../../widgets/Buttons/next_back_button.dart';
// import '../../../../../widgets/CommonUsageForm/HintText.dart';
// import '../labor_text_const.dart';
// import '../laborviewdetails/labor_view_details_two.dart';

// import 'labor_form,_four.dart';
// import 'labor_form_three.dart';

// class LaborFormPageThree extends StatefulWidget {
//   const LaborFormPageThree({required this.data,
//     Key? key,
//   }) : super(key: key);
// final data
// ;  @override
//   State<LaborFormPageThree> createState() => _LaborFormPageThreeState();
// }

// class _LaborFormPageThreeState extends State<LaborFormPageThree> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final LaborTextEditingController laborTextEditingController =
//       LaborTextEditingController();
//   int? coLabourCategoryId;
//    int? coLabourCategoryIdOne;

//   void changeValue(int v) {
//     setState(() {
//       coLabourCategoryId = v;
//     });
//   }
//  void changeValueOne(int v) {
//     setState(() {
//       coLabourCategoryIdOne = v;
//     });
//   }
// void navigateToPageThree(BuildContext context) {
//   var oldData = widget.data;
//   var coSitesWorked = coLabourCategoryId != null ? [coLabourCategoryId!] : [];
//   var coCurrentSitesAllocation = coLabourCategoryIdOne != null ? [coLabourCategoryIdOne!] : [];
//   var updatedData = {
//     ...oldData,
//     "aadhar_no": laborTextEditingController.aadharNumberController.text,
//     "co_sites_worked": coSitesWorked,
//     "co_current_sites_allocation": coCurrentSitesAllocation,
//   };
//   print(updatedData);
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => LaborFormPageFour(data: updatedData),
//     ),
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white,
//       appBar: const BuildAppBar(),
//       body: SingleChildScrollView(
//         child: Container(
//           color: white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Center(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     children: [
//                       formSizebox8,
//                       const StackText(
//                         stacktext: laborpage2,
//                         color: red,
//                       ),
//                       formSizebox15,
//                       LaborViewDetailsTHree(
                      
//                         coLabourCategoryIdOne: coLabourCategoryIdOne,
// changeValueOne: changeValueOne,
//                         changeValue: changeValue,
//                         coLabourCategoryId: coLabourCategoryId,
//                        aadharController: laborTextEditingController.aadharNumberController,
//                         siteWorkedController: laborTextEditingController.siteWorkedController,
//                         cuurentSiteAllocationController:
//                            laborTextEditingController. cuurentSiteAllocationController,
//                         isEditing: true,
//                         enabled: true,
//                       ),
//                       formSizebox15,
//                       bottomHeight,
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(onPressed: () {
//       //   navigateToPageThree();
//       // }),
//       bottomSheet: BackNextButton(
//         formKey: formKey,
//         isEnabled: true,
//         onPress: ()=>navigateToPageThree(context),
//       ),
//       bottomNavigationBar: const BottomSheetLogo(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cmssms/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_three.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../labor_text_const.dart';
import 'labor_form,_four.dart';

class LaborFormPageThree extends StatefulWidget {
  const LaborFormPageThree({required this.data, Key? key}) : super(key: key);
  final  data;

  @override
  State<LaborFormPageThree> createState() => _LaborFormPageThreeState();
}

class _LaborFormPageThreeState extends State<LaborFormPageThree> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LaborTextEditingController laborTextEditingController = LaborTextEditingController();
  List<dynamic> coLabourCategoryIds = [];
 int? coLabourCategoryIdsOne;

  void changeValue(List<dynamic> v) {
    setState(() {
      coLabourCategoryIds = v;
    });
  }

  void changeValueOne(int v) {
    setState(() {
      coLabourCategoryIdsOne = v;
    });
  }

  void navigateToPageFour(BuildContext context) {
    var oldData = widget.data;
    var updatedData = {
      ...oldData,
      "aadhar_no": laborTextEditingController.aadharNumberController.text.isEmpty ? null :int.parse(laborTextEditingController.aadharNumberController.text.trim()),
      "co_sites_worked": coLabourCategoryIds.isEmpty ? null :coLabourCategoryIds,
      "co_current_sites_allocation":[coLabourCategoryIdsOne].isEmpty ? null : [coLabourCategoryIdsOne],
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
                        stacktext: laborpage2,
                        color: red,
                      ),
                      formSizebox15,
                      LaborViewDetailsTHree(
                        coLabourCategoryIdOne: coLabourCategoryIdsOne,
                        changeValueOne: changeValueOne,
                        changeValue: changeValue,
                        coLabourCategoryId: coLabourCategoryIds.isNotEmpty ? coLabourCategoryIds.first : null,
                        aadharController: laborTextEditingController.aadharNumberController,
                        siteWorkedController: laborTextEditingController.siteWorkedController,
                        cuurentSiteAllocationController: laborTextEditingController.cuurentSiteAllocationController,
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







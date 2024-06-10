// // // ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

// // ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

// import 'dart:async';
// import '../laborviewdetails/labor_view_details_six.dart';
// import 'package:flutter/material.dart';
// import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
// import '../../../../../widgets/Buttons/next_back_button.dart';
// import '../../../../../widgets/AppBar/AppBar.dart';
// import '../../../../../widgets/CommonUsageForm/HintText.dart';
// import '../../../../../../Model/Const/color.dart';
// import '../../../../../../Model/Const/height_width.dart';
// import '../labor_text_const.dart';

// class LaborFormPageSix extends StatefulWidget {
//   const LaborFormPageSix({super.key, required this.data});
//   final Map data;

//   @override
//   State<LaborFormPageSix> createState() => _LaborFormPageSixState();
// }

// class _LaborFormPageSixState extends State<LaborFormPageSix> {

//   @override
//   Widget build(BuildContext context) {
//     final oldData = widget.data;
//     final formKey = GlobalKey<FormState>();
//     final List<TextEditingController> _labelController = [
//     TextEditingController()
//   ];
//      LaborTextEditingController laborTextEditingController=LaborTextEditingController();
//     Future navigateToPageSix(context) async {
//       var updatedData = {
//         ...oldData,
//         "CoLabourTeam":[
//           {
//             "co_labour_team_name":laborTextEditingController. teamMemberController.text,
//             "co_labour_team_rate":laborTextEditingController. rateController.text
//         },
//         ]
//       };
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LaborFormPageSix(data: updatedData),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const BuildAppBar(),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Center(
//                 child: Form(
//                   key: formKey,
//                   child: Center(
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 8),
//                         const StackText(
//                           stacktext: laborpage5,
//                           color: red,
//                         ),
//                         const SizedBox(height: 15),
//                         LaborViewDetailsSix(
//                             teamMemberController:laborTextEditingController. teamMemberController,
//                             rateController: laborTextEditingController.rateController,
//                             enabled: true),
//                         formSizebox15,
//                         bottomHeight,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomSheet: BackNextButton(
//         formKey: formKey,
//         isEnabled: true,
//         onPress: () => navigateToPageSix(context),
//       ),
//       bottomNavigationBar: const BottomSheetLogo(),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../labor_text_const.dart';
import '/src/Model/api/local.dart';
import '/src/View/screens/Home/Admin/Clients/ClientDataView/client_data_view_main.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';

class LaborFormPageSix extends StatefulWidget {
  const LaborFormPageSix({super.key, required this.data});
  final Map data;

  @override
  State<LaborFormPageSix> createState() => _LaborFormPageSixState();
}

class _LaborFormPageSixState extends State<LaborFormPageSix> {
  final List<TextEditingController> _labourController = [
    TextEditingController()
  ];
  final List<TextEditingController> _rateController = [TextEditingController()];

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    Future<void> navigateToPage(BuildContext context) async {
      print(token);
      var apiURL = Uri.parse('$ip/Admin/create-labour');

      List<Map<String, String>> teamData = [];
      for (int i = 0; i < _labourController.length; i++) {
        teamData.add({
          "co_labour_team_name": _labourController[i].text,
          "co_labour_team_rate": _rateController[i].text,
        });
      }

      var body = json.encode(teamData);
      var response = await http.post(
        apiURL,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: body,
      );
      if (response.statusCode == 201) {
        print('Response body: ${response.body}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ClientDataView(),
          ),
        );
      } else {
        print(response.body);
        print('Failed to load data: ${response.statusCode}');
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Form(
              key: formKey,
              child: const Center(
                child: Column(
                  children: [
                    formSizebox10,
                    StackText(
                      stacktext: laborpage5,
                      color: red,
                    ),
                    formSizebox15,
                    Center(
                      child: Column(
                        children: [],
                      ),
                    ),
                    formSizebox15,
                    bottomHeight,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: BackNextButton(
        formKey: formKey,
        isEnabled: true,
        onPress: () => navigateToPage(context),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

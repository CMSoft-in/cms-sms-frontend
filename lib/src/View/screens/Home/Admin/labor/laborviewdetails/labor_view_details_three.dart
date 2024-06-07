import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';
import '../../../../../widgets/MyDrawer/s.dart';
import '/src/View/screens/Home/Admin/laborcategory/labor_category_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../labor_text_const.dart';

// class LaborViewDetailsTHree extends StatefulWidget {
//   LaborViewDetailsTHree(
//       {Key? key,
//       required this.changeValue,
//       required this.coLabourCategoryId,
//        required this.aadharController,
//       required this.siteWorkedController,
//       required this.changeValueOne,
//       required this.cuurentSiteAllocationController,
//       required this.isEditing,
//       required this.coLabourCategoryIdOne,
//       required this.enabled})
//       : super(key: key);

//   int? coLabourCategoryId;
//   int? coLabourCategoryIdOne;
//   final Function changeValue;
//   final Function changeValueOne;
//   final TextEditingController aadharController;
//   final TextEditingController siteWorkedController;
//   final TextEditingController cuurentSiteAllocationController;
//   final bool isEditing;
//   final bool enabled;

//   @override
//   State<LaborViewDetailsTHree> createState() => _LaborViewDetailsTHreeState();
// }

// class _LaborViewDetailsTHreeState extends State<LaborViewDetailsTHree> {
//   List labordropdownItems = [];
//    List labordropdownItems1 = [];
//   int? selectedLaborCategoryIdOne;
//   int? selectedLaborCategoryId;
  
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//   String  uri=ApiEndpoints.getAllLabourCategories;
//     try {
//       final response = await http.get(
//         Uri.parse(uri),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       );
//       if (response.statusCode == 200) {
//         var body = json.decode(response.body)["data"];
//         var newList = [];
//         var newListOne = [];
//         body.forEach((each) {
//           int id = each["co_labour_category_id"];
//           String name = each["co_labour_category_name"];
//           newList.add({"id": id, "name": name});
//         });
//           body.forEach((each) {
//           int id = each["co_labour_category_id"];
//           String name = each["co_labour_category_name"];
//           newListOne.add({"id": id, "name": name});
//         });
//         setState(() {
//           labordropdownItems = newList;
//              labordropdownItems1 = newListOne;
//         });
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }


//   void onDropdownChanged(newId) {
//     setState(() {
//        widget.changeValue(newId);
//       selectedLaborCategoryId = newId;
//       widget.coLabourCategoryId = selectedLaborCategoryId;
//     });
//   }

//  void onDropdownChangedOne(newId) {
//     setState(() {
//        widget.changeValueOne(newId);
//       selectedLaborCategoryIdOne = newId;
//       widget.coLabourCategoryIdOne = selectedLaborCategoryIdOne;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         formSizebox10,
//         TextformField(
//           controller: widget.aadharController,
//           text: aadharNumber,
//           limitLength: 12,
//           optionalisEmpty: true,
//           inputformat: number,
//           star: star,
//           inputtype: keyboardTypeNumber,
//           enabled: widget.enabled),
//         formSizebox10,
//         widget.isEditing
//             ? DropDownFormm(
//                 selectedId: selectedLaborCategoryId,
//                 onChanged: onDropdownChanged,
//                 dropdownItems: labordropdownItems,
//                 dropDownName: siteWorked,
//                 star: star,
//                 optionalisEmpty: true,
//                 controller: widget.siteWorkedController,
//               )
//             : TextformField(
//                 controller: widget.siteWorkedController,
//                 text: siteWorked,
//                 limitLength: 40,
//                 star: star,
//                 inputformat: alphabats,
//                 optionalisEmpty: true,
//                 inputtype: keyboardTypeNone,
//                 enabled: widget.enabled,
//               ),
//         formSizebox10,
//         widget.isEditing
//             ? DropDownFormm(
//                 selectedId: selectedLaborCategoryIdOne,
//                 onChanged: onDropdownChangedOne,
//                 dropdownItems: labordropdownItems1,
//                 dropDownName: cuurentSiteAllocation,
//                 star: star,
//                 optionalisEmpty: true,
//                 controller: widget.cuurentSiteAllocationController,
//               )
//             : TextformField(
//                 controller: widget.cuurentSiteAllocationController,
//                 text: cuurentSiteAllocation,
//                 limitLength: 40,
//                 star: star,
//                 inputformat: alphabats,
//                 optionalisEmpty: true,
//                 inputtype: keyboardTypeNone,
//                 enabled: widget.enabled,
//               ),
//         formSizebox10,
     
//       ],
//     );
//   }
// }





// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import '../../../../../../Model/api/api_model.dart';
// // import '../../../../../../Model/api/local.dart';
// // import '../../../../../widgets/MyDrawer/s.dart';
// // import '/src/View/widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';

// // import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
// // import '../../../../../../Model/Const/height_width.dart';
// // import '../../../../../../Model/Const/text_const.dart';
// // import '../labor_text_const.dart';

// // class LaborViewDetailsThree extends StatefulWidget {
// //    LaborViewDetailsThree(
// //       {Key? key,
// //       required this.changeValue,
// //       required this.coLabourCategoryId,
     
// //       required this.aadharController,
// //       required this.siteWorkedController,
// //       required this.cuurentSiteAllocationController,
// //       required this.enabled,
// //       required this.isEditing})
// //       : super(key: key);
// // int? coLabourCategoryId;
// //   final Function changeValue;
// //   final TextEditingController aadharController;
// //   final TextEditingController siteWorkedController;
// //   final TextEditingController cuurentSiteAllocationController;
// //   final bool isEditing;
// //   final bool enabled;

// //   @override
// //   State<LaborViewDetailsThree> createState() => _LaborViewDetailsThreeState();
// // }

// // class _LaborViewDetailsThreeState extends State<LaborViewDetailsThree> {
// //    List labordropdownItems = [];

// //   int? selectedLaborCategoryId;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchData();
// //   }

// //   Future<void> fetchData() async {
// //   String  uri=ApiEndpoints.getAllLabourCategories;
// //     try {
// //       final response = await http.get(
// //         Uri.parse(uri),
// //         headers: {
// //           'Authorization': 'Bearer $token',
// //         },
// //       );
// //       if (response.statusCode == 200) {
// //         var body = json.decode(response.body)["data"];
// //         print(body);
// //         var newList = [];
// //         body.forEach((each) {
// //           int id = each["co_labour_category_id"];
// //           String name = each["co_labour_category_name"];
// //           newList.add({"id": id, "name": name});
// //         });
// //         setState(() {
// //           labordropdownItems = newList;
// //         });
// //       }
// //     } catch (error) {
// //       print('Error fetching data: $error');
// //     }
// //   }

// //   void onDropdownChanged(newId) {
// //     setState(() {
// //        widget.changeValue(newId);
// //       selectedLaborCategoryId = newId;
// //       widget.coLabourCategoryId = selectedLaborCategoryId;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(children: [
// //       formSizebox10,
   
// //       formSizebox10,
// //       TextformField(
// //           controller: widget.aadharController,
// //           text: aadharNumber,
// //           limitLength: 12,
// //           optionalisEmpty: true,
// //           inputformat: number,
// //           star: star,
// //           inputtype: keyboardTypeNumber,
// //           enabled: widget.enabled),
// //       formSizebox10,
// //        widget.isEditing
// //             ? DropDownFormm(
// //                 selectedId: selectedLaborCategoryId,
// //                 onChanged: onDropdownChanged,
// //                 dropdownItems: labordropdownItems,
// //                 dropDownName: siteWorked,
// //                 star: star,
// //                 optionalisEmpty: true,
// //                 controller: widget.siteWorkedController,
// //               )
// //       :TextformField(
// //           controller: widget.siteWorkedController,
// //           text: siteWorked,
// //           limitLength: 30,
// //           optionalisEmpty: true,
// //           inputformat: alphabatsAndNumbers,
// //           star: star,
// //           inputtype: keyboardTypeNone,
// //           enabled: widget.enabled),
// //           formSizebox10,
// //           widget.isEditing?
// //       DropDownForm(
// //           dropdownItems: ['chennai', 'Theni','2'],
// //           dropDownName: cuurentSiteAllocation,
// //           star: estar,
// //           optionalisEmpty: false,
// //           controller: widget.cuurentSiteAllocationController):
// //           TextformField(
// //           controller: widget.cuurentSiteAllocationController,
// //           text: cuurentSiteAllocation,
// //           limitLength: 30,
// //           optionalisEmpty: false,
// //           inputformat: alphabatsSpace,
// //           star: estar,
// //           inputtype: keyboardTypeNone,
// //           enabled: widget.enabled),
// //     ]);
// //   }
// // }
class LaborViewDetailsTHree extends StatefulWidget {
  LaborViewDetailsTHree({
    Key? key,
    required this.changeValue,
    required this.coLabourCategoryId,
    required this.aadharController,
    required this.siteWorkedController,
    required this.changeValueOne,
    required this.cuurentSiteAllocationController,
    required this.isEditing,
    required this.coLabourCategoryIdOne,
    required this.enabled,
  }) : super(key: key);

  int? coLabourCategoryId;
  int? coLabourCategoryIdOne;
  final Function(List<dynamic>) changeValue;
  final Function changeValueOne;
  final TextEditingController aadharController;
  final TextEditingController siteWorkedController;
  final TextEditingController cuurentSiteAllocationController;
  final bool isEditing;
  final bool enabled;

  @override
  State<LaborViewDetailsTHree> createState() => _LaborViewDetailsTHreeState();
}

class _LaborViewDetailsTHreeState extends State<LaborViewDetailsTHree> {
  List labordropdownItems = [];
  List labordropdownItems1 = [];
  List<int> selectedLaborCategoryIds = [];
  int? selectedLaborCategoryIdsOne;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String uri = ApiEndpoints.getAllSites;
    try {
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
        print(response.body);
        var body = json.decode(response.body);
      
      if (response.statusCode == 200) {
      
        var newList = [];
        var newListOne = [];
        body.forEach((each) {
          int id = each["co_site_id"];
          String name = each["co_site_name"];
          newList.add({"id": id, "name": name});
        });
        body.forEach((each) {
          int id = each["co_site_id"];
          String name = each["co_site_name"];
          newListOne.add({"id": id, "name": name});
        });
        setState(() {
          labordropdownItems = newList;
          labordropdownItems1 = newListOne;
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void onMultiSelectChanged(List<dynamic> newIds) {
    setState(() {
      widget.changeValue(newIds);
      selectedLaborCategoryIds = newIds.cast<int>();
      widget.coLabourCategoryId = selectedLaborCategoryIds.isNotEmpty ? selectedLaborCategoryIds.first : null;
    });
  }
void onDropdownChangedOne(newId) {
    setState(() {
       widget.changeValueOne(newId);
      selectedLaborCategoryIdsOne = newId;
      widget.coLabourCategoryIdOne = selectedLaborCategoryIdsOne;
    });
  }
  // void onMultiSelectChangedOne(List<dynamic> newIds) {
  //   setState(() {
  //     widget.changeValueOne(newIds);
  //     selectedLaborCategoryIdsOne = newIds.cast<int>();
  //     widget.coLabourCategoryIdOne = selectedLaborCategoryIdsOne.isNotEmpty ? selectedLaborCategoryIdsOne.first : null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox10,
        TextformField(
          controller: widget.aadharController,
          text: aadharNumber,
          limitLength: 12,
          optionalisEmpty: true,
          inputformat: number,
          star: star,
          inputtype: keyboardTypeNumber,
          enabled: widget.enabled,
        ),
        formSizebox10,
       
        widget.isEditing
            ? DropDownFormm(
                selectedId: selectedLaborCategoryIdsOne,
                onChanged: onDropdownChangedOne,
                dropdownItems: labordropdownItems1,
                dropDownName: cuurentSiteAllocation,
                star: star,
                optionalisEmpty: true,
                controller: widget.cuurentSiteAllocationController,
              )
            : TextformField(
                controller: widget.cuurentSiteAllocationController,
                text: cuurentSiteAllocation,
                limitLength: 40,
                star: star,
                inputformat: alphabats,
                optionalisEmpty: true,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
        formSizebox10,
      widget.isEditing
            ? MultiSelectTwoDropDownForm(
                selectedIds: selectedLaborCategoryIds,
                onChanged: onMultiSelectChanged,
                dropdownItems: labordropdownItems,
                dropDownName: siteWorked,
                star: star,
                optionalisEmpty: true,
                controller: widget.siteWorkedController,
              )
            : MaxMinTextFormField(
              maxLines: 4,
              minLines: 1,
                controller: widget.siteWorkedController,
                text: siteWorked,
                limitLength: 40,
                star: star,
                inputformat: alphabats,
                optionalisEmpty: true,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
         formSizebox10,
      ],
    );
  }
}


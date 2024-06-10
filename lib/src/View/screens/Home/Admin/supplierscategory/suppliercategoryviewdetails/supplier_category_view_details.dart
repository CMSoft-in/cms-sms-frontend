// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../../../../../../Model/Const/text_const.dart';
// import '../../../../../../Model/api/api_model.dart';
// import '../../../../../../Model/api/local.dart';
// import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
// import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';
// import '../../../../../widgets/MyDrawer/s.dart';
// import '../supplier_category_text.dart';


// class SupplierCategoryViewDetails extends StatefulWidget {
//   SupplierCategoryViewDetails({
//     Key? key,
//     required this.enabled,
//     required this.isEditing,
//     required this.changeValue,
//     required this.comaterialCategoryId,
//     required this.supplierCategoryController,
//     required this.materialSuppliedController,
//   }) : super(key: key);

//   int? comaterialCategoryId;
//   final Function(List<String>) changeValue;
//   final bool enabled;
//   final bool isEditing;
//   final TextEditingController supplierCategoryController;
//   final TextEditingController materialSuppliedController;

//   @override
//   State<SupplierCategoryViewDetails> createState() =>
//       _SupplierCategoryViewDetailsState();
// }

// class _SupplierCategoryViewDetailsState
//     extends State<SupplierCategoryViewDetails> {
//   List<Map<String, dynamic>> materialdropdownItems1 = [];
//   List<String> selectedMaterialCategoryIds = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     String uri = ApiEndpoints.getAllMaterials;
//     try {
//       final response = await http.get(
//         Uri.parse(uri),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       );

//       if (response.statusCode == 200) {
//         var body = json.decode(response.body) as List;
//         var newList = body.map((each) {
//           return {
//             "id": each["co_material_id"].toString(),
//             "name": each["co_material_name"],
//           };
//         }).toList();

//         setState(() {
//           materialdropdownItems1 = newList;
//         });
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }

//   void onMultiSelectChanged(List<String> newIds) {
//     setState(() {
//       widget.changeValue(newIds);
//       selectedMaterialCategoryIds = newIds;
//       widget.comaterialCategoryId = newIds.isNotEmpty
//           ? int.tryParse(materialdropdownItems1
//               .firstWhere((item) => item['id'] == newIds.first)['id'])
//           : null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           SizedBox(height: 10),
//           TextformField(
//             controller: widget.supplierCategoryController,
//             text: supplierCategoryText,
//             star: star,
//             limitLength: 50,
//             optionalisEmpty: true,
//             inputformat: alphabatsAndNumbers,
//             inputtype: keyboardTypeNone,
//             enabled: widget.enabled,
//           ),
//           SizedBox(height: 10),
//           widget.isEditing
//               ? MyHomePage(
//                   selectedIds: selectedMaterialCategoryIds,
//                   onChanged: onMultiSelectChanged,
//                   dropdownItems: materialdropdownItems1,
//                   dropDownName: materialSupplied,
//                   star: star,
//                   optionalisEmpty: true,
//                   controller: widget.materialSuppliedController,
//                 )
//               : MaxMinTextFormField(
//                   maxLines: 4,
//                   minLines: 1,
//                   controller: widget.materialSuppliedController,
//                   text: materialSupplied,
//                   star: star,
//                   limitLength: 20,
//                   optionalisEmpty: true,
//                   inputformat: alphabatsAndNumbers,
//                   inputtype: keyboardTypeNone,
//                   enabled: widget.enabled,
//                 )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';
import '../../../../../widgets/MyDrawer/s.dart';
import '../supplier_category_text.dart';

class SupplierCategoryViewDetails extends StatefulWidget {
  SupplierCategoryViewDetails({
    Key? key,
    required this.enabled,
    required this.isEditing,
    required this.changeValue,
    required this.comaterialCategoryId,
    required this.supplierCategoryController,
    required this.materialSuppliedController,
  }) : super(key: key);

  final Function(List<String>) changeValue;
  final bool enabled;
  final bool isEditing;
  final TextEditingController supplierCategoryController;
  final TextEditingController materialSuppliedController;
  final List<int> comaterialCategoryId;

  @override
  State<SupplierCategoryViewDetails> createState() =>
      _SupplierCategoryViewDetailsState();
}

class _SupplierCategoryViewDetailsState
    extends State<SupplierCategoryViewDetails> {
  List<Map<String, dynamic>> materialdropdownItems1 = [];
  List<String> selectedMaterialCategoryIds = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String uri = ApiEndpoints.getAllMaterials;
    try {
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var body = json.decode(response.body) as List;
        var newList = body.map((each) {
          return {
            "id": each["co_material_id"].toString(),
            "name": each["co_material_name"],
          };
        }).toList();

        setState(() {
          materialdropdownItems1 = newList;
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void onMultiSelectChanged(newIds) {
    setState(() {
      selectedMaterialCategoryIds = newIds;
      widget.changeValue(newIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          TextformField(
            controller: widget.supplierCategoryController,
            text: supplierCategoryText,
            star: star,
            limitLength: 50,
            optionalisEmpty: true,
            inputformat: alphabatsAndNumbers,
            inputtype: keyboardTypeNone,
            enabled: widget.enabled,
          ),
          SizedBox(height: 10),
          widget.isEditing
              ? MyHomePage(
                  selectedIds: selectedMaterialCategoryIds,
                  onChanged: onMultiSelectChanged,
                  dropdownItems: materialdropdownItems1,
                  dropDownName: materialSupplied,
                  star: star,
                  optionalisEmpty: true,
                  controller: widget.materialSuppliedController,
                )
              : MaxMinTextFormField(
                  maxLines: 4,
                  minLines: 1,
                  controller: widget.materialSuppliedController,
                  text: materialSupplied,
                  star: star,
                  limitLength: 20,
                  optionalisEmpty: true,
                  inputformat: alphabatsAndNumbers,
                  inputtype: keyboardTypeNone,
                  enabled: widget.enabled,
                )
        ],
      ),
    );
  }
}

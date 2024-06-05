import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';
import '../../../../../widgets/MyDrawer/s.dart';
import '../supplier_category_text.dart';
import '/src/View/widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';
import '../../../../../../Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class SupplierCategoryViewDetails extends StatefulWidget {
   SupplierCategoryViewDetails({
    super.key,
    required this.enabled,
    required this.isEditing,
    required this.changeValue,
    required this.comaterialCategoryId,
    required this.supplierCategoryController,
    required this.materialSuppliedController,
  });
   int? comaterialCategoryId;
  final Function(List<dynamic>) changeValue;
  final bool enabled;
  final bool isEditing;
  final TextEditingController supplierCategoryController;
  final TextEditingController materialSuppliedController;

  @override
  State<SupplierCategoryViewDetails> createState() => _SupplierCategoryViewDetailsState();
}

class _SupplierCategoryViewDetailsState extends State<SupplierCategoryViewDetails> {
  
  List materialdropdownItems1 = [];
  List<int> selectedMaterialCategoryIds = [];
  
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
        // print(response.body);
        var body = json.decode(response.body);
      
      if (response.statusCode == 200) {
      
        var newList = [];
        // var newListOne = [];
        body.forEach((each) {
          int id = each["co_material_id"];
          String name = each["co_material_name"];
          newList.add({"id": id, "name": name});
        });
        // body.forEach((each) {
        //   int id = each["co_site_id"];
        //   String name = each["co_site_name"];
        //   newListOne.add({"id": id, "name": name});
        // });
        setState(() {
          materialdropdownItems1 = newList;
          // labordropdownItems1 = newListOne;
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void onMultiSelectChanged(List<dynamic> newIds) {
    setState(() {
      widget.changeValue(newIds);
      selectedMaterialCategoryIds = newIds.cast<int>();
      widget.comaterialCategoryId = selectedMaterialCategoryIds.isNotEmpty ? selectedMaterialCategoryIds.first : null;
    });
  }
// void onDropdownChangedOne(newId) {
//     setState(() {
//        widget.changeValueOne(newId);
//       selectedLaborCategoryIdsOne = newId;
//       widget.coLabourCategoryIdOne = selectedLaborCategoryIdsOne;
//     });
//   }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          formSizebox10,
          // widget.isEditing
              // ?  DropDownForm(
              //     dropdownItems: const [
              //         "Supplier CateGory 1",
              //         "Supplier CateGory 2",
              //         "Supplier CateGory 3",
              //         "Supplier CateGory 4"
              //       ],
              //     dropDownName: supplierCategoryText,
              //     star: star,
              //     optionalisEmpty: true,
              //     controller: widget.supplierCategoryController)
             // : 
              TextformField(
                  controller: widget.supplierCategoryController,
                  text: supplierCategoryText,
                  star: star,
                  limitLength: 20,
                  optionalisEmpty: true,
                  inputformat: alphabatsAndNumbers,
                  inputtype: keyboardTypeNone,
                  enabled: widget.enabled,
                ),
          formSizebox10,
          widget.isEditing
              ? MultiSelectDropDownForm(
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

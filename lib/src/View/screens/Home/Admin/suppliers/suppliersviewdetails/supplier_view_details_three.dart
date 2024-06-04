import 'package:flutter/material.dart';

import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';
import '../../../../../widgets/MyDrawer/s.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class SupplierViewDetailsThree extends StatefulWidget {
   SupplierViewDetailsThree({super.key,
  required this.enabled,
  required this.changeValue,
    required this.coSupplierCategoryId,
  
   
    required this.changeMaterialValue,
    required this.comaterialCategoryId,
    
    required this.isEditing,  
  required this.materialsSuppliedController,
  required this.supplierCategoryController});
  final TextEditingController supplierCategoryController;
  final TextEditingController materialsSuppliedController;
  final bool enabled;
  int? comaterialCategoryId;
  final Function(List<dynamic>) changeMaterialValue;
    int? coSupplierCategoryId;
  final Function(List<dynamic>) changeValue;
  final bool isEditing;

  @override
  State<SupplierViewDetailsThree> createState() => _SupplierViewDetailsThreeState();
}

class _SupplierViewDetailsThreeState extends State<SupplierViewDetailsThree> {
   List supplierCategorydropdownItems = [];
  List<int> selectedSupplierCategoryIds = [];
 List materialdropdownItems1 = [];
  List<int> selectedMaterialCategoryIds = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchMaterialData();
  }
    Future<void> fetchMaterialData() async {
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
  void onMultiMaterialSelectChanged(List<dynamic> newIds) {
    setState(() {
      widget.changeMaterialValue(newIds);
      selectedMaterialCategoryIds = newIds.cast<int>();
      widget.comaterialCategoryId = selectedMaterialCategoryIds.isNotEmpty ? selectedMaterialCategoryIds.first : null;
    });
  }

  Future<void> fetchData() async {
    String uri = ApiEndpoints.getAllSupplierCategories;
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
        
        body.forEach((each) {
          int id = each["co_supplier_category_id"];
          String name = each["co_supplier_category_name"];
          newList.add({"id": id, "name": name});
        });
      
        setState(() {
          supplierCategorydropdownItems = newList;
         
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
   void onMultiSelectChanged(List<dynamic> newIds) {
    setState(() {
      widget.changeValue(newIds);
      selectedSupplierCategoryIds = newIds.cast<int>();
      widget.coSupplierCategoryId = selectedSupplierCategoryIds.isNotEmpty ? selectedSupplierCategoryIds.first : null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox10,
        widget.isEditing ?MultiSelectDropDownForm(
                selectedIds: selectedSupplierCategoryIds,
                onChanged: onMultiSelectChanged,
                dropdownItems: supplierCategorydropdownItems,
                dropDownName: supplierCategoryText,
                star: star,
                optionalisEmpty: true,
                controller: widget.supplierCategoryController,
              )
        :TextformField(
            controller: widget.supplierCategoryController,
            text: supplierCategoryText,
            limitLength: 30,
            optionalisEmpty: true,
            inputformat: alphabatsAndNumbers,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: widget.enabled),
        formSizebox10,
         widget.isEditing
              ? MultiSelectDropDownForm(
                selectedIds: selectedMaterialCategoryIds,
                onChanged: onMultiMaterialSelectChanged,
                dropdownItems: materialdropdownItems1,
                dropDownName: supplierMaterialsSupplied,
                star: star,
                optionalisEmpty: true,
                controller: widget.materialsSuppliedController,
              )
              : MaxMinTextFormField(
                maxLines: 4,
                minLines: 1,
            controller: widget.materialsSuppliedController,
            text: supplierMaterialsSupplied,
            limitLength: 30,
            optionalisEmpty: true,
            inputformat: alphabatsAndNumbers,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: widget.enabled)
      ],
    );
  }
}

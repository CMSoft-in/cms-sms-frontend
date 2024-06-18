import 'package:cmssms/src/View/screens/Home/Admin/supplierscategory/supplier_category_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/dropdown/multi_select_drop_down_two.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/dropdown/single_select_drop_down.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/empty_text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/empty_text_form_field_material_supplied.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';

// ignore: must_be_immutable
class SupplierViewDetailsThree extends StatefulWidget {
  final TextEditingController supplierCategoryController;
  final TextEditingController materialsSuppliedController;
  final bool enabled;
  final bool twoOrNot;
  int? comaterialCategoryId;
  final Function(List<dynamic>) changeMaterialValue;
  int? coSupplierCategoryId;
  final Function changeValue;
  final bool isEditing;
  final bool isMultiSelectDropDownEditing;
  final Function? changeMateralSupplied;
  List? materialSupplied;
  Function? changeAddedDeletedItems;

  SupplierViewDetailsThree(
      {Key? key,
      this.changeAddedDeletedItems,
      this.changeMateralSupplied,
      required this.enabled,
      required this.changeValue,
      required this.coSupplierCategoryId,
      required this.isMultiSelectDropDownEditing,
      required this.changeMaterialValue,
      required this.comaterialCategoryId,
      required this.twoOrNot,
      required this.isEditing,
      required this.materialsSuppliedController,
      required this.supplierCategoryController,
      this.materialSupplied})
      : super(key: key);

  @override
  _SupplierViewDetailsThreeState createState() =>
      _SupplierViewDetailsThreeState();
}

class _SupplierViewDetailsThreeState extends State<SupplierViewDetailsThree> {
  List<Map<String, dynamic>> supplierCategoryDropdownItems = [];
  int? selectedSupplierCategoryId;
  List<Map<String, dynamic>> materialDropdownItems1 = [];
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

      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        List<Map<String, dynamic>> newList = [];
        for (var each in body) {
          int id = each["co_material_id"];
          String name = each["co_material_name"];
          newList.add({"id": id, "name": name});
        }

        setState(() {
          materialDropdownItems1 = newList;
        });
      }
    } catch (error) {
      print('Error fetching material data: $error');
    }
  }

  void onMultiMaterialSelectChanged(List<dynamic> newIds) {
    setState(() {
      widget.changeMaterialValue(newIds);
      selectedMaterialCategoryIds = newIds.cast<int>();
      widget.comaterialCategoryId = selectedMaterialCategoryIds.isNotEmpty
          ? selectedMaterialCategoryIds.first
          : null;
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

      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        List<Map<String, dynamic>> newList = [];
        for (var each in body) {
          if (each["co_supplier_category_id"] != null) {
            int id = each["co_supplier_category_id"];
            String name = each["co_supplier_category_name"];
            newList.add({"id": id, "name": name});
          }
        }

        setState(() {
          supplierCategoryDropdownItems = newList;
        });
      }
    } catch (error) {
      print('Error fetching supplier category data: $error');
    }
  }

  void onDropdownChanged(String? newId) {
    if (newId != null) {
      try {
        int parsedId = int.tryParse(newId) ?? 0;
        setState(() {
          widget.changeValue(parsedId);
          selectedSupplierCategoryId = parsedId;
          widget.coSupplierCategoryId = parsedId;
        });
      } catch (e) {
        print('Error parsing ID: $newId. Exception: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox10,
        widget.isEditing
            ? SingleSelectDropDown(
                selectedId: selectedSupplierCategoryId,
                onChanged: onDropdownChanged,
                dropdownItems: supplierCategoryDropdownItems,
                dropDownName: supplierCategoryText,
                star: star,
                optionalisEmpty: false,
                controller: widget.supplierCategoryController,
              )
            : MaxMinTextFormField(
                maxLines: 7,
                minLines: 1,
                controller: widget.supplierCategoryController,
                text: supplierCategoryText,
                limitLength: 30,
                optionalisEmpty: false,
                inputformat: alphabatsAndNumbers,
                star: star,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
        formSizebox10,
        widget.isEditing
            ? EmptyTextformFieldMaterialSupplied(
              changeAddedDeletedItems:widget.changeAddedDeletedItems,
                materialSupplied: widget.materialSupplied,
                changeMateralSupplied: widget.changeMateralSupplied,
                enabled: true,
                optionalisEmpty: false,
                controller: widget.materialsSuppliedController,
                text: materialSupplied,
              )
            : TextformField(
                controller: widget.materialsSuppliedController,
                text: materialSupplied,
                limitLength: 30,
                optionalisEmpty: true,
                inputformat: alphabatsAndNumbers,
                star: estar,
                inputtype: keyboardTypeNone,
                enabled: false)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/dropdown/multi_select_drop_down_two.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';
import '../../../../../widgets/MyDrawer/s.dart';

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

  SupplierViewDetailsThree({
    super.key,
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
  });

  @override
  State<SupplierViewDetailsThree> createState() =>
      _SupplierViewDetailsThreeState();
}

class _SupplierViewDetailsThreeState extends State<SupplierViewDetailsThree> {
  List supplierCategoryDropdownItems = [];
  int? selectedSupplierCategoryId;
  List materialDropdownItems1 = [];
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

      var body = json.decode(response.body);
      if (response.statusCode == 200) {
        var newList = [];
        body.forEach((each) {
          int id = each["co_material_id"];
          String name = each["co_material_name"];
          newList.add({"id": id, "name": name});
        });

        setState(() {
          materialDropdownItems1 = newList;
        });
      }
    } catch (error) {
      print('Error  Material fetching data: $error');
    }
  }

  void onMultiMaterialSelectChanged(List<dynamic> newIds) {
    setState(() {
      widget.changeMaterialValue(newIds);
      selectedMaterialCategoryIds = newIds.cast<int>();
      widget.comaterialCategoryId =
          selectedMaterialCategoryIds.isNotEmpty ? selectedMaterialCategoryIds.first : null;
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

      var body = json.decode(response.body);
      if (response.statusCode == 200) {
        var newList = [];
        body.forEach((each) {
          int id = each["co_supplier_category_id"];
          String name = each["co_supplier_category_name"];
          newList.add({"id": id, "name": name});
        });

        setState(() {
          supplierCategoryDropdownItems = newList;
        });
      }
    } catch (error) {
      print('Error Supplier Category fetching data: $error');
    }
  }

  void onDropdownChanged(newId) {
    setState(() {
      widget.changeValue(newId);
      selectedSupplierCategoryId = newId;
      widget.coSupplierCategoryId = selectedSupplierCategoryId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox10,
        widget.isEditing
            ? DropDownFormm(
                selectedId: selectedSupplierCategoryId,
                onChanged: onDropdownChanged,
                dropdownItems: supplierCategoryDropdownItems,
                dropDownName: supplierCategoryText,
                star: star,
                optionalisEmpty: true,
                controller: widget.supplierCategoryController,
              )
            : MaxMinTextFormField(
                maxLines: 7,
                minLines: 1,
                controller: widget.supplierCategoryController,
                text: supplierCategoryText,
                limitLength: 30,
                optionalisEmpty: true,
                inputformat: alphabatsAndNumbers,
                star: star,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
        formSizebox10,
        widget.isMultiSelectDropDownEditing
            ? MultiSelectDropDownForm(
                selectedIds: selectedMaterialCategoryIds,
                onChanged: onMultiMaterialSelectChanged,
                dropdownItems: materialDropdownItems1,
                dropDownName: supplierMaterialsSupplied,
                star: star,
                optionalisEmpty: true,
                controller: widget.materialsSuppliedController,
              )
            : widget.twoOrNot
                ? MultiSelectTwoDropDownForm(
                    selectedIds: selectedMaterialCategoryIds,
                    onChanged: onMultiMaterialSelectChanged,
                    dropdownItems: materialDropdownItems1,
                    dropDownName: supplierMaterialsSupplied,
                    star: star,
                    optionalisEmpty: true,
                    controller: widget.materialsSuppliedController,
                  )
                : MaxMinTextFormField(
                    maxLines: 10,
                    minLines: 1,
                    controller: widget.materialsSuppliedController,
                    text: supplierMaterialsSupplied,
                    limitLength: 30,
                    optionalisEmpty: true,
                    inputformat: alphabatsAndNumbers,
                    star: star,
                    inputtype: keyboardTypeNone,
                    enabled: widget.enabled,
                  ),
      ],
    );
  }
}

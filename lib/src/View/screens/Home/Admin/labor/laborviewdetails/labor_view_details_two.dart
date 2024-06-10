import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/dropdown/sigle_select_drop_down.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../laborcategory/labor_category_text.dart';
import '../labor_text_const.dart';

class LaborViewDetailsTwo extends StatefulWidget {
  const LaborViewDetailsTwo({
    Key? key,
    required this.changeValue,
    required this.coLabourCategoryId,
    required this.bloodGroupController,
    required this.laborCategoryController,
    required this.rateModelController,
    required this.laborRateController,
    required this.isEditing,
    required this.enabled,
  }) : super(key: key);

  final int? coLabourCategoryId;
  final Function(int?) changeValue;
  final TextEditingController bloodGroupController;
  final TextEditingController laborCategoryController;
  final TextEditingController rateModelController;
  final TextEditingController laborRateController;
  final bool isEditing;
  final bool enabled;

  @override
  State<LaborViewDetailsTwo> createState() => _LaborViewDetailsTwoState();
}

class _LaborViewDetailsTwoState extends State<LaborViewDetailsTwo> {
  List<Map<String, dynamic>> labordropdownItems = [];
  int? selectedLaborCategoryId;

  @override
  void initState() {
    super.initState();
    selectedLaborCategoryId = widget.coLabourCategoryId;
    fetchData();
  }

  Future<void> fetchData() async {
     String uri = ApiEndpoints.getAllLabourCategories;
    try {
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> body = json.decode(response.body)["data"];
        setState(() {
          labordropdownItems = body
              .map((each) => {
                    "id": each["co_labour_category_id"],
                    "name": each["co_labour_category_name"]
                  })
              .toList();
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void onDropdownChanged(String selectedId) {
    int? newId = int.tryParse(selectedId);
    setState(() {
      selectedLaborCategoryId = newId;
      widget.changeValue(newId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox10,
        TextformField(
          controller: widget.bloodGroupController,
          text: bloodGroup,
          star: estar,
          limitLength: 3,
          optionalisEmpty: false,
          inputformat: bloodGroupp,
          inputtype: keyboardTypeNone,
          enabled: widget.enabled,
        ),
        formSizebox10,
        widget.isEditing
            ? SingleSelectDropDown(
                selectedId: selectedLaborCategoryId,
                onChanged: onDropdownChanged,
                dropdownItems: labordropdownItems,
                dropDownName: laborCategoryText,
                star: star,
                optionalisEmpty: true,
                controller: widget.laborCategoryController,
              )
            : TextformField(
                controller: widget.laborCategoryController,
                text: laborCategoryText,
                limitLength: 40,
                star: star,
                inputformat: alphabats,
                optionalisEmpty: true,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
        formSizebox10,
        widget.isEditing
            ? DropDownForm(
                dropdownItems: const ['Rate150', 'Rate 200'],
                dropDownName: rateModel,
                star: star,
                optionalisEmpty: true,
                controller: widget.rateModelController,
              )
            : TextformField(
                controller: widget.rateModelController,
                text: rateModel,
                limitLength: 20,
                star: star,
                inputformat: alphabats,
                optionalisEmpty: true,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
        formSizebox10,
        TextformField(
          controller: widget.laborRateController,
          text: laborRate,
          star: estar,
          limitLength: 40,
          optionalisEmpty: false,
          inputformat: alphabatsAndNumbers,
          inputtype: keyboardTypeNone,
          enabled: widget.enabled,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/datepicker/date_picker_text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/dropdown/drop_down_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/dropdown/multidrop_down.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/MyDrawer/s.dart';
import '../companyuser_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable

class CompanyUserViewDetailsTwo extends StatefulWidget {
  CompanyUserViewDetailsTwo({
    Key? key,
    required this.bloodGroupController,
    required this.joinDateController,
    required this.officeDesignationController,
    required this.applicationRoleController,
    required this.enabled,
    required this.changeValue,
    required this.coLabourCategoryId,
    required this.isEditing,
  }) : super(key: key);

  final TextEditingController bloodGroupController;
  final TextEditingController joinDateController;
  final TextEditingController officeDesignationController;
  final TextEditingController applicationRoleController;
  final bool enabled;
  final bool isEditing;
  List<int>? coLabourCategoryId; // Update to List<int>? or null
  final Function(List<int>?) changeValue; // Change to accept List<int> or null

  @override
  State<CompanyUserViewDetailsTwo> createState() => _CompanyUserViewDetailsTwoState();
}

class _CompanyUserViewDetailsTwoState extends State<CompanyUserViewDetailsTwo> {
  List<int> selectedLaborCategoryIds = [];
  List<Map<String, dynamic>> labordropdownItems = [];

  @override
  void initState() {
    super.initState();
    populateDropdownItems();
  }

  void populateDropdownItems() {
    var originalList = ["Admin", "Site Engineer", "Site Manager", "Owner"];
    List<Map<String, dynamic>> newList = [];

    for (var i = 0; i < originalList.length; i++) {
      var id = i + 1; // Assuming IDs start from 1 and increment
      var name = originalList[i];
      newList.add({"id": id, "name": name});
    }

    setState(() {
      labordropdownItems = newList;
    });
  }

  void onMultiSelectChanged(List<dynamic> newIds) {
    setState(() {
      List<int> ids = newIds.map<int>((item) => item['id'] as int).toList();
      widget.changeValue(ids.isNotEmpty ? ids : null); // Pass null if no items selected
      widget.coLabourCategoryId = ids.isNotEmpty ? ids : null;
      selectedLaborCategoryIds = ids;
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
          limitLength: 3,
          star: star,
          inputformat: bloodGroupp,
          optionalisEmpty: true,
          inputtype: keyboardTypeNone,
          enabled: widget.enabled,
        ),
        formSizebox10,
        widget.isEditing
            ? DateTextFormField(
                controller: widget.joinDateController,
                text: joinDate,
                optionalisEmpty: true,
                star: star,
                enabled: widget.enabled,
              )
            : TextformField(
                controller: widget.joinDateController,
                text: joinDate,
                star: star,
                limitLength: 8,
                optionalisEmpty: true,
                inputformat: alphabatsAndNumbers,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
        formSizebox10,
        widget.isEditing
            ? 
            DropDownForm(
                dropdownItems: ["Admin", "Manager", "Office Accountant"],
                dropDownName: officeDesignation,
                star: star,
                optionalisEmpty: true,
                controller: widget.officeDesignationController)
            : TextformField(
                controller: widget.officeDesignationController,
                text: officeDesignation,
                star: star,
                limitLength: 25,
                optionalisEmpty: true,
                inputformat: alphabatsAndNumbers,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
        formSizebox10,
        widget.isEditing
            ? MultiDropDownForm(
                selectedIds: selectedLaborCategoryIds,
                dropdownItems: labordropdownItems,
                dropDownName: applicationRole,
                onChanged: onMultiSelectChanged,
                star: star,
                optionalisEmpty: true,
                controller: widget.applicationRoleController,
              )
            : TextformField(
                controller: widget.applicationRoleController,
                text: applicationRole,
                star: star,
                limitLength: 25,
                optionalisEmpty: true,
                inputformat: alphabatsSpace,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
      ],
    );
  }
}

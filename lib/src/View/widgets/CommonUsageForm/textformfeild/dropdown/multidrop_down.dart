


import 'package:cmssms/src/Model/Const/height_width.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class MultiDropDownForm extends StatelessWidget {
  final List<int> selectedIds;
  final List<Map<String, dynamic>> dropdownItems;
  final String dropDownName;
  final Function(List<dynamic>) onChanged;
  final String star;
  final bool optionalisEmpty;
  final TextEditingController controller;

  const MultiDropDownForm({
    Key? key,
    required this.selectedIds,
    required this.dropdownItems,
    required this.dropDownName,
    required this.onChanged,
    required this.star,
    required this.optionalisEmpty,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: primaryWidth,
      child: DropdownSearch<Map<String, dynamic>>.multiSelection(
        items: dropdownItems,
        itemAsString: (item) => item['name'],
        selectedItems: dropdownItems.where((item) => selectedIds.contains(item['id'])).toList(),
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            label: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: dropDownName,
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  TextSpan(
                    text: star,
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ],
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
            border: OutlineInputBorder(),
            errorStyle: const TextStyle(color: Colors.red),
          ),
        ),
        onChanged: onChanged,
        compareFn: (item, selectedItem) => item['id'] == selectedItem['id'],
        validator: (value) {
          if (optionalisEmpty && (value == null || value.isEmpty)) {
            return "Please enter $dropDownName";
          }
          return null;
        },
        popupProps: PopupPropsMultiSelection.menu(
          showSelectedItems: true,
          showSearchBox: true,
        ),
      ),
    );
  }
}
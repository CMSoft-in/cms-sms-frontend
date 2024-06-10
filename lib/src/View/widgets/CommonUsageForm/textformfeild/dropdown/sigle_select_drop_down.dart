import 'package:cmssms/src/Model/Const/height_width.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class SingleSelectDropDown extends StatefulWidget {
  final List<Map<String, dynamic>> dropdownItems;
  final String dropDownName;
  final bool optionalisEmpty;
  final String star;
  final Function(String) onChanged;
  final int? selectedId;
  final TextEditingController controller;

  const SingleSelectDropDown({
    Key? key,
    required this.selectedId,
    required this.dropdownItems,
    required this.dropDownName,
    required this.onChanged,
    required this.star,
    required this.optionalisEmpty,
    required this.controller,
  }) : super(key: key);

  @override
  SingleSelectDropDownState createState() => SingleSelectDropDownState();
}

class SingleSelectDropDownState extends State<SingleSelectDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: primaryWidth, // Adjust as needed
      child: DropdownSearch<String>(
        items: widget.dropdownItems.map((item) => item['name'] as String).toList(),
        selectedItem: widget.selectedId != null
            ? widget.dropdownItems.firstWhere((item) => item['id'] == widget.selectedId)['name'] as String
            : null,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: widget.dropDownName,
            contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
            border: OutlineInputBorder(),
          ),
        ),
        onChanged: (value) {
          if (value != null) {
            String selectedId = widget.dropdownItems
                .firstWhere((item) => item['name'] == value)['id'].toString();
            widget.onChanged(selectedId);
            widget.controller.text = value;
          }
        },
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          itemBuilder: (context, item, isSelected) {
            return ListTile(
              title: Text(item),
              trailing: isSelected
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : Icon(Icons.check_circle_outline, color: Colors.grey),
            );
          },
          showSearchBox: true,
        ),
        clearButtonProps: ClearButtonProps(isVisible: true),
      ),
    );
  }
}

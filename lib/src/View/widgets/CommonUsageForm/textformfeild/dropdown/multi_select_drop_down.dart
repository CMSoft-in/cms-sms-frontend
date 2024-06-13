// import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';

// import '../../../../../Model/Const/height_width.dart';

// class MultiSelectDropDown extends StatefulWidget {
//   final List<Map<String, dynamic>> dropdownItems;
//   final String dropDownName;
//   final bool optionalisEmpty;
//   final String star;
//   final Function(List<String>) onChanged;
//   final List<String> selectedIds;
//   final TextEditingController controller;

//   const MultiSelectDropDown({
//     Key? key,
//     required this.selectedIds,
//     required this.dropdownItems,
//     required this.dropDownName,
//     required this.onChanged,
//     required this.star,
//     required this.optionalisEmpty,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   MultiSelectDropDownState createState() =>MultiSelectDropDownState();
// }

// class MultiSelectDropDownState extends State<MultiSelectDropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: primaryWidth,
//       child: Column(
//         children: [
//           DropdownSearch<String>.multiSelection(
//             items: widget.dropdownItems.map((item) => item['name'] as String).toList(),
//             selectedItems: widget.selectedIds.map((id) {
//               return widget.dropdownItems.firstWhere((item) => item['id'] == id)['name'] as String;
//             }).toList(),
//             dropdownDecoratorProps: DropDownDecoratorProps(
//               dropdownSearchDecoration: InputDecoration(
//                 labelText: widget.dropDownName,
//                 contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             onChanged: (values) {
//               List<String> selectedIds = values.map((name) {
//                 return widget.dropdownItems.firstWhere((item) => item['name'] == name)['id'].toString();
//               }).toList();
//               widget.onChanged(selectedIds);
//               widget.controller.text = values.join(', ');
//             },
//             popupProps: PopupPropsMultiSelection.menu(
//               showSelectedItems: true,
//               itemBuilder: (context, item, isSelected) {
//                 return ListTile(
//                   title: Text(item),
//                   trailing: isSelected
//                       ? Icon(Icons.check_circle, color: Colors.green)
//                       : Icon(Icons.check_circle_outline, color: Colors.grey),
//                 );
//               },
//               showSearchBox: true,
//             ),
//             clearButtonProps: ClearButtonProps(isVisible: true),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../../../../Model/Const/color.dart';
import '../../../../../Model/Const/height_width.dart';
import '../../../../../Model/Const/text_const.dart';

class MultiSelectDropDown extends StatefulWidget {
  final List<Map<String, dynamic>> dropdownItems;
  final String dropDownName;
  final bool optionalisEmpty;
  final String star;
  final Function(List<String>) onChanged;
  final List<String> selectedIds;
  final TextEditingController controller;

  const MultiSelectDropDown({
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
  MultiSelectDropDownState createState() =>MultiSelectDropDownState();
}

class MultiSelectDropDownState extends State<MultiSelectDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: primaryWidth,
      child: Column(
        children: [
          DropdownSearch<String>.multiSelection(
            items: widget.dropdownItems.map((item) => item['name'] as String).toList(),
            selectedItems: widget.selectedIds.map((id) {
              return widget.dropdownItems.firstWhere((item) => item['id'] == id)['name'] as String;
            }).toList(),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                label:RichText(
                  text: TextSpan(
                  children: [
                    TextSpan(
                     text: widget.dropDownName,
                      style: textStyleGrey18,
                    ),
                    TextSpan(
                     text: widget.star,
                      style: textStyleRedStar,
                    )
                  ],)
                ),
                contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                border: OutlineInputBorder(),  errorStyle: const TextStyle(color: Colors.red),
              ),
            ),
            onChanged: (values) {
              List<String> selectedIds = values.map((name) {
                return widget.dropdownItems.firstWhere((item) => item['name'] == name)['id'].toString();
              }).toList();
              widget.onChanged(selectedIds);
              widget.controller.text = values.join(', ');
            },
            validator:(value) => validMethod(value),
            popupProps: PopupPropsMultiSelection.menu(
              menuProps: MenuProps(
            backgroundColor:white,
          ),
              showSelectedItems: true,
              itemBuilder: (context, item, isSelected) {
                return ListTile(
                  title: Text(item,style: textStyleGrey18,),
                );
              },
              showSearchBox: true,
            ),
            clearButtonProps: ClearButtonProps(isVisible: true),
          ),
        ],
      ),
    );
  }
  String? validMethod(value) {
    if (widget.optionalisEmpty == true) {
      if (value == null || value.isEmpty) {
        return "Please enter ${widget.dropDownName}";
      }
      return null;
    }
    return null;
  }
}

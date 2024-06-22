
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../../../../Model/Const/color.dart';
import '../../../../../Model/Const/height_width.dart';
import '../../../../../Model/Const/text_const.dart';

class DropDownForm extends StatefulWidget {
  final List<String> dropdownItems;
  final String dropDownName;
  final bool optionalisEmpty;
  final String star;
  final TextEditingController controller;

  const DropDownForm({
    Key? key,
    required this.dropdownItems,
    required this.dropDownName,
    required this.star,
    required this.optionalisEmpty,
    required this.controller,
  }) : super(key: key);

  @override
  DropDownFormState createState() => DropDownFormState();
}

class DropDownFormState extends State<DropDownForm> {
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.controller.text.isNotEmpty ? widget.controller.text : null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: primaryWidth,
      child: DropdownSearch<String>(
        items: widget.dropdownItems,
        selectedItem: selectedItem, 
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            label: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.dropDownName,
                    style: textStyleGrey18,
                  ),
                  TextSpan(
                    text: widget.star,
                    style: textStyleRedStar,
                  ),
                ],
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
            border: OutlineInputBorder(),
            errorStyle: const TextStyle(color: Colors.red),
          ),
        ),
        onChanged: (String? newValue) {
          setState(() {
            selectedItem = newValue;
            if (selectedItem != null) {
              widget.controller.text = selectedItem!;
            }
          });
        },
        validator: (value) => validMethod(value),
        popupProps: PopupProps.menu(
          menuProps: MenuProps(
            backgroundColor: white,
          ),
          showSelectedItems: true,
          showSearchBox: true,
        ),
        clearButtonProps: ClearButtonProps(isVisible: true),
      ),
    );
  }

  String? validMethod(String? value) {
    if (widget.optionalisEmpty == true) {
      if (value == null || value.isEmpty) {
        return "Please enter ${widget.dropDownName}";
      }
      return null;
    }
    return null;
  }
}

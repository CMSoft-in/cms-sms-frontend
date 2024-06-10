import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../../../Model/Const/color.dart';
import '../../../../../Model/Const/height_width.dart';
import '../../../../../Model/Const/text_const.dart';

class MultiSelectTwoDropDownForm extends StatefulWidget {
  final List dropdownItems;
  final String dropDownName;
  final bool optionalisEmpty;
  final String star;
  final Function(List) onChanged;
  final List selectedIds;
  final TextEditingController controller;
  
  const MultiSelectTwoDropDownForm({
    Key? key,
    required this.selectedIds,
    required this.dropdownItems,
    required this.dropDownName,
    required this.onChanged,
    required this.star,
    required this.optionalisEmpty,
    required this.controller
  }) : super(key: key);

  @override
  MultiSelectTwoDropDownFormState createState() => MultiSelectTwoDropDownFormState();
}

class MultiSelectTwoDropDownFormState extends State<MultiSelectTwoDropDownForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: primaryWidth,
            child: GestureDetector(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return MultiSelectDialog(
                      items: widget.dropdownItems
                          .map((item) => MultiSelectItem(item["id"], item["name"]))
                          .toList(),
                      initialValue: widget.selectedIds,
                      title: Text(widget.dropDownName, style: textStyleGrey18),
                      onConfirm: (values) {
                        widget.onChanged(values);
                        widget.controller.text = values
                            .map((id) => widget.dropdownItems
                                .firstWhere((item) => item['id'] == id)['name'])
                            .join(', ');
                      },
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    labelText: widget.dropDownName,
                    labelStyle: textStyleGrey18,
                    suffixIcon: Icon(Icons.arrow_drop_down, color: black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: grey, width: 2),
                    ),
                    // errorText: validMethod(widget.selectedIds),
                    errorStyle: const TextStyle(color: Colors.red),
                  ),
                
                  maxLines: 15,
                  minLines: 1,
                  
                  validator: (value) {
                return validMethod(value);
              },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? validMethod( value) {
    if (widget.optionalisEmpty) {
      if (value.isEmpty) {
        return "Please enter ${widget.dropDownName}";
      }
    }
    return null;
  }
}
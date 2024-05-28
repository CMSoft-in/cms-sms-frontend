import 'package:flutter/material.dart';

import '../../../../Model/Const/height_width.dart';
import '../../../../Model/Const/text_const.dart';



class DropDownForm1 extends StatefulWidget {
  final List<String> dropdownItems;
  final String dropDownName;
  final bool optionalisEmpty;
  final String star;
  final  TextEditingController controller;
  final onChanged;
  const DropDownForm1(
      {super.key,
      required this.dropdownItems,
      required this.dropDownName,
      required this.star,
      required this.onChanged,
      required this.optionalisEmpty,
      required this.controller});

  @override
  DropDownForm1State createState() => DropDownForm1State();
}

class DropDownForm1State extends State<DropDownForm1> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: primaryWidth,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
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
                    )
                  ],)
                ),
                errorStyle: const TextStyle(color: Colors.red),
                border: const OutlineInputBorder(),
              ),
              validator: validMethod,
               style:textStyleBlack18,
              value: selectedItem,
              onChanged: widget.onChanged,
              items: widget.dropdownItems.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              
            ),
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



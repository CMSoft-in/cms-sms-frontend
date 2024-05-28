import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../../../../Model/Const/height_width.dart';
import '../../../../../Model/Const/text_const.dart';
import 'dart:async';
class DateTextFormField extends StatefulWidget {
  const DateTextFormField(
      {super.key,
      required this.controller,
      required this.text,
  
      required this.optionalisEmpty,

      required this.star,

      required this.enabled,
    });

  final TextEditingController controller;
  final String text;
  final bool optionalisEmpty;
  final String star;
  final bool enabled;

  @override
  State<DateTextFormField> createState() => _DateTextFormFieldState();
}

class _DateTextFormFieldState extends State<DateTextFormField> {

   DateTime selectedDate = DateTime.now();
  final TextEditingController dataController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        widget.controller.text = formattedDate;
       
      });
    }
  }
  @override
  Widget build(BuildContext context) {
  
    return SizedBox(
        width:
            primaryWidth /*isMobile ? primaryWidth : screenSize.width * 0.7*/,
        child: TextFormField(
          
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.date_range),
            border: const OutlineInputBorder(),
            label: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.text,
                    style: textStyleGrey18,
                  ),
                  TextSpan(
                    text: widget.star,
                    style: textStyleRedStar,
                  ),
                ],
              ),
            ),
            errorStyle: const TextStyle(color: Colors.red),
          ),
          validator: validMethod,
          controller: widget.controller,
          enabled: widget.enabled,
          onTap: () => _selectDate(context),
           style:textStyleBlack18,
        ));
  }

  String? validMethod(value) {
    if (widget.optionalisEmpty == true) {
      if (value == null || value.isEmpty) {
        return "Please enter ${widget.text == '+91-' ? 'Phone Number' : widget.text}";
      }

      return null;
    }
    return null;
  }
}

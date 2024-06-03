import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../../../../Model/Const/height_width.dart';
import '../../../../Model/Const/text_const.dart';

class TextformField extends StatefulWidget {
  const TextformField({
    super.key,
    required this.controller,
    required this.text,
    required this.limitLength,
    required this.optionalisEmpty,
    required this.inputformat,
    required this.star,
    required this.inputtype,
    required this.enabled,
  });

  final TextEditingController controller;
  final String text;
  final RegExp inputformat;
  final bool optionalisEmpty;
  final int limitLength;
  final String star;
  final inputtype;
  final bool enabled;

  @override
  State<TextformField> createState() => _TextformFieldState();
}

class _TextformFieldState extends State<TextformField> {
  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final isMobile = screenSize.width < 600;
    void changeValue(v){
      if (widget.text == "PAN Number") {
        setState(() {
           widget.controller.text = widget.controller.text.toUpperCase();
        });
       
      }
    }
  
    return SizedBox(
        width:
            primaryWidth /*isMobile ? primaryWidth : screenSize.width * 0.7*/,
        child: TextFormField(
          onChanged: (value) {
            changeValue(value);
          },
          inputFormatters: [
            FilteringTextInputFormatter.allow(widget.inputformat),
            LengthLimitingTextInputFormatter(widget.limitLength),
          ],
          keyboardType: widget.inputtype,
          
          decoration: InputDecoration(
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
          style: textStyleBlack18,
        ));
  }

  String? validMethod(value) {
    if (widget.optionalisEmpty == true) {
      if (value == null || value.isEmpty) {
        if(widget.text == "Email"){
            if(value.toString().endsWith("@gmail.com")){
                  return null;
            }
            else {
              return "Please enterr valid Email";
            }
       
      }
     
      return "Please enter ${widget.text == '+91-' ? 'Phone Number' : widget.text}";
    }
    return null;
  }
  else if(value.length > 0 && widget.text == "Email"){
            if(value.toString().endsWith("@gmail.com")){
                  return null;
            }
            else {
              return "Please enter valid Email";
            }
       
      }
  return null;
}
}
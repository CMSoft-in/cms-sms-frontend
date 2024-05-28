import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';

import '../../../Model/Const/height_width.dart';
import '../../../Model/Const/text_const.dart';

class FilePickerr2 extends StatefulWidget {
  FilePickerr2({
    Key? key,
    required this.fun,
    required this.optionalisEmpty,
    required this.text,
    required this.star,
    required this.filePathController,
    required this.file,
  }) : super(key: key);
  final star;
  final String text;
  final bool optionalisEmpty;
  final formKey = GlobalKey<FormState>();
  final TextEditingController filePathController;
  File? file;
  Function fun;
  @override
  State<FilePickerr2> createState() => _FilePickerrState();
}

class _FilePickerrState extends State<FilePickerr2> {
  void _openFileExplorer() async {
    try {
      print("picking");
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      print(result);
      if (result != null) {
        setState(() {
          print(widget.file);
          widget.file = File(result.files.single.path!);
          widget.fun(widget.file);
          print(widget.file);
          widget.filePathController.text = result.files.first.name;
          String? mimeType = lookupMimeType(widget.file!.path);
          print(mimeType);
        });
      } else {
        print("File not picked");
      }
    } catch (e) {
      print("Error While picking files $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: primaryWidth,
      key: widget.formKey,
      child: TextFormField(
        controller: widget.filePathController,
        readOnly: true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Row(
            children: [
              Text(
                widget.text,
                style: textStyleGrey18,
              ),
              Text(
                widget.star,
                style: textStyleRedStar,
              ),
            ],
          ),
          errorStyle: const TextStyle(color: Colors.red),
          prefixIcon: const Icon(Icons.attach_file),
        ),
        validator: validMethod,
        onTap: () {
          _openFileExplorer();
        },
      ),
    );
  }

  String? validMethod(value) {
    if (widget.optionalisEmpty == true) {
      if (value == null || value.isEmpty) {
        return "Please  ${widget.text}";
      }
      return null;
    }
    return null;
  }
}

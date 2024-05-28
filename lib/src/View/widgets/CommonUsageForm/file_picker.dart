import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../Model/Const/height_width.dart';
import '../../../Model/Const/text_const.dart';

class FilePickerr extends StatefulWidget {
  FilePickerr(
      {Key? key,
      required this.optionalisEmpty,
      required this.text,
      required this.star,
      required this.filePathController})
      : super(key: key);
  final star;
  final String text;
  final bool optionalisEmpty;
  final formKey = GlobalKey<FormState>();
  final TextEditingController filePathController;
  @override
  State<FilePickerr> createState() => _FilePickerrState();
}

class _FilePickerrState extends State<FilePickerr> {
  Future<void> _openFileExplorer() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['doc', 'png', 'jpg'],
      );
      if (result != null) {
        final fileName = result.files.single.name;
        setState(() {
          widget.filePathController.text = fileName;
        });
      }
    } catch (e) {
      print("Error picking file: $e");
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

// ignore_for_file: avoid_unnecessary_containers, avoid_print, unused_local_variable, unnecessary_null_comparison

import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '/src/Model/api/local.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FormSixCopy extends StatefulWidget {
  const FormSixCopy({Key? key}) : super(key: key);
  @override
  State<FormSixCopy> createState() => _FormSixState();
}

class _FormSixState extends State<FormSixCopy> {
  late File imageFile;
  final TextEditingController imageFileInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void uploadFile(File? file) async {
      var client = http.Client();
      if (file == null) {
        print('No file selected');
        return;
      }

      var request =
          http.MultipartRequest('POST', Uri.parse('$ip/Admin/update-client/1'));
      request.headers['Authorization'] = 'Bearer $token';
      // request.headers['Content-Type'] = 'application/file';

      request.files.add(http.MultipartFile(
          'panPdf', file.readAsBytes().asStream(), file.lengthSync()));

      var response = await client.send(request);

      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(responseBody);
      } else {
        print('Failed to upload file ${response.statusCode}');
        print('Response body: $responseBody');
      }
    }

    void openFilePicker() async {
      try {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          setState(() {
            imageFile = File(result.files.single.path!);
            imageFileInput.text = result.files.first.name;
          });
        } else {
          print("File not picked");
        }
      } catch (e) {
        print("Error While picking files $e");
      }
    }

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TextFormField(
                  controller: imageFileInput,
                  decoration: const InputDecoration(labelText: "Aadhar"),
                  onTap: () => openFilePicker(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  uploadFile(imageFile);
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

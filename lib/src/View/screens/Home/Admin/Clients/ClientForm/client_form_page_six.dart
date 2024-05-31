// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, depend_on_referenced_packages, avoid_print, use_build_context_synchronously
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/file_picker2.dart';
import '/src/View/screens/Home/Admin/Clients/ClientDataView/client_data_view_main.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/Buttons/back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/utility/client/client_text_const.dart';

class ClientFormPageSix extends StatefulWidget {
  ClientFormPageSix({Key? key, required this.id}) : super(key: key);
 final String id;

  @override
  State<ClientFormPageSix> createState() => _ClientFormPageSixState();
}

class _ClientFormPageSixState extends State<ClientFormPageSix> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final _aadharfilePathController = TextEditingController();
    final _panfilePathController = TextEditingController();
    File? _aadharFile;
    File? _panFile;
    final _aadharNumber = TextEditingController();
    final _panNumber = TextEditingController();

    const List<String> allowedTypes = [
      'application/pdf',
      'image/jpeg',
      'image/jpg',
      'image/png',
      'application/msword',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'application/vnd.ms-excel',
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    ];

    bool validateFileType(File file) {
      final mimeType = lookupMimeType(file.path);
      return mimeType != null && allowedTypes.contains(mimeType);
    }

    List<String> typeCheck(File file) {
      final mimeType = lookupMimeType(file.path);

      return mimeType!.split('/');
    }

    Future submitData(
        File panfile, File aadharfile, String aadhar, String pan) async {
      try {
        List panType = typeCheck(panfile);
        List aadharType = typeCheck(aadharfile);
        print("$panfile, $aadharfile");
        print("$aadhar,$pan");
        if (!validateFileType(panfile) || !validateFileType(aadharfile)) {
          print('Unsupported file type selected');
          return;
        } else {
          print("uploadFile entered");
        }

        var client = http.Client();

        var request = http.MultipartRequest(
          'PATCH',
          Uri.parse(ApiEndpoints.updateClient),
        );

        request.headers['Authorization'] = 'Bearer $token';
        request.headers['Content-Type'] = 'multipart/form-data';

        request.files.add(http.MultipartFile(
          'panPdf',
          panfile.readAsBytes().asStream(),
          panfile.lengthSync(),
          filename: 'panPdf',
          contentType: MediaType(panType[0], panType[1]),
        ));
        request.files.add(http.MultipartFile(
          'aadharPdf',
          aadharfile.readAsBytes().asStream(),
          aadharfile.lengthSync(),
          filename: 'aadharPdf',
          contentType: MediaType(aadharType[0], aadharType[1]),
        ));

        request.fields['pan_no'] = _panNumber.text;
        request.fields['aadhar_no'] = _aadharNumber.text;

        var response = await client.send(request);

        var responseBody = await response.stream.bytesToString();

        if (response.statusCode == 200) {
          print('File upload successful');
          print(responseBody);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ClientDataView()));
        } else {
          print('Failed to upload file: ${response.statusCode}');
          print('Response body: $responseBody');
        }
      } catch (e) {
        print("catughting some EXeception:  $e");
      }
    }

    void panFileChange(n) {
      _panFile = n;
    }

    void aadharFileChange(n) {
      _aadharFile = n;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      body: Container(
        color: Colors.white,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              formSizebox8,
              const Row(
                children: [
                  Expanded(
                    child: StackText(
                      stacktext: clientpage6,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              formSizebox15,
              FilePickerr2(
                fun: aadharFileChange,
                optionalisEmpty: true,
                text: uploadAadhar,
                star: estar,
                filePathController: _aadharfilePathController,
                file: _aadharFile,
              ),
              formSizebox8,
              FilePickerr2(
                fun: panFileChange,
                optionalisEmpty: true,
                text: uploadpan,
                star: estar,
                filePathController: _panfilePathController,
                file: _panFile,
              ),
              formSizebox8,
              TextformField(
                controller: _aadharNumber,
                text: aadharNumber,
                limitLength: 16,
                optionalisEmpty: false,
                inputformat: number,
                star: estar,
                inputtype: TextInputType.number,
                enabled: true,
              ),
              formSizebox8,
              TextformField(
                controller: _panNumber,
                text: panNumber,
                limitLength: 11,
                optionalisEmpty: false,
                inputformat: alphabatsAndNumbers,
                star: estar,
                inputtype: TextInputType.text,
                enabled: true,
              ),
              formSizebox15,
              SizedBox(
                width: primaryWidth,
                height: primaryHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Backbutton(
                      text: backText,
                      isEnabled: true,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        minimumSize:
                            const Size(nextButtonWidth, nextButtonHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        if (_panFile != null && _aadharFile != null) {
                          submitData(
                            _panFile!,
                            _aadharFile!,
                            _aadharNumber.text,
                            _panNumber.text,
                          );
                        } else {
                          print('One or both files are null');
                        }
                      },
                      child: const Text("Submit", style: textStyleWhite18),
                    ),
                  ],
                ),
              ),
              bottomHeight,
            ],
          ),
        ),
      ),
      bottomSheet: const SizedBox(
        height: 50.0, // Specify a height for the bottom sheet
        child: BottomSheetLogo(),
      ),
    );
  }
}

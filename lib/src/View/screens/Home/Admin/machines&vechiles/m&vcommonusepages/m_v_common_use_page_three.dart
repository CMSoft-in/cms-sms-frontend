import "/src/View/widgets/CommonUsageForm/file_picker.dart";
import "package:flutter/material.dart";

import "../../../../../../Model/Const/color.dart";
import "../../../../../../Model/Const/height_width.dart";
import "../../../../../../Model/Const/text_const.dart";
import "../../../../../widgets/CommonUsageForm/HintText.dart";
import "../m_v_text.dart";

class MVCommonBasicFormThree extends StatelessWidget {
  const MVCommonBasicFormThree(
      {super.key,
      required this.enabled,
      required this.machineImagesFilePathController,
      required this.registrationCertificateFilePathController,
      required this.insuranceFilePathController,
      required this.fitnessCertificateFilePathController,
     
      });
  final bool enabled;
  final TextEditingController machineImagesFilePathController;
   final TextEditingController registrationCertificateFilePathController;
  final TextEditingController insuranceFilePathController;
   final TextEditingController fitnessCertificateFilePathController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          StackText(
        stacktext: attachments,
        color: grey,
      ),
      formSizebox10,
        FilePickerr(optionalisEmpty: false, text: machineImages, star: estar, filePathController: machineImagesFilePathController),
        formSizebox10,
         FilePickerr(optionalisEmpty: false, text: registrationCertificate, star: estar, filePathController: registrationCertificateFilePathController),
           formSizebox10,
        FilePickerr(optionalisEmpty: false, text: insurance, star: estar, filePathController: insuranceFilePathController),
          formSizebox10,
        FilePickerr(optionalisEmpty: false, text: fitnessCertificate, star: estar, filePathController: fitnessCertificateFilePathController),
      ],
    );
  }
}

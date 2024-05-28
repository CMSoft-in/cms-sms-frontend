
import 'package:flutter/material.dart';

import '../../m&vcommonusepages/m_v_common_use_page_three.dart';

class VechilesViewDetailsThree extends StatelessWidget {
  const VechilesViewDetailsThree(
      {Key? key,
      required this.machineImagesFilePathController,
      required this.registrationCertificateFilePathController,
      required this.insuranceFilePathController,
      required this.fitnessCertificateFilePathController,
      required this.enabled})
      : super(key: key);
       final TextEditingController machineImagesFilePathController;
  final TextEditingController registrationCertificateFilePathController;
  final TextEditingController insuranceFilePathController;
  final TextEditingController fitnessCertificateFilePathController;
  final bool enabled;
  
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MVCommonBasicFormThree(enabled: enabled, machineImagesFilePathController: machineImagesFilePathController,
       registrationCertificateFilePathController: registrationCertificateFilePathController, 
       insuranceFilePathController: insuranceFilePathController
       , fitnessCertificateFilePathController: fitnessCertificateFilePathController)
    ]);
  }
}
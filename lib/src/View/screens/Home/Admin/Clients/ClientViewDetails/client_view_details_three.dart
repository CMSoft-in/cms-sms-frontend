import 'package:cmssms/src/Model/Const/height_width.dart';

import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '/src/Model/general/address.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';


class ClientViewDetailsThree extends StatelessWidget {
  const ClientViewDetailsThree(
      {Key? key,
      required this.addressline1Controller,
      required this.addressline2Controller,
      required this.cityController,
      required this.gstNumberController,
      required this.pincodeController,
      required this.stateController,
      required this.enabled})
      : super(key: key);
       final TextEditingController gstNumberController;
  final TextEditingController addressline1Controller;
  final TextEditingController addressline2Controller;
  final TextEditingController cityController;
  final TextEditingController pincodeController;
  final TextEditingController stateController;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextformField(
        controller: gstNumberController,
        text: gstNo,
        limitLength: 15,
        star: estar,
        inputformat: alphabatsAndNumbers,
        optionalisEmpty: false,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      formSizebox10,
       StackText(
        stacktext: OwnerAddress,
        color: grey,
      ),
     Address(enabled: enabled, addressline1Controller: addressline1Controller, addressline2Controller: addressline2Controller, cityController: cityController, pincodeController: pincodeController, stateController: stateController,
     addressline1OptionalisEmpty: false,
     addressline2OptionalisEmpty: false,
     cityOptionalisEmpty: false,
     pincodeOptionalisEmpty: false,
     stateOptionalisEmpty: false,
     star: estar,
     estar: estar,)
    ]);
  }
}

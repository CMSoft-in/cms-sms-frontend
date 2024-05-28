import '/src/Model/general/address.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/utility/client/client_text_const.dart';

class ClientViewDetailsOne extends StatelessWidget {
  const ClientViewDetailsOne(
      {Key? key,
      required this.clientNamee,
      required this.addressline1Controller,
      required this.addressline2Controller,
      required this.cityController,
      required this.pincodeController,
      required this.stateController,
      required this.enabled})
      : super(key: key);
  final TextEditingController clientNamee;
  final TextEditingController addressline1Controller;
  final TextEditingController addressline2Controller;
  final TextEditingController cityController;
  final TextEditingController pincodeController;
  final TextEditingController stateController;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      formSizebox15,
      const StackText(
        stacktext: clientpersonalInfo,
        color: grey,
      ),
      formSizebox10,
      TextformField(
        controller: clientNamee,
        text: clientName,
        star: star,
        limitLength: 20,
        optionalisEmpty: true,
        inputformat: alphabatsSpace,
        inputtype: keyboardTypeNone,
        enabled: enabled,
      ),
      formSizebox10,
      const StackText(
        stacktext: clientAddress,
        color: grey,
      ),
      formSizebox10,
      Address(
          enabled: enabled,
          addressline1Controller: addressline1Controller,
          addressline2Controller: addressline2Controller,
          cityController: cityController,
          pincodeController: pincodeController,
          stateController: stateController,
          addressline1OptionalisEmpty: true,
     addressline2OptionalisEmpty: false,
     cityOptionalisEmpty: true,
     pincodeOptionalisEmpty: true,
     stateOptionalisEmpty: true,
     star:star,
     estar: estar,
          ),
  
      
    ]);
  }
}

import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/general/address.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';

class SupplierViewDetailsOne extends StatelessWidget {
  const SupplierViewDetailsOne(
      {super.key,
      required this.addressline1Controller,
      required this.addressline2Controller,
      required this.cityController,
      required this.enabled,
      required this.pincodeController,
      required this.stateController,
      required this.supplierNameController});
  final bool enabled;

  final TextEditingController supplierNameController;
  final TextEditingController addressline1Controller;
  final TextEditingController addressline2Controller;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController pincodeController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox15,
        const StackText(
          stacktext: supplierInfo,
          color: grey,
        ),
        formSizebox10,
        TextformField(
            controller: supplierNameController,
            text: supplierName,
            limitLength: 20,
            optionalisEmpty: true,
            inputformat: alphabatsSpace,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: enabled),
        formSizebox10,
        const StackText(
          stacktext: supplierAddress,
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
            star: star,
            estar: estar,
            addressline1OptionalisEmpty: true,
     addressline2OptionalisEmpty: false,
     cityOptionalisEmpty: true,
     pincodeOptionalisEmpty: true,
     stateOptionalisEmpty: true,)
      ],
    );
  }
}

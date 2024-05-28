import "package:flutter/material.dart";

import "../../View/widgets/CommonUsageForm/textformfeild/text_form_field.dart";
import "../Const/height_width.dart";
import "../Const/text_const.dart";
import "../api/pincode_api.dart";


class Address extends StatelessWidget {
  const Address({
    super.key,
    required this.enabled,
    required this.addressline1Controller,
    required this.addressline2Controller,
    required this.cityController,
    required this.pincodeController,
    required this.stateController,
      required this.addressline1OptionalisEmpty,
    required this.addressline2OptionalisEmpty,
    required this.pincodeOptionalisEmpty,
    required this.cityOptionalisEmpty,
    required this.stateOptionalisEmpty,
    required this.star,required this.estar
  });
  final bool enabled;
  final TextEditingController addressline1Controller;
  final TextEditingController addressline2Controller;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController pincodeController;
   final bool addressline1OptionalisEmpty;
  final bool addressline2OptionalisEmpty;
  final bool pincodeOptionalisEmpty;
  final bool cityOptionalisEmpty;
  final bool stateOptionalisEmpty;
  final star;
  final estar;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextformField(
            controller: addressline1Controller,
            text: addressline1,
            limitLength: 120,
            optionalisEmpty: addressline1OptionalisEmpty,
            inputformat: alphabatsAndNumbers,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: enabled),
        formSizebox10,
        TextformField(
            controller: addressline2Controller,
            text: addressline2,
            limitLength: 120,
            optionalisEmpty: addressline2OptionalisEmpty,
            inputformat: alphabatsAndNumbers,
            star: estar,
            inputtype: keyboardTypeNone,
            enabled: enabled),
        formSizebox10,
        PincodeAPI(
            cityControllerName: cityController,
            stateControllerName: stateController,
            pincodeControllerName: pincodeController,
            star: star,
            optionalisEmpty: pincodeOptionalisEmpty,
            enabled: enabled,
            valueLength: 6),
        formSizebox10,
        TextformField(
            controller: cityController,
            text: city,
            limitLength: 60,
            optionalisEmpty: cityOptionalisEmpty,
            inputformat: alphabatsSpace,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: enabled),
        formSizebox10,
        TextformField(
            controller: stateController,
            text: state,
            limitLength: 30,
            optionalisEmpty: stateOptionalisEmpty,
            inputformat: alphabatsSpace,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: enabled),
      ],
    );
  }
}

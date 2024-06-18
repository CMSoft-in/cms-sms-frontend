import 'package:cmssms/src/Model/api/pincode_api.dart';
import 'package:cmssms/src/View/widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import 'package:cmssms/src/Model/Const/text_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/location_form_field.dart';

class SiteViewDetailsOne extends StatefulWidget {
  SiteViewDetailsOne(
      {super.key,
      required this.enabled,
      required this.addressline1Controller,
      required this.addressline2Controller,
      required this.cityControllerName,
      required this.pincodeControllerName,
      required this.siteNameController,
      required this.stateControllerName,
      // required this.sitegpsController,
      required this.isEditing,
    
       this.assignLocation,
      this.ontap});
  Function(String)? assignLocation;

  final bool enabled;
  final bool isEditing;
  final TextEditingController siteNameController;
  final TextEditingController addressline1Controller;
  final TextEditingController addressline2Controller;
  final TextEditingController cityControllerName;
  final TextEditingController stateControllerName;
  final TextEditingController pincodeControllerName;
  // final TextEditingController sitegpsController;
  final ontap;

  @override
  State<SiteViewDetailsOne> createState() => _SiteViewDetailsOneState();
}

class _SiteViewDetailsOneState extends State<SiteViewDetailsOne> {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox15,
        const StackText(
          stacktext: siteInfo,
          color: grey,
        ),
        formSizebox10,
        TextformField(
            controller: widget.siteNameController,
            text: siteName,
            limitLength: 20,
            optionalisEmpty: true,
            inputformat: alphabatsSpace,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: widget.enabled),
        formSizebox10,
        const StackText(
          stacktext: siteAddress,
          color: grey,
        ),
        formSizebox10,
        TextformField(
            controller: widget.addressline1Controller,
            text: addressline1,
            limitLength: 120,
            optionalisEmpty: true,
            inputformat: alphabatsAndNumbers,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: widget.enabled),
        formSizebox10,
        TextformField(
            controller: widget.addressline2Controller,
            text: addressline2,
            limitLength: 120,
            optionalisEmpty: false,
            inputformat: alphabatsAndNumbers,
            star: estar,
            inputtype: keyboardTypeNone,
            enabled: widget.enabled),
        formSizebox10,
        PincodeAPI(
            cityControllerName: widget.cityControllerName,
            stateControllerName: widget.stateControllerName,
            pincodeControllerName: widget.pincodeControllerName,
            star: star,
            optionalisEmpty: true,
            enabled: widget.enabled,
            valueLength: 6),
        formSizebox10,
        TextformField(
            controller: widget.cityControllerName,
            text: city,
            limitLength: 60,
            optionalisEmpty: true,
            inputformat: alphabatsSpace,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: widget.enabled),
        formSizebox10,
        TextformField(
            controller: widget.stateControllerName,
            text: state,
            limitLength: 30,
            optionalisEmpty: true,
            inputformat: alphabatsSpace,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: widget.enabled),
        formSizebox10,
        // isEditing
        //     ? LocationFormField(
        //         assignLocation: assignLocation,

        //         star: star,
        //         text: sitegps,
        //         controller: sitegpsController,
        //         enabled: enabled,
        //         optionalisEmpty: true)
        //     : 
        TextformField(
                controller: sitegpsController,
                text: sitegps,
                limitLength: 120,
                optionalisEmpty: true,
                inputformat: alphabatsAndNumbers,
                star: star,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled),
               
      ],
    );
  }
}

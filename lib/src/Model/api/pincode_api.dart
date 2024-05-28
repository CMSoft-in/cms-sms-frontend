import 'package:flutter/material.dart';
import '../../View/widgets/CommonUsageForm/textformfeild/code_text_form_field.dart';
import '../../controler/utility/get_pincode_details.dart';
import '../Const/text_const.dart';

class PincodeAPI extends StatelessWidget {
  const PincodeAPI(
      {Key? key,
      required this.cityControllerName,
      required this.stateControllerName,
      required this.pincodeControllerName,
      required this.star,
      required this.optionalisEmpty,
      required this.enabled,
      required this.valueLength})
      : super(key: key);
  final TextEditingController pincodeControllerName;
  final TextEditingController cityControllerName;
  final TextEditingController stateControllerName;
  final star;
  final valueLength;
  final optionalisEmpty;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return CodeTextField(
      controller: pincodeControllerName,
      text: pincode,
      valueLength: valueLength,
      star: star,
      limitLength: 6,
      optionalisEmpty: optionalisEmpty,
      inputformat: number,
      inputtype: keyboardTypeNumber,
      enabled: enabled,
      onchange: (value) async {
        if (value.length == 6) {
          var result = await getData(value);
          if (result != null) {
            var data = result;
            if (data[0]["Status"]=="Success") {
              var district = data[0]["PostOffice"][0]["District"];
              var state = data[0]["PostOffice"][0]["State"];
              cityControllerName.text = district;
              stateControllerName.text = state;
            }
          }
        }
      },
    );
  }
}

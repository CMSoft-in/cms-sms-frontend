import '../../../../../widgets/CommonUsageForm/textformfeild/drop_down_form_field_onchanged.dart';
import '/src/Model/Const/padding_const.dart';
import '/src/View/widgets/CommonUsageForm/textformfeild/text_form_field.dart';

import '../labor_outturn_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';

class LaborOuttrnViewDetailsFour extends StatefulWidget {
  LaborOuttrnViewDetailsFour(
      {Key? key,
      required this.siteController,
      required this.isEditing,
      required this.rateBasedonChanged,
      required this.rateBasedvalue,
      required this.outturnBasedvalue,
      required this.outturnBasedonChanged,
      required this.siteBasedController,
      required this.enabled})
      : super(key: key);

  final TextEditingController siteController;
  final bool rateBasedvalue;
  final rateBasedonChanged;
  final bool outturnBasedvalue;
  final outturnBasedonChanged;
  final bool isEditing;
  final bool enabled;
  final TextEditingController siteBasedController;
  @override
  State<LaborOuttrnViewDetailsFour> createState() =>
      _LaborOuttrnViewDetailsFourState();
}

class _LaborOuttrnViewDetailsFourState
    extends State<LaborOuttrnViewDetailsFour> {
  String K = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          formSizebox10,
          widget.isEditing
              ? DropDownForm1(
                  dropdownItems: ['Site 1', "Site 2", "Site 3"],
                  dropDownName: site,
                  star: star,
                  optionalisEmpty: false,
                  controller: widget.siteController,
                  onChanged: (value) {
                    setState(() {
                      K = value;
                      widget.siteController.text = value;
                    });
                  },
                )
              : TextformField(
                  controller: widget.siteController,
                  text: star,
                  limitLength: 50,
                  optionalisEmpty: false,
                  inputformat: alphabatsAndNumbers,
                  star: star,
                  inputtype: keyboardTypeNone,
                  enabled: widget.enabled,
                ),
          formSizebox10,
          Container(
            width: primaryWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: Text(outturnBased),
                    leading: Checkbox(
                      value: widget.outturnBasedvalue,
                      onChanged: widget.outturnBasedonChanged,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(rateBased),
                    leading: Checkbox(
                      value: widget.rateBasedvalue,
                      onChanged: widget.rateBasedonChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: left30,
              child: Row(
                children: [
                  Text(K),
                ],
              ),
            ),
          ),
          TextformField(
              controller: widget.siteBasedController,
              text:widget.rateBasedvalue ?"${K+" "+ rate }":"${K+" "+outturn }",
              limitLength: 30,
              optionalisEmpty: false,
              inputformat: alphabatsAndNumbers,
              star: star,
              inputtype: keyboardTypeNone,
              enabled: widget.enabled)
        ],
      ),
    );
  }
}

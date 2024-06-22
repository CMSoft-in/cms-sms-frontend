import '/src/Model/Const/padding_const.dart';

import '../../../../Model/utility/client/client_text_const.dart';
import '../../../../Model/Const/color.dart';
import 'package:flutter/material.dart';

class DataHeader extends StatelessWidget {
  const DataHeader({
    Key? key,
    required this.titlename,
    required this.dataTableNameTwo,
    required this.dataTableNameThree,
    // required this.primaryNumber
  }) : super(key: key);
  final titlename;
  final dataTableNameTwo;
  final dataTableNameThree;
  // final primaryNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: grey), color: dataHeaderColor),
      width: double.infinity,
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Padding(
            padding: left10,
            child: Text(
              titlename,
              style: datatableHeaderblack16,
            ),
          ),
        ),
        Expanded(
          child: Text(
                  dataTableNameTwo,
                  style: datatableHeaderblack16,
                ),
        ),
        Expanded(
          child: Padding(
            padding: right25,
            child: Text(
              dataTableNameThree,
              style: datatableHeaderblack16,
            ),
          ),
        ),
      ]),
    );
  }
}

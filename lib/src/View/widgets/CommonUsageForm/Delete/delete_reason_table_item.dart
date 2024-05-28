import '/src/Model/Const/padding_const.dart';
import 'package:flutter/widgets.dart';

import '../../../../Model/utility/client/client_text_const.dart';
import '../../../../Model/Const/color.dart';

import 'package:flutter/material.dart';

class DeleteDataItem extends StatelessWidget {
  const DeleteDataItem(
      {Key? key,
      required this.deletepersonName,
      required this.deleteReason,
      required this.deletedDate})
      : super(key: key);

  final deletepersonName;
  final deleteReason;
  final deletedDate;
  @override
  Widget build(BuildContext context) {
   // var screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: grey),
        color: white,
      ),
      width: double.infinity,
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Padding(
            padding: left10,
            child: Text(
              deletepersonName,
              style: datatableblack16,
            ),
          ),
        ),
        Expanded(
          child: Text(
            deleteReason,
            style: datatableblack16,
          ),
        ),
        Expanded(
          child: Padding(
            padding: right10,
            child: Center(
              child: Text(
                deletedDate,
                style: datatableblack16,
              ),
            ),
          ),
        )
      ]),
    );
  }
}

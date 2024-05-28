import 'package:flutter/material.dart';

import '../../../../Model/utility/client/client_text_const.dart';
import '../../../../Model/Const/color.dart';
import '../../../../Model/Const/padding_const.dart';

class UpdateHeader extends StatelessWidget {
  const UpdateHeader(
      {super.key,
      this.updatedByHeader,
      this.oldValueHeader,
      this.newValueHeader});
  final oldValueHeader;
  final newValueHeader;
  final updatedByHeader;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: dataHeaderColor,
        border: Border.all(color: Colors.grey),
      ),
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: left10, // Keeping the padding notation as provided
              child: Text(
                oldValueHeader,
                style: datatableHeaderblack16,
              ),
            ),
          ),
          Expanded(
            child: Text(
              newValueHeader,
              style: datatableHeaderblack16,
            ),
          ),
          Expanded(
            child: Padding(
              padding: right10, // Keeping the padding notation as provided
              child: Center(
                child: Text(
                  updatedByHeader,
                  style: datatableHeaderblack16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

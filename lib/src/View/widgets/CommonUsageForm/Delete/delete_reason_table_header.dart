import 'package:flutter/material.dart';

import '../../../../Model/utility/client/client_text_const.dart';
import '../../../../Model/Const/color.dart';
import '../../../../Model/Const/padding_const.dart';

class deleteTableHeader extends StatelessWidget {
  const deleteTableHeader({super.key,this.deleteperson,this.deleteReason,this.deleteDate});
  final deleteperson;
  final deleteReason;
  final deleteDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: dataHeaderColor,border: Border.all(color: grey)
      ),
        width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
           Expanded(
             child: Padding(
               padding: left10,
               child: Text(
                deleteperson,
                style: datatableHeaderblack16,
                         
                       ),
             ),
           ),Expanded(
             child: Text(
              deleteReason,
              style: datatableHeaderblack16,
                       
                     ),
           ),Expanded(
             child: Padding(
                       padding:right45,
                       child: Center(
                         child: Text(
                                         deleteDate,
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

import 'package:cmssms/src/Model/Const/padding_const.dart';
import 'package:flutter/material.dart';
import '../../../../Model/utility/client/client_text_const.dart';

Widget mainNameMiddleColumn(middleColumMainName){
    if(middleColumMainName.runtimeType == int){
  middleColumMainName = middleColumMainName.toString();
}

  return Text(
    middleColumMainName,
    style: datatableblack16,
  );
          }
Widget mainSubNameMiddleColumn(navigatePage,doubleStar,middleColumMainName,middleColumnSubName){
   if(middleColumMainName.runtimeType == int){
  middleColumMainName = middleColumMainName.toString();
}

if(middleColumnSubName.runtimeType == int){
  middleColumnSubName = middleColumnSubName.toString();
}

  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          middleColumMainName,
          style: datatableblack16,
        ),
         
         Padding(
           padding: left20,
           child: Text(
                 middleColumnSubName,
                 style: datatableblack16,
               ),
         ),
      ],
  );
}
Widget mainSubSecondSubNameMiddleColumn(navigatePage,doubleStar,middleColumMainName,middleColumnSubName,middleColumnSecondSubName){
    if(middleColumMainName.runtimeType == int){
  middleColumMainName = middleColumMainName.toString();
}

if(middleColumnSubName.runtimeType == int){
  middleColumnSubName = middleColumnSubName.toString();
}
if(middleColumnSecondSubName.runtimeType == int){
  middleColumnSecondSubName = middleColumnSecondSubName.toString();
}
  return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: left20,
          child: Text(
            doubleStar+middleColumMainName,
            style: datatableblack16,
          ),
        ),
         
         Padding(
           padding: left25,
           child: Text(
                 middleColumnSubName,
                 style: datatableblack16,
               ),
         ),
         Padding(
           padding: left30,
           child: Text(
                 middleColumnSecondSubName,
                 style: datatableblack16,
               ),
         ),
      ],
  );
}
 
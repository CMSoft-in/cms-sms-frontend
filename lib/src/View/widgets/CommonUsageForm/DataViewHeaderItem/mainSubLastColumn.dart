
import 'package:flutter/material.dart';

import '../../../../Model/Const/padding_const.dart';
import '../../../../Model/utility/client/client_text_const.dart';

Widget mainNameLastColumn(lastColumMainName){
  if(lastColumMainName.runtimeType == int){
  lastColumMainName = lastColumMainName.toString();
}
  return Padding(
            padding:right25,
            child: Text(
              lastColumMainName ?? " ",
              style: datatableblack16,
            ),
          );
          }
Widget mainSubNameLastColumn(navigatePage,doubleStar,var lastColumMainName,var lastColumnSubName){
if(lastColumMainName.runtimeType == int){
  lastColumMainName = lastColumMainName.toString();
}

if(lastColumnSubName.runtimeType == int){
  lastColumnSubName = lastColumnSubName.toString();
}

  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: right25,
          child: Text(
            lastColumMainName,
            style: datatableblack16,
          ),
        ),
         
         Padding(
           padding: right20,
           child: Text(
                 lastColumnSubName,
                 style: datatableblack14,
               ),
         ),
      ],
  );
}
Widget mainSubSecondSubNameLastColumn(navigatePage,doubleStar,lastColumMainName,lastColumnSubName,lastColumnSecondSubName){
  if(lastColumMainName.runtimeType == int){
  lastColumMainName = lastColumMainName.toString();
}

if(lastColumnSubName.runtimeType == int){
  lastColumnSubName = lastColumnSubName.toString();
}
if(lastColumnSecondSubName.runtimeType == int){
  lastColumnSecondSubName = lastColumnSecondSubName.toString();
}


  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: right25,
          child: Text(
            lastColumMainName,
            style: datatableblack16,
          ),
        ),
         
         Padding(
           padding: right20,
           child: Text(
                 lastColumnSubName,
                 style: datatableblack14,
               ),
         ),
         Padding(
           padding: right15,
           child: Text(
                 lastColumnSecondSubName,
                 style: datatableblack13,
               ),
         ),
      ],
  );
}
 
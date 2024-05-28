import 'package:flutter/material.dart';

import '../../../../Model/Const/padding_const.dart';
import '../../../../Model/utility/client/client_text_const.dart';

Widget mainNameFirstColumn(navigatePage,doubleStar,firstColumnMainName){
   if(firstColumnMainName.runtimeType == int){
  firstColumnMainName = firstColumnMainName.toString();
}
if(firstColumnMainName == null){
  firstColumnMainName = " ";
}
  return Padding(
     padding:left30,
     child: GestureDetector(
       onTap: () {
        navigatePage();
       },
       child: Text(
         doubleStar+firstColumnMainName,
         style: datatableblack16,
       ),
     ),
   );
}
Widget mainSubNameFirstColumn(navigatePage,doubleStar,firstColumnMainName,firstColumnSubName){
   if(firstColumnMainName.runtimeType == int){
  firstColumnMainName = firstColumnMainName.toString();
}

if(firstColumnSubName.runtimeType == int){
  firstColumnSubName = firstColumnSubName.toString();
}
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: left20,
               child: GestureDetector(
                 onTap: () {
                  navigatePage();
                 },
                 child: Text(
                   doubleStar+firstColumnMainName,
                   style: datatableblack16,
                 ),
               ),
             ),
              Padding(
                padding: left30,
                child: Text(
                      firstColumnSubName,
                      style: datatableblack14,
                    ),
              ),
           ],
         );
}
Widget mainSubSecondSubNameFirstColumn(navigatePage,doubleStar,firstColumnMainName,firstColumnSubName,firstColumnSecondSubName){
  if(firstColumnMainName.runtimeType == int){
  firstColumnMainName = firstColumnMainName.toString();
}

if(firstColumnSubName.runtimeType == int){
  firstColumnSubName = firstColumnSubName.toString();
}
if(firstColumnSecondSubName.runtimeType == int){
  firstColumnSecondSubName = firstColumnSecondSubName.toString();
}
  return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: left20,
               child: GestureDetector(
                 onTap: () {
                  navigatePage();
                 },
                 child: Text(
                   doubleStar+firstColumnMainName,
                   style: datatableblack16,
                 ),
               ),
             ),
              Padding(
                padding: left25,
                child: Text(
                      doubleStar+firstColumnSubName,
                      style: datatableblack14,
                    ),
              ),
               Padding(
                 padding: left30,
                 child: Text(
                       doubleStar+firstColumnSecondSubName,
                       style: datatableblack13,
                     ),
               ),
           ],
         );
}

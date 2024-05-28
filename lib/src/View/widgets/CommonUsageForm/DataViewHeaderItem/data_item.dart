
import '../../../../Model/Const/color.dart';
import 'package:flutter/material.dart';
import 'mainSubFirstColumn.dart';
import 'mainSubLastColumn.dart';
import 'mainSubMiddleColumn.dart';

class DataItem extends StatelessWidget {
  const DataItem(
      {Key? key,
      required this.firstColumnMainName,
       required this.firstColumnSubName,
      required this.firstColumnSecondSubName,
      required this.lastColumMainName,
      required this.lastColumnSubName,
      required this.lastColumnSecondSubName,
      required this.middleColumMainName,
      required this.middleColumnSubName,
      required this.middleColumnSecondSubName,
      required this.doubleStar,
      required this.navigatePage,
      required this.fixFistColumnLength,
      required this.fixLastColumnLength,
     required this.fixMiddleColumnLength
      })
      : super(key: key);
  final  doubleStar;
  final firstColumnMainName; 
  
  final navigatePage;
  final fixFistColumnLength;
  final  firstColumnSubName;
  final  firstColumnSecondSubName;
  final  lastColumMainName;
  final  lastColumnSubName;
  final  lastColumnSecondSubName;
  final  middleColumMainName;
  final  middleColumnSubName;
  final  middleColumnSecondSubName;
  final  fixLastColumnLength;
  final  fixMiddleColumnLength;

Widget fixFistColumn(fixFistColumnLength){
  if(fixFistColumnLength==1){
    return mainNameFirstColumn(navigatePage,doubleStar,firstColumnMainName);
  }
  else if(fixFistColumnLength==2){
    return mainSubNameFirstColumn(navigatePage,doubleStar,firstColumnMainName,firstColumnSubName);
  }
  else if(fixFistColumnLength==3){
    return mainSubSecondSubNameFirstColumn(navigatePage,doubleStar,firstColumnMainName,firstColumnSubName,firstColumnSecondSubName,);
  }
  return const CircularProgressIndicator();
}

Widget fixLastColumn(fixLastColumnLength){
  if(fixLastColumnLength==1){
    return mainNameLastColumn(lastColumMainName);
  }
  else if(fixLastColumnLength==2){
    return mainSubNameLastColumn(navigatePage,doubleStar,lastColumMainName,lastColumnSubName);
  }
  else if(fixLastColumnLength==3){
    return mainSubSecondSubNameLastColumn(navigatePage,doubleStar,lastColumMainName,lastColumnSubName,lastColumnSecondSubName,);
  }
  return const CircularProgressIndicator();
}
Widget fixMiddleColumn(fixMiddleColumnLength){
  if(fixMiddleColumnLength==1){
    return mainNameMiddleColumn(middleColumMainName);
  }
  else if(fixMiddleColumnLength==2){
    return mainSubNameMiddleColumn(navigatePage,doubleStar,middleColumMainName,middleColumnSubName);
  }
  else if(fixMiddleColumnLength==3){
    return mainSubSecondSubNameMiddleColumn(navigatePage,doubleStar,middleColumMainName,middleColumnSubName,middleColumnSecondSubName);
  }
  return const CircularProgressIndicator();
}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: grey),
        color: white,
      ),
      width: double.infinity,
    //  height: fixFistColumnLength== 1 || fixMiddleColumnLength==1 ||
    //   fixLastColumnLength  == 1 ? 75 : 75,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
       Expanded(
         child: 
        fixFistColumn(fixFistColumnLength),
       ),
           Expanded(
             child: fixMiddleColumn(fixMiddleColumnLength)
           ),
        Expanded(
          child:  fixLastColumn(fixLastColumnLength)
        )
      ]),
    );
  }
}


import "package:cmssms/src/View/screens/Home/Admin/AdminScreen/admin_landing_page.dart";
import "package:cmssms/src/View/widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart";
import "package:flutter/material.dart";

import "../../../../../../Model/Const/image_const.dart";
import "../../../../../../Model/Const/text_const.dart";

class LaborOutturnDataView extends StatelessWidget {
  const LaborOutturnDataView({super.key});
  
  get navigateToLaborCategoryViewDetails => ();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return DataView(
      header:Text("jjj") ,
      navigatePage: navigateToLaborCategoryViewDetails,
      deletext: "",
      onpress: AdminlandingPage(),
        fixFistColumnLength: 1,
        fixMiddleColumnLength: 1,
        fixLastColumnLength: 1,
        id: 'co_labor_outturn_id',
        firstColumnMainName: "",
        firstColumnsubName: "",
        firstColumnSecondSubName: "",
        middleColumMainName: "",
        middleColumnSubName: "",
        middleColumnSecondSubName: "",
        lastColumMainName: "",
        lastColumnSubName: "",
        lastColumnSecondSubName: "",
        dataTableNameOne: "",
        dataTableNameTwo: "",
        uri: "",
        doubleStar: estar,
       
        image: laborOutturnEmptyDataImage,
        dateOrNot: false,
        mapOrNot: false);
  }
}

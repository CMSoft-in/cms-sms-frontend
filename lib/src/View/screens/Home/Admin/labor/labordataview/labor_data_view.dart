import 'package:cmssms/src/Model/api/api_model.dart';

import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart';
import '../deletelabor/delete_labor_table.dart';
import '/src/Model/Const/color.dart';
import '/src/View/screens/Home/Admin/labor/laborform/labor_form_one.dart';
import '/src/Model/Const/image_const.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../../laborcategory/labor_category_text.dart';
import '../labor_text_const.dart';
import '../laborviewdetails/labor_view_details_main.dart';

class LaborDataView extends StatelessWidget {
  const LaborDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void navigateToLaborViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LaborViewDetailsMain(id: id)),
      );
    }
    var dataViewContainer = DataView(
      dateOrNot: false,mapOrNot: false,
      deletext: deletelabor,
      onpress: LaborDeleteTable(),
      fixFistColumnLength: 1,
      fixMiddleColumnLength: 1,
      fixLastColumnLength: 1,
      firstColumnMainName:"first_name" ,
      firstColumnsubName:"first_name" ,
      firstColumnSecondSubName:"first_name" ,
      middleColumMainName:"co_labour_category_id" ,
      middleColumnSubName:"co_labour_category_id" ,
      middleColumnSecondSubName: "co_labour_category_id",
      lastColumMainName:"co_current_sites_allocation" ,
      lastColumnSubName: "co_current_sites_allocation",
      lastColumnSecondSubName:"co_current_sites_allocation" ,
      id: "co_labour_id",
      uri: ApiEndpoints.getAllLabours,
        image: laborEmptyDataImage,
        header: const EmptyViewHeaderBar(
          image: labors,
          onpress: LaborFormPageOne(),
          text: titlelabors,
        ),
        navigatePage: navigateToLaborViewDetails,
        doubleStar: estar,
        dataTableNameOne: laborName,
        dataTableNameTwo: laborCategoryText,
        );
    return Container(color: white, child: dataViewContainer);
  }
}

import 'package:cmssms/src/Model/api/api_model.dart';

import '../../../../../../Model/Const/image_const.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/delete_data_view.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_header.dart';
import '../../laborcategory/labor_category_text.dart';
import '../labor_text_const.dart';
import 'delete_labor_form_view.dart';



class LaborDeleteTable extends StatelessWidget {
  const LaborDeleteTable({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToLaborViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LaborFormDeleteView(id: id)),
      );
    }

    return Container(
      color: white,
      child: DeleteDataView(
        dateOrNot: false,mapOrNot: false,
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
      uri: ApiEndpoints.getAllDeletedLabours,
        doubleStar: doublestar,
        image:laborEmptyDataImage,
        navigatePage: navigateToLaborViewDetails,
        header: const DeleteHeader(
          image: labors,
          deleteText: deleteLaborText,
        ),
        dataTableNameOne: laborName,
        dataTableNameTwo: laborCategoryText,
      
      ),
    );
  }
}

import '../../../../../../Model/Const/image_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/delete_data_view.dart';
import '../work_category_text.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_header.dart';
import 'delete_work_category_form_view.dart';

class WorkCategoryDeleteTable extends StatelessWidget {
  const WorkCategoryDeleteTable({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToWorkCategoryViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WorkCategoryFormDeleteView(id: id)),
      );
    }

    return Container(
      color: white,
      child: DeleteDataView(
        dateOrNot: false,
          mapOrNot: false,
         fixFistColumnLength: 1,
      fixMiddleColumnLength:1 ,
      fixLastColumnLength: 1,
      firstColumnMainName: "co_work_category_name",
      firstColumnsubName: "co_labour_category_name",
      firstColumnSecondSubName: "co_labour_category_name",
      middleColumMainName: "co_work_category_desc",
      middleColumnSubName: "co_labour_category_desc",
      middleColumnSecondSubName: "co_labour_category_desc",
      lastColumMainName: "created_by",
      lastColumnSubName: "created_by",
      lastColumnSecondSubName: "created_by",
      id: "co_work_category_id",
      uri: ApiEndpoints.getAllDeletedWorkCategories,
        doubleStar: doublestar,
        image: workCategoryEmptyDataImage,
        
        navigatePage: navigateToWorkCategoryViewDetails,
        header: const DeleteHeader(
          image: workCategory,
          deleteText: deleteWorkCategoryText,
        ),

        dataTableNameOne: workCategoryText,
        dataTableNameTwo: categorydistribution,
       
        
      ),
    );
  }
}

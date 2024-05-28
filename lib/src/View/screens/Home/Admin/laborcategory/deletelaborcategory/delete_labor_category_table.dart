import '../../../../../../Model/Const/image_const.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/delete_data_view.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_header.dart';
import '../../laborcategory/labor_category_text.dart';
import 'delete_labor_category_form_view.dart';

class LaborCategoryDeleteTable extends StatelessWidget {
  const LaborCategoryDeleteTable({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToLaborCategoryViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LaborCategoryFormDeleteView(id: id)),
      );
    }

    return Container(
      color: white,
      child: DeleteDataView(mapOrNot: false,

        dateOrNot: false,
        fixFistColumnLength: 1,
      fixMiddleColumnLength:1 ,
      fixLastColumnLength: 1,
      firstColumnMainName: "co_labour_category_name",
      firstColumnsubName: "co_labour_category_name",
      firstColumnSecondSubName: "co_labour_category_name",
      middleColumMainName: "co_labour_category_desc",
      middleColumnSubName: "co_labour_category_desc",
      middleColumnSecondSubName: "co_labour_category_desc",
      lastColumMainName: "created_by",
      lastColumnSubName: "created_by",
      lastColumnSecondSubName: "created_by",
      id: "co_labour_category_id",
      uri:"$ip/Admin/getAll-Deletedlabourcategory",
        doubleStar: doublestar,
        image: laborCategoryEmptyDataImage,
        navigatePage: navigateToLaborCategoryViewDetails,
        header: const DeleteHeader(
          image: laborCategory,
          deleteText: deleteLaborCategoryText,
        ),
        dataTableNameOne: laborCategoryText,
        dataTableNameTwo: categorydistribution,
        
      ),
    );
  }
}

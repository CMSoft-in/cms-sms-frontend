import '../../../../../../Model/api/api_model.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart';
import '../deleteworkcategory/delete_work_category_table.dart';
import '/src/View/screens/Home/Admin/workcategory/work_category_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/image_const.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../../../../../../Model/api/local.dart';
import '../workcategoryform/work_category_form.dart';
import '../workcategoryview/work_category_view_main.dart';

class WorkCategoryDataView extends StatelessWidget {
  const WorkCategoryDataView({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToWorkCategoryViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WorkCategoryViewDetailsMain(id: id)),
      );
    }

    return DataView(
      dateOrNot: false,
      mapOrNot: false,
      fixFistColumnLength: 2,
      fixMiddleColumnLength: 1,
      fixLastColumnLength: 1,
      firstColumnMainName: "co_work_category_name",
      firstColumnsubName: "co_work_category_outturn_measurement",
      firstColumnSecondSubName: "co_work_category_name",
      middleColumMainName: "co_work_category_desc",
      middleColumnSubName: "co_work_category_name",
      middleColumnSecondSubName: "co_work_category_name",
      lastColumMainName: "co_work_category_name",
      lastColumnSubName: "co_work_category_name",
      lastColumnSecondSubName: "co_work_category_name",
      id: "co_work_category_id",
      uri: ApiEndpoints.getAllWorkCategories,
      image: workCategoryEmptyDataImage,
      header: const EmptyViewHeaderBar(
        image: workCategory,
        onpress: WorkCategoryForm(),
        text: titleworkCategory,
      ),
      navigatePage: navigateToWorkCategoryViewDetails,
      doubleStar: estar,
      dataTableNameOne: workCategoryText,
      dataTableNameTwo: categorydistribution,
      deletext: deleteworkCategory,
      onpress: const WorkCategoryDeleteTable(),
    );
  }
}

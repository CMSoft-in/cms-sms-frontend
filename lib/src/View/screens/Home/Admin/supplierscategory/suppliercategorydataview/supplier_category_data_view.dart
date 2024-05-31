import '../../../../../../Model/api/api_model.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart';
import '../deletesupplierscategory/delete_suppliers_category_table.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/image_const.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../supplier_category_text.dart';
import '../suppliercategoryform/supplier_category_form.dart';
import '../suppliercategoryviewdetails/supplier_category_view_details_main.dart';

class SupplierCategoryDataView extends StatelessWidget {
  const SupplierCategoryDataView({super.key});

  @override
  Widget build(BuildContext context) {
     void navigateToSupplierCategoryViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SupplierCategoryViewDetailsMain(id: id)),
      );
    }
    return DataView(
      dateOrNot: false,mapOrNot: false,
      fixFistColumnLength: 1,
      fixMiddleColumnLength: 1,
      fixLastColumnLength: 1,
      firstColumnMainName: "co_supplier_category_name",
      firstColumnsubName: "co_supplier_category_name",
      firstColumnSecondSubName: "co_supplier_category_name",
      middleColumMainName: "co_supplier_category_desc",
      middleColumnSubName: "co_supplier_category_desc",
      middleColumnSecondSubName:"co_supplier_category_desc" ,
      lastColumMainName: "created_by",
      lastColumnSubName: "created_by",
      lastColumnSecondSubName: "created_by",
      id: "co_supplier_category_id",
      uri: ApiEndpoints.getAllSupplierCategories,
        image: supplierCategoryEmptyDataImage,
        header: const EmptyViewHeaderBar(
          image: supplierCategory,
          onpress: SupplierCategoryForm(),
          text: titlesupplierCategory,
        ),
        navigatePage: navigateToSupplierCategoryViewDetails,
        doubleStar: estar,
        dataTableNameOne: supplierCategoryText,
        dataTableNameTwo: materialSupplied,
        deletext: deleteSupplierCategory,
        onpress: SuppliersCategoryDeleteTable(),
     );
  }
}

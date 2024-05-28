import '../../../../../../Model/Const/image_const.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/delete_data_view.dart';
import '../supplier_category_text.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_header.dart';
import 'delete_supplier_category_form_view.dart';

class SuppliersCategoryDeleteTable extends StatelessWidget {
  const SuppliersCategoryDeleteTable({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToSuppliersCategoryViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuppliersCategoryFormDeleteView(id: id)),
      );
    }

    return Container(
      color: white,
      child: DeleteDataView(
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
      uri:"$ip/Admin/deleted-supplier-categories",
        doubleStar: doublestar,
        image:supplierCategoryEmptyDataImage,
        navigatePage: navigateToSuppliersCategoryViewDetails,
        header: const DeleteHeader(
          image: supplierCategory,
          deleteText: deleteSuppliersText,
        ),
        dataTableNameOne: supplierCategoryText,
        dataTableNameTwo: materialSupplied,
       
      ),
    );
  }
}

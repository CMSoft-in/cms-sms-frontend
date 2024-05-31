import '../../../../../../Model/Const/image_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/delete_data_view.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_header.dart';
import 'delete_suppliers_form_view.dart';

class SuppliersDeleteTable extends StatelessWidget {
  const SuppliersDeleteTable({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToSuppliersViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuppliersFormDeleteView(id: id)),
      );
    }

    return Container(
      color: white,
      child: DeleteDataView(dateOrNot: false,
      mapOrNot: false,
      fixFistColumnLength:1,
      fixMiddleColumnLength: 2,
      fixLastColumnLength: 1,
      firstColumnMainName: "co_supplier_name",
      firstColumnsubName: "CoSupplierCategory",
      firstColumnSecondSubName:"CoSupplierCategory" ,
      middleColumMainName: "primary_contact_name",
      middleColumnSubName: "primary_contact_no",
      middleColumnSecondSubName: "primary_contact_no",
      lastColumMainName: "co_supplier_name",
      lastColumnSubName: "co_supplier_category_id",
      lastColumnSecondSubName: "co_supplier_category_id",
      id: "co_supplier_id",
      uri:ApiEndpoints.getAllDeletedSuppliers,
        doubleStar: doublestar,
        image:supplierEmptyDataImage,
    
        navigatePage: navigateToSuppliersViewDetails,
        header: const DeleteHeader(
          image: suppliers,
          deleteText: deleteSuppliersText,
        ),
    
        dataTableNameOne: supplierDataTableName,
        dataTableNameTwo: supplierDataTableProjectName,

        
      ),
    );
  }
}

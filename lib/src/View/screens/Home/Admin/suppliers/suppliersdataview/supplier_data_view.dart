import '../../../../../../Model/api/api_model.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart';
import '../deletesupplier/delete_suppliers_table.dart';
import '../suppliersviewdetails/supplier_view_details_main.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/image_const.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';

import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';
import '../suppliersform/supplier_form_page_one.dart';

class SupplierDataView extends StatelessWidget {
  const SupplierDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void navigateToSuppliersViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SupplierViewDetailsMain(id: id)),
      );
    }

    var dataViewContainer = DataView(
      dateOrNot: false,
      mapOrNot: true,
      fixFistColumnLength: 2,
      fixMiddleColumnLength: 2,
      fixLastColumnLength: 1,
      firstColumnMainName: "co_supplier_name",
      firstColumnsubName: "CoSupplierCategory",
      firstColumnSecondSubName: "CoSupplierCategory",
      middleColumMainName: "primary_contact_name",
      middleColumnSubName: "primary_contact_no",
      middleColumnSecondSubName: "primary_contact_no",
      lastColumMainName: "co_supplier_name",
      lastColumnSubName: "co_supplier_category_id",
      lastColumnSecondSubName: "co_supplier_category_id",
      id: "co_supplier_id",
      uri: ApiEndpoints.getAllSuppliers,
      header: const EmptyViewHeaderBar(
        image: suppliers,
        onpress: SupplierFormPageOne(),
        text: titlesuppliers,
      ),
      image: supplierEmptyDataImage,
      navigatePage: navigateToSuppliersViewDetails,
      doubleStar: estar,
      dataTableNameOne: supplierDataTableName,
      dataTableNameTwo: supplierDataTableProjectName,
      dataTableNameThree: supplierDataTableProjectName,
      deletext: deleteSupplierText,
      onpress: const SuppliersDeleteTable(),
    );

    return Container(color: white, child: dataViewContainer);
  }
}

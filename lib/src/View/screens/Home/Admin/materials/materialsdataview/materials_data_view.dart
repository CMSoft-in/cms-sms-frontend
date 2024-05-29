import '../../../../../../Model/api/api_model.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart';
import '../deletematerials/delete_materials_table.dart';
import '/src/View/screens/Home/Admin/materials/materials_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/image_const.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../../../../../../Model/api/local.dart';
import '../materialsform/materials_form.dart';
import '../materialsviewdetails/materials_view_details_main.dart';


class MaterialsDataView extends StatelessWidget {
  const MaterialsDataView({super.key});

  @override
  Widget build(BuildContext context) {
     void navigateToMaterialsViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>MaterialsViewDetailsMain(id: id)),
      );
    }
    return DataView(
      dateOrNot: false,mapOrNot: false,
      fixFistColumnLength: 2,
      fixMiddleColumnLength: 1,
      fixLastColumnLength: 3,
      firstColumnMainName: "co_material_name",
      firstColumnsubName: "HSN_code",
      firstColumnSecondSubName:"material_variant" ,
      middleColumMainName: "material_variant",
      middleColumnSubName:"material_variant" ,
      middleColumnSecondSubName: "material_variant",
      lastColumMainName: "CGST",
      lastColumnSubName: "SGST",
      lastColumnSecondSubName:"IGST" ,
      id:"co_material_id" ,
      uri:ApiEndpoints.getAllMaterials,
        image: materialsEmptyDataImage,
        header: const EmptyViewHeaderBar(
          image: materials,
          onpress: MaterialForm(),
          text: titlematerials,
        ),
        navigatePage: navigateToMaterialsViewDetails,
        doubleStar: estar,
        dataTableNameOne: material,
        dataTableNameTwo: variant,
        deletext: deleteMaterials,
        onpress: MaterialsDeleteTable(),
        );
  }
}

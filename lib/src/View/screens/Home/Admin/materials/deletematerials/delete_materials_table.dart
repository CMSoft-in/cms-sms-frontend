import 'package:cmssms/src/Model/api/api_model.dart';

import '../../../../../../Model/Const/image_const.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/delete_data_view.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_header.dart';
import '../materials_text.dart';
import 'delete_materials_form_view.dart';




class MaterialsDeleteTable extends StatelessWidget {
  const MaterialsDeleteTable({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToMaterialsViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MaterialsFormDeleteView(id: id)),
      );
    }

    return Container(
      color: white,
      child: DeleteDataView(
        mapOrNot: false,
        dateOrNot: false,
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
      uri:ApiEndpoints.getAllDeletedMaterials,
        doubleStar: doublestar,
        image: materialsEmptyDataImage,
        navigatePage: navigateToMaterialsViewDetails,
        header: const DeleteHeader(
          image: materials,
          deleteText: deleteMaterialsText,
        ),
        dataTableNameOne: material,
        dataTableNameTwo: variant,
       dataTableNameThree: variant,
       
      ),
    );
  }
}

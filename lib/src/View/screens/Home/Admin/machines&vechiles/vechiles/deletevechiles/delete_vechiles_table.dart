import '../../../../../../../Model/Const/image_const.dart';
import '../../../../../../../Model/api/api_model.dart';
import '../../../../../../widgets/CommonUsageForm/DataViewHeaderItem/delete_data_view.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../widgets/CommonUsageForm/Delete/delete_header.dart';
import '../../m_v_text.dart';
import 'delete_vechiles_form_view.dart';




class VechilesDeleteTable extends StatelessWidget {
  const VechilesDeleteTable({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToVechilesViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VechilesFormDeleteView(id: id)),
      );
    }

    return Container(
      color: white,
      child: DeleteDataView(
        dateOrNot: true,mapOrNot: false,
         fixFistColumnLength: 2,
      fixMiddleColumnLength: 1,
      fixLastColumnLength: 2,
       firstColumnMainName: "co_vehicle_reg_no",
      firstColumnsubName: "co_vehicle_company_name",
      firstColumnSecondSubName:"co_vehicle_model" ,
      middleColumMainName: "co_vehicle_model",
      middleColumnSubName: "co_vehicle_model",
      middleColumnSecondSubName:"co_vehicle_model" ,
      lastColumMainName: "co_vehicle_insurance_exp_date",
      lastColumnSubName: "created_by",
      lastColumnSecondSubName: "co_vehicle_registration_certificate",
      id: "co_vehicle_id",
      uri:ApiEndpoints.getAllDeletedVehicles,
        doubleStar: doublestar,
        image:  VechilesEmptyDataImage,
        navigatePage: navigateToVechilesViewDetails,
        header: const DeleteHeader(
          image: vechicle,
          deleteText: deleteVechilesText,
        ),
        dataTableNameOne: machineDataTableName,
        dataTableNameTwo: machineDataTableCompanyName,
        dataTableNameThree: machineDataTableCompanyName,
       
      ),
    );
  }
}

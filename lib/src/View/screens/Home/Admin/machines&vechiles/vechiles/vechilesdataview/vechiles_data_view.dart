import 'package:cmssms/src/Model/api/api_model.dart';

import '../../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart';
import '../deletevechiles/delete_vechiles_table.dart';
import '/src/Model/Const/text_const.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/m_v_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Model/Const/color.dart';
import '../../../../../../../Model/Const/image_const.dart';
import '../../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../../../../../../../Model/api/local.dart';
import '../vechilesform/vechiles_form_one.dart';
import '../vechilesviewdetails/vechiles_view_details_main.dart';

class VechilesDataView extends StatelessWidget {
  const VechilesDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void navigateToClientViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VechilesViewDetailsMain(id: id)),
      );
    }

    var dataViewContainer = DataView(
      dateOrNot: true,
      mapOrNot: false,
      fixFistColumnLength: 2,
      fixMiddleColumnLength: 1,
      fixLastColumnLength: 2,
      firstColumnMainName: "co_vehicle_reg_no",
      firstColumnsubName: "co_vehicle_company_name",
      firstColumnSecondSubName: "co_vehicle_model",
      middleColumMainName: "co_vehicle_model",
      middleColumnSubName: "co_vehicle_model",
      middleColumnSecondSubName: "co_vehicle_model",
      lastColumMainName:
          // "co_vehicle_model",
          "co_vehicle_insurance_exp_date",
      lastColumnSubName: "created_by",
      lastColumnSecondSubName: "co_vehicle_registration_certificate",
      id: "co_vehicle_id",
      uri: ApiEndpoints.getAllVehicles,
      image: VechilesEmptyDataImage,
      header: const EmptyViewHeaderBar(
        image: vechicle,
        onpress: VechilesFormPageOne(),
        text: titleVechicles,
      ),
      navigatePage: navigateToClientViewDetails,
      doubleStar: estar,
      dataTableNameOne: machineDataTableName,
      dataTableNameTwo: machineDataTableCompanyName,
      deletext: deleteVechiles,
      onpress: const VechilesDeleteTable(),
    );
    return Container(color: white, child: dataViewContainer);
  }
}

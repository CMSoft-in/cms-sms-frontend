
import '../../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart';
import '../deletemachines/delete_machines_table.dart';
import '/src/Model/Const/text_const.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/m_v_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../Model/Const/color.dart';
import '../../../../../../../Model/Const/image_const.dart';
import '../../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../../../../../../../Model/api/local.dart';
import '../machinesviewdetails/machines_view_details_main.dart';
import '../machinesform/machines_form_one.dart';


class MachinesDataView extends StatelessWidget {
  const MachinesDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void navigateToClientViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MachinesViewDetailsMain(id: id)),
      );
    }
    var dataViewContainer = DataView(
      dateOrNot: true,mapOrNot: false,
      fixFistColumnLength: 2,
      fixMiddleColumnLength: 1,
      fixLastColumnLength:2,
      firstColumnMainName: "co_machine_no",
      firstColumnsubName: "co_machine_company_name",
      firstColumnSecondSubName: "co_machine_model",
      middleColumMainName:"co_machine_model" ,
      middleColumnSubName: "co_machine_model",
      middleColumnSecondSubName: "co_machine_model",
      lastColumMainName: "co_machine_insurance_exp_date",
      lastColumnSubName:"created_by" ,
      lastColumnSecondSubName:"co_machine_next_fitness_certificate_date" ,
      id: "co_machine_id",
      uri:"$ip/Admin/all-machines",
        image: machinesEmptyDataImage,
        header: const EmptyViewHeaderBar(
          image: machines,
          onpress: MachinesFormPageOne(),
          text: titleMachines,
        ),
        navigatePage: navigateToClientViewDetails,
        doubleStar: estar,
        dataTableNameOne: machineDataTableName,
        dataTableNameTwo: machineDataTableCompanyName,
        deletext: deleteMachines,
        onpress: MachinesDeleteTable(),
      );
    return Container(color: white, child: dataViewContainer);
  }
}

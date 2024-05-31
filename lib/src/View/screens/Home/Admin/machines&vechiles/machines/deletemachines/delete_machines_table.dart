import '../../../../../../../Model/Const/image_const.dart';
import '../../../../../../../Model/api/api_model.dart';
import '../../../../../../widgets/CommonUsageForm/DataViewHeaderItem/delete_data_view.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../widgets/CommonUsageForm/Delete/delete_header.dart';
import '../../m_v_text.dart';
import 'delete_machines_form_view.dart';




class MachinesDeleteTable extends StatelessWidget {
  const MachinesDeleteTable({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToMachinesViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MachinesFormDeleteView(id: id)),
      );
    }

    return Container(
      color: white,
      child: DeleteDataView(
        
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
      uri:ApiEndpoints.getAllDeletedMachines,
        doubleStar: doublestar,
        image: machinesEmptyDataImage,
       
        navigatePage: navigateToMachinesViewDetails,
        header: const DeleteHeader(
          image: machines,
          deleteText: deleteMachinesText,
        ),
        dataTableNameOne: machineDataTableName,
        dataTableNameTwo: machineDataTableCompanyName,
       
      ),
    );
  }
}

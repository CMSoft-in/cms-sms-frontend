import '../../../../../../Model/Const/image_const.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/delete_data_view.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_header.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/utility/client/client_text_const.dart';
import 'package:flutter/material.dart';
import 'delete_client_form_view.dart';

class ClientDeleteTable extends StatelessWidget {
  const ClientDeleteTable({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToClientViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClientFormDeleteView(id: id)),
      );
    }

    return Container(
      color: white,
      child: DeleteDataView(
         fixFistColumnLength: 2,mapOrNot: false,
     fixMiddleColumnLength: 1,
     fixLastColumnLength: 1,
     firstColumnMainName: 'co_client_name',
     firstColumnsubName: 'owner_first_name',
     firstColumnSecondSubName: "owner_first_name",
     lastColumMainName:'primary_contact_no' ,
     lastColumnSubName: "owner_first_name",
     lastColumnSecondSubName:"owner_first_name" ,
     middleColumMainName: "owner_first_name",
     middleColumnSubName: "owner_first_name",
     middleColumnSecondSubName: "owner_first_name",
        doubleStar: doublestar,
        image:clientEmptyDataImage ,
        id: "co_client_id",
        navigatePage: navigateToClientViewDetails,
        header: const DeleteHeader(
          image: clients,
          deleteText: deleteClientText,
        ),
       dateOrNot: false,
        dataTableNameOne: clientDataTableName,
        dataTableNameTwo: clientDataTablePrimaryNumber,
        uri: "$ip/Admin/deleted-clients",
      )
    );
  }
}

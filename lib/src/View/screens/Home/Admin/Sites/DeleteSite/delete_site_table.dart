import '../../../../../../Model/Const/image_const.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/delete_data_view.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_header.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import 'delete_site_form_view.dart';

class SiteDeleteTable extends StatelessWidget {
  const SiteDeleteTable({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToSiteViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SiteFormDeleteView(id: id)),
      );
    }

    return Container(
      color: white,
      child: DeleteDataView(dateOrNot: false,mapOrNot: false,
         fixFistColumnLength: 2,
      fixMiddleColumnLength: 1,
      fixLastColumnLength: 2,
      firstColumnMainName: "co_site_name",
      firstColumnsubName: "project_work_name",
      firstColumnSecondSubName: "project_work_name",
      middleColumMainName:"project_work_name" ,
      middleColumnSubName: "project_work_name",
      middleColumnSecondSubName: "project_work_name",
      lastColumMainName:"primary_contact_name" ,
      lastColumnSubName:  "primary_contact_no",
      lastColumnSecondSubName:  "primary_contact_no",
        doubleStar: doublestar,
        image:  siteEmptyDataImage,
        // CircularProgressIndicator(),
        id: 'co_site_id',
        navigatePage: navigateToSiteViewDetails,
        header: const DeleteHeader(
          image: sites,
          deleteText: deleteSiteText,
        ),
        dataTableNameOne: siteDataTableName,
        dataTableNameTwo: siteDataTableProjectName,
        uri: "$ip/Admin/Alldeleted-site",
       
      ),

      // child: ClientDataView(id: 'co_client_id',)
    );
  }
}

import '../../../../../../Model/api/api_model.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart';
import '../SiteViewDetails/site_view_details_main copy.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/image_const.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../DeleteSite/delete_site_table.dart';
import '../SiteFormPage/site_form_one.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';

class SiteDataView extends StatelessWidget {
  const SiteDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void navigateToSiteViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SiteViewDetailsMain(id: id)),
      );
    }

    var dataViewContainer = DataView(
      fixFistColumnLength: 2,
      fixMiddleColumnLength: 1,
      mapOrNot: false,
      fixLastColumnLength: 2,
      firstColumnMainName: "co_site_name",
      firstColumnsubName: "project_work_name",
      firstColumnSecondSubName: "project_work_name",
      middleColumMainName: "project_work_name",
      middleColumnSubName: "project_work_name",
      middleColumnSecondSubName: "project_work_name",
      lastColumMainName: "primary_contact_name",
      lastColumnSubName: "primary_contact_no",
      lastColumnSecondSubName: "primary_contact_no",
      dateOrNot: false,
      header: const EmptyViewHeaderBar(
        image: sites,
        onpress: SiteFormPageOne(),
        text: titlesites,
      ),
      image: siteEmptyDataImage,
      navigatePage: navigateToSiteViewDetails,
      doubleStar: estar,
      uri: ApiEndpoints.getAllSites,
      id: 'co_site_id',
      dataTableNameOne: siteDataTableName,
      dataTableNameTwo: siteDataTableProjectName,
      deletext: deleteSiteText,
      onpress: const SiteDeleteTable(),
    );

    return Container(color: white, child: dataViewContainer);
  }
}

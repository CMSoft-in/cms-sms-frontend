import 'package:cmssms/src/Model/api/api_model.dart';

import '../../../../../../Model/Const/image_const.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/delete_data_view.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_header.dart';
import '../companyuser_text.dart';
import 'delete_company_user_form_view.dart';


class CompanyUserDeleteTable extends StatelessWidget {
  const CompanyUserDeleteTable({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToCompanyUserViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CompanyUserFormDeleteView(id: id)),
      );
    }

    return Container(
      color: white,
      child: DeleteDataView(
        dateOrNot: false,mapOrNot: false,
        fixFistColumnLength: 1,
      fixMiddleColumnLength: 1,
      fixLastColumnLength: 1,
      firstColumnMainName:"first_name" ,
      firstColumnsubName: "first_name",
      firstColumnSecondSubName:"first_name" ,
      middleColumMainName:"first_name" ,
      middleColumnSubName:"co_app_role_id" ,
      middleColumnSecondSubName:"co_app_role_id" ,
      lastColumMainName:"first_name" ,
      lastColumnSubName:"co_designation_id" ,
      lastColumnSecondSubName:"co_designation_id" ,
      id:  "co_userid" ,
      uri:  ApiEndpoints.getAllDeletedCoUsers,
        doubleStar: doublestar,
        image: companyUserEmptyDataImage,
        navigatePage: navigateToCompanyUserViewDetails,
        header: const DeleteHeader(
          image: companyUsers,
          deleteText: deleteCompanyUserText,
        ),
        dataTableNameOne: companyUserDataTableName,
        dataTableNameTwo: companyUserDataTablePrimaryNumber,
      
      ),
    );
  }
}

import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart';
import '../deletecompanyuser/delete_company_user_table.dart';
import '/src/View/screens/Home/Admin/companyuser/companyuserviewdetails/compny_user_view_details_main.dart';
import '/src/View/screens/Home/Admin/companyuser/companyuserform/company_user_form_one.dart';
import '../companyuser_text.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/image_const.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';

class CompanyUserDataView extends StatelessWidget {
  const CompanyUserDataView({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    void navigateTComapnyUserViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CompanyUserViewDetailsMain(id: id)),
      );
    }
    var dataViewContainer = DataView(
      deletext: deleteCompanyUsers,
      onpress: CompanyUserDeleteTable(),
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
      uri: "$ip/Admin/all-cousers",
        image: companyUserEmptyDataImage,
        header: const EmptyViewHeaderBar(
          image: companyUsers,
          onpress: ComapnyUserFormPageOne(),
          text: titlecompanyUsers,
        ),
        navigatePage: navigateTComapnyUserViewDetails,
        doubleStar: estar,
        dataTableNameOne: companyUserDataTableName,
        dataTableNameTwo: companyUserDataTablePrimaryNumber,
       );
    return Container(color: white, child: dataViewContainer);
  }
}

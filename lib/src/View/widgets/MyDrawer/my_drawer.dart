import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteDataView/site_data_view_main.dart';
import 'package:cmssms/src/View/screens/Home/Admin/companyuser/companyuserdataview/company_user_data_view.dart';
import 'package:cmssms/src/View/screens/Home/Admin/laborcategory/laborcategorydataview/labor_category_data_view.dart';
import 'package:cmssms/src/View/screens/Home/Admin/machines&vechiles/machines/machinesdataview/machines_data_view.dart';
import 'package:cmssms/src/View/screens/Home/Admin/materials/materialsdataview/materials_data_view.dart';
import 'package:cmssms/src/View/screens/Home/Admin/supplierscategory/suppliercategorydataview/supplier_category_data_view.dart';
import 'package:cmssms/src/View/screens/Home/Admin/workcategory/workcategorydataview/work_category_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Model/Const/color.dart';
import '../../../Model/Const/height_width.dart';
import '../../../Model/Const/image_const.dart';
import '../../../Model/Const/text_const.dart';
import '../../screens/Home/Admin/AdminScreen/admin_landing_page.dart';
import '../../screens/Home/Admin/Clients/ClientDataView/client_data_view_main.dart';
import '../../screens/Home/Admin/labor/labordataview/labor_data_view.dart';
import '../../screens/Home/Admin/laborOutturn/laboroutturndataview/labor_outturn_data_view.dart';
import '../../screens/Home/Admin/machines&vechiles/m&vcommonusepages/m_v_first_page.dart';
import '../../screens/Home/Admin/suppliers/suppliersdataview/supplier_data_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, required BuildContext context}) : super(key: key);
  


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: white,
      child: ListView(
        children: [
          SizedBox(
              height: drawerHeight,
              child: DrawerHeader(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminlandingPage()),
                    );
                  },
                  child: Image.asset(
                    titleImage,
                    height: drawerHeight,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          buildListTile(titleclients, clients,
          ClientDataView(),context),
          buildListTile(
            titlesites,
            sites,
            SiteDataView(),context
          ),
          buildListTile(
            titlelabors,
            labors,
            LaborDataView(),context
          ),
          buildListTile(
            titlesuppliers,
            suppliers,
            SupplierDataView(),context
          ),
          buildListTile(
            titlecompanyUsers,
            companyUsers,
            CompanyUserDataView(),context
          ),
          buildListTile(
            titlematerials,
            materials,
            MaterialsDataView()
            ,context
          ),
          buildListTile(
            titlelaborCategory,
            laborCategory,
            LaborCategoryDataView(),context
          ),
          buildListTile(
            titleworkCategory,
            workCategory,
            WorkCategoryDataView(),context
          ),
          buildListTile(
            titlesupplierCategory,
            supplierCategory,
            SupplierCategoryDataView(),context
          ),
          buildListTile(
            titlemachines,
            machines,MachinesAndVechiles(),context
          ),
          buildListTile(
            titlelaborOutturn,
            laborOutturn,
            context,
            const LaborOutturnDataView()
          ),
           buildListTile(
            titleLabel,
            laborOutturn,
            context,
            const MachinesDataView()
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
    String name,
    listImage,
    onPressed, context
  ) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(
            fontSize: fontSize16, fontFamily: fontFamily, color: black),
      ),
      leading: SvgPicture.asset(
        listImage, width: 20,
        height: 20,
      ),
      onTap: () {
       Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) =>onPressed ));
      },
    );
  }
}

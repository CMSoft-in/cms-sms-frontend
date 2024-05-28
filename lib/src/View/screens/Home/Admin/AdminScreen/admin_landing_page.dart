import '../machines&vechiles/m&vcommonusepages/m_v_first_page.dart';
import '/src/View/screens/Home/Admin/Clients/ClientDataView/client_data_view_main.dart';
import '/src/View/screens/Home/Admin/companyuser/companyuserdataview/company_user_data_view.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/vechiles/vechilesdataview/vechiles_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../Model/api/local.dart';
import '../Sites/SiteDataView/site_data_view_main.dart';
import '../../../../../Model/Const/color.dart';
import '../../../../../Model/Const/height_width.dart';
import '../../../../../Model/Const/image_const.dart';
import '../../../../../Model/Const/text_const.dart';
import '../labor/labordataview/labor_data_view.dart';
import '../laborcategory/laborcategorydataview/labor_category_data_view.dart';
import '../materials/materialsdataview/materials_data_view.dart';
import '../suppliers/suppliersdataview/supplier_data_view.dart';
import '../supplierscategory/suppliercategorydataview/supplier_category_data_view.dart';
import '../workcategory/workcategorydataview/work_category_data_view.dart';
import 'AdminElevatedButton.dart';
import '../../../../widgets/AppBar/AppBar.dart';
import '../../../../widgets/BottomLogo/bottomLogo.dart';

class AdminlandingPage extends StatefulWidget {
  const AdminlandingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminlandingPage> createState() => _AdminlandingPageState();
}

class _AdminlandingPageState extends State<AdminlandingPage> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: Container(
        color: white,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              bgAdminImage,
              color: bgAdminImagecolor,
            ),
          ),
          const SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  adminSizeboxHeight,
                  BuildElevatedButton(
                    icon: clients,
                    label: titleclients,
                    onPressed: ClientDataView(),
                  ),
                  adminSizeboxHeight,
                  BuildElevatedButton(
                    icon: sites,
                    label: titlesites,
                    onPressed: SiteDataView(),
                  ),
                  adminSizeboxHeight,
                  BuildElevatedButton(
                    icon: labors,
                    label: titlelabors,
                    onPressed: LaborDataView(),
                  ),
                  adminSizeboxHeight,
                  BuildElevatedButton(
                    icon: suppliers,
                    label: titlesuppliers,
                    onPressed: SupplierDataView(),
                  ),
                  adminSizeboxHeight,
                  BuildElevatedButton(
                    icon: companyUsers,
                    label: titlecompanyUsers,
                    onPressed: CompanyUserDataView(),
                  ),
                  adminSizeboxHeight,
                  BuildElevatedButton(
                    icon: materials,
                    label: titlematerials,
                    onPressed: MaterialsDataView(),
                  ),
                  adminSizeboxHeight,
                  BuildElevatedButton(
                    icon: laborCategory,
                    label: titlelaborCategory,
                    onPressed: LaborCategoryDataView(),
                  ),
                  adminSizeboxHeight,
                  BuildElevatedButton(
                    icon: workCategory,
                    label: titleworkCategory,
                    onPressed: WorkCategoryDataView(),
                  ),
                  adminSizeboxHeight,
                  BuildElevatedButton(
                    icon: supplierCategory,
                    label: titlesupplierCategory,
                    onPressed: SupplierCategoryDataView(),
                  ),
                  adminSizeboxHeight,
                  BuildElevatedButton(
                    icon: vechicle,
                    label: titlemachines,
                    onPressed: MachinesAndVechiles(),
                  ),
                  adminSizeboxHeight,
                  BuildElevatedButton(
                    icon: laborOutturn,
                    label: titlelaborOutturn,
                    onPressed: VechilesDataView(),
                  ),
                  adminSizeboxHeight,
                  BottomLogo(),
                  adminSizeboxHeight,
                ],
              ),
            ),
          ),
        ]),
      ),
      // bottomSheet: BottomSheetLogo(),
    );
  }
}

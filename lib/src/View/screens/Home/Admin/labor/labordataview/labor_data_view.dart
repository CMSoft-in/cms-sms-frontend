// import 'package:cmssms/src/Model/api/api_model.dart';

// import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart';
// import '../deletelabor/delete_labor_table.dart';
// import '/src/Model/Const/color.dart';
// import '/src/View/screens/Home/Admin/labor/laborform/labor_form_one.dart';
// import '/src/Model/Const/image_const.dart';
// import '/src/Model/Const/text_const.dart';
// import 'package:flutter/material.dart';
// import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';
// import '../../laborcategory/labor_category_text.dart';
// import '../labor_text_const.dart';
// import '../laborviewdetails/labor_view_details_main.dart';

// class LaborDataView extends StatelessWidget {
//   const LaborDataView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     void navigateToLaborViewDetails(String id) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => LaborViewDetailsMain(id: id)),
//       );
//     }
//     var dataViewContainer = DataView(
//       dateOrNot: false,mapOrNot: false,
//       deletext: deletelabor,
//       onpress: LaborDeleteTable(),
//       fixFistColumnLength: 1,
//       fixMiddleColumnLength: 1,
//       fixLastColumnLength: 1,
//       firstColumnMainName:"first_name" ,
//       firstColumnsubName:"first_name" ,
//       firstColumnSecondSubName:"first_name" ,
//       middleColumMainName:"co_labour_category_id" ,
//       middleColumnSubName:"co_labour_category_id" ,
//       middleColumnSecondSubName: "co_labour_category_id",
//       lastColumMainName:"co_current_sites_allocation" ,
//       lastColumnSubName: "co_current_sites_allocation",
//       lastColumnSecondSubName:"co_current_sites_allocation" ,
//       id: "co_labour_id",
//       uri: ApiEndpoints.getAllLabours,
//         image: laborEmptyDataImage,
//         header: const EmptyViewHeaderBar(
//           image: labors,
//           onpress: LaborFormPageOne(),
//           text: titlelabors,
//         ),
//         navigatePage: navigateToLaborViewDetails,
//         doubleStar: estar,
//         dataTableNameOne: laborName,
//         dataTableNameTwo: laborCategoryText,
//         );
//     return Container(color: white, child: dataViewContainer);
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/padding_const.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_image.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_header.dart';
import '../../../../../widgets/MyDrawer/my_drawer.dart';
import '../../laborcategory/deletelaborcategory/delete_labor_category_table.dart';
import '../../laborcategory/labor_category_text.dart';

import 'package:flutter/material.dart';
import '../../../../../../Model/Const/image_const.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../../../../../../Model/api/local.dart';
import '../laborform/labor_form_one.dart';
import '../laborviewdetails/labor_view_details_main.dart';

class LaborDataView extends StatefulWidget {
  const LaborDataView({super.key});

  @override
  State<LaborDataView> createState() => _LaborDataViewState();
}

class _LaborDataViewState extends State<LaborDataView> {
  var allLabourdata = [];
  var allLabourCategoriesdata = [];
  var allSitesdata = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAllLabourCategories();
    getAllSites();
    getAllLabour();
  }

  String getLabourCategoryName(int labourCategoryid) {
    String name = "";
    for (var element in allLabourCategoriesdata) {
      if (element["co_labour_category_id"] == labourCategoryid) {
        name = element["co_labour_category_name"];
      }
    }
    return name == "" ? "Not Available" : name;
  }

  String getSiteName(int id) {
    var usdKey = allSitesdata.firstWhere(
      (category) => category["co_site_id"] == id,
      orElse: () => {},
    );

    if (usdKey.isNotEmpty) {
      return usdKey["co_site_name"];
    }
    return "Not Available";
  }

  Future<void> getAllLabourCategories() async {
    String uri = ApiEndpoints.getAllLabourCategories;
    try {
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        setState(() {
          allLabourCategoriesdata = body["data"];
          
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });

      print('Error fetching data: $error');
    }
  }

  Future<void> getAllLabour() async {
    String uri = ApiEndpoints.getAllLabours;
    try {
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        setState(() {
          allLabourdata = body;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });

      print('Error fetching data: $error');
    }
  }

  Future<void> getAllSites() async {
    String uri = ApiEndpoints.getAllSites;
    try {
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        setState(() {
          allSitesdata = body;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });

      print('Error fetching datasaasjsa: $error');
    }
  }

  
  navigateToLaborViewDetails(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LaborViewDetailsMain(id: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      drawer: MyDrawer(context: context),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const EmptyViewHeaderBar(
              image: labors,
              onpress: LaborFormPageOne(),
              text: titlelabors,
            ),
            allLabourdata.isEmpty
                ? Center(
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Center(
                            child: EmptyDataImage(image: laborEmptyDataImage)),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const DataHeader(
                          titlename: titlelabors,
                          dataTableNameTwo: titlelaborCategory,
                          // dataTableNameThree:titlesites,
                        ),
                        ...allLabourdata.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: left10,
                                      child: Text(
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(),
                                          "${item["first_name"]}"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                        textAlign: TextAlign.left,
                                        getLabourCategoryName(
                                            item["co_labour_category_id"])),
                                  ),
                                  Expanded(
                                    child: Text(
                                        textAlign: TextAlign.left,
                                        getSiteName(item[
                                            "co_current_sites_allocation"])),
                                  )
                                ],
                              ),
                              onTap: () {
                                navigateToLaborViewDetails(
                                  item["co_labour_id"].toString(),
                                );
                              },
                            ),
                          );
                        })
                      ],
                    ),
                  ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: black,
                minimumSize: const Size(deleteButtonWidth, deleteprintHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LaborCategoryDeleteTable())),
              child: const Text(deletelaborCategory, style: textStyleWhite18),
            ),
            Padding(
              padding: left10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: formButtonColor,
                  minimumSize: const Size(printButtonWidth, deleteprintHeight),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {},
                child: const Text('Print', style: textStyleWhite18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

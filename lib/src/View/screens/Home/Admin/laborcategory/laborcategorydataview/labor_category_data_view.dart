import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/padding_const.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_image.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_header.dart';
import '../../../../../widgets/MyDrawer/my_drawer.dart';
import '../deletelaborcategory/delete_labor_category_table.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/image_const.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../../../../../../Model/api/local.dart';
import '../labor_category_text.dart';
import '../laborcategoryform/labor_category_form.dart';
import '../laborcategoryviewdetails/labor_category_main_view.dart';

class LaborCategoryDataView extends StatefulWidget {
  const LaborCategoryDataView({super.key});

  @override
  State<LaborCategoryDataView> createState() => _LaborCategoryDataViewState();
}

class _LaborCategoryDataViewState extends State<LaborCategoryDataView> {
  var data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String uri = "$ip/Admin/all-labourcategories";
    try {
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        print(body);
        setState(() {
          data = body["data"];
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

  void navigateToLaborCategoryViewDetails(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LaborCategoryViewDetailsMain(context: context, id: id)),
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
              image: laborCategory,
              onpress: LaborCategoryForm(),
              text: titlelaborCategory,
            ),
            data.isEmpty
                ? Center(
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Center(
                            child: EmptyDataImage(
                                image: laborCategoryEmptyDataImage)),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const DataHeader(
                          titlename: laborCategoryText,
                          dataTableNameTwo: categorydistribution,
                        ),
                        ...data.map((item) {
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
                                          "${item["co_labour_category_name"]}"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                        textAlign: TextAlign.left,
                                        "${item["co_labour_category_desc"]}"),
                                  ),
                                  Expanded(
                                    child: Text(
                                        textAlign: TextAlign.left,
                                        "${item["co_labour_category_name"]}"),
                                  )
                                ],
                              ),
                              onTap: () {
                                navigateToLaborCategoryViewDetails(
                                item["co_labour_category_id"].toString(),
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



// DataView(
//       dateOrNot: false,
    //   mapOrNot: false,
    //   fixFistColumnLength: 1,
    //   fixMiddleColumnLength: 1,
    //   fixLastColumnLength: 1,
    //   firstColumnMainName: "co_labour_category_name",
    //   firstColumnsubName: "co_labour_category_name",
    //   firstColumnSecondSubName: "co_labour_category_name",
    //   middleColumMainName: "co_labour_category_name",
    //   middleColumnSubName: "co_labour_category_name",
    //   middleColumnSecondSubName: "co_labour_category_name",
    //   lastColumMainName: "created_by",
    //   lastColumnSubName: "created_by",
    //   lastColumnSecondSubName: "created_by",
    //   id: "co_labour_category_id",
    //   uri: "$ip/Admin/getAll-labourcategory",
    //   image: laborCategoryEmptyDataImage,
    //   header: const EmptyViewHeaderBar(
    //     image: laborCategory,
    //     onpress: LaborCategoryForm(),
    //     text: titlelaborCategory,
    //   ),
    //   navigatePage: navigateToLaborCategoryViewDetails,
    //   doubleStar: estar,
    //   dataTableNameOne: laborCategoryText,
    //   dataTableNameTwo: categorydistribution,
    //   deletext: deletelaborCategory,
    //   onpress: const LaborCategoryDeleteTable(),
    // );
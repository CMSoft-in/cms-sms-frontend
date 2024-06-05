import 'dart:convert';

import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/image_const.dart';
import '../../../../../../Model/Const/padding_const.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_image.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/CommonUsageForm/DataViewHeaderItem/data_header.dart';
import '../../../../../widgets/MyDrawer/my_drawer.dart';
import '../laborcategoryform/labor_category_form.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/api/local.dart';
import '../../laborcategory/labor_category_text.dart';
import 'package:http/http.dart' as http;

import 'delete_labor_category_form_view.dart';
class LaborCategoryDeleteTable extends StatefulWidget {
  const LaborCategoryDeleteTable({super.key});

  @override
  State<LaborCategoryDeleteTable> createState() => _LaborCategoryDeleteTableState();
}

class _LaborCategoryDeleteTableState extends State<LaborCategoryDeleteTable> {
     var data = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String uri = ApiEndpoints.getAllDeletedLabourCategories;
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
          data = body;
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
      bottomSheet:
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: formButtonColor,
              minimumSize: const Size(primaryWidth, deleteprintHeight),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {},
            child: const Text('Print', style: textStyleWhite18),
          ),
      
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}
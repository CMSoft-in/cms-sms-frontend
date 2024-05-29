// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:cmssms/src/View/screens/Home/Admin/laborcategory/labor_category_text.dart';

import '../../../../../../Model/api/api_model.dart';
import '/src/View/screens/Home/Admin/laborcategory/laborcategoryviewdetails/labor_category_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../controler/ClientController/client_controller.dart';
import '../../../../../../controler/common_controller.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/Long_SizeButton.dart';
import '../../../../../widgets/CommonUsageForm/AlartBox/alart_popup.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_data_item.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_header.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../../../../widgets/CommonUsageForm/view_details_text.dart';
import '../laborcategorydataview/labor_category_data_view.dart';

class LaborCategoryViewDetailsMain extends StatefulWidget {
  const LaborCategoryViewDetailsMain(
      {Key? key, required this.context, required this.id})
      : super(key: key);

  final context;
  final String id;

  @override
  State<LaborCategoryViewDetailsMain> createState() =>
      _LaborCategoryViewDetailsMain();
}

class _LaborCategoryViewDetailsMain
    extends State<LaborCategoryViewDetailsMain> {
  CommonController commonController = CommonController();
  Map<String, dynamic>? data;
  bool isEditing = false;
  bool isEnabled = false;
  bool isLoading = true;
  var updatedData;
  final TextEditingController laborCategoryController = TextEditingController();
  final TextEditingController categorydistributionController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
    // fetchUpdateData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("$ip/Admin/labourcategory/${widget.id}"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body)["data"];
          if (data != null) {
            laborCategoryController.text = data!["co_labour_category_name"];
            categorydistributionController.text =
                data!["co_labour_category_desc"];
            createBy.text = data!["created_by"];
            createOn.text = data!["created_at"];
            isLoading = false;
          }
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  // Future<void> fetchUpdateData() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse("$ip/Admin/updatehistory-client"),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         var updateData = [];
  //         var data = jsonDecode(response.body);
  //         for (var eachData in data) {
  //           if (eachData["co_labour_category_id"].toString() == widget.id) {
  //             updateData.add(eachData);
  //           }
  //         }
  //         updatedData = updateData;
  //       });
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (error) {
  //     print('Error fetching data: $error');
  //   }
  // }

  void updateData(data) async {
    try {
      print("before update");
      var response = await http.patch(
        Uri.parse('${ApiEndpoints.updateLabourCategory}/${widget.id}'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const LaborCategoryDataView()));
      }
    } catch (e) {
      print("update failed $e");
    }
  }

  void checkUpdatingValue() {
    var oldData = data;
    if (oldData != null) {
      Map<String, dynamic> updatedData = {};
      var clientFields = {
        "co_labour_category_name": laborCategoryController.text,
        "co_labour_category_desc": categorydistributionController.text,
      };
      clientFields.forEach((key, value) {
        if (oldData[key] != null && oldData[key] != value && value != "") {
          updatedData[key] = value;
        }
      });
      if (updatedData.isNotEmpty) {
        print("Updated Data: $updatedData");
        updateData(updatedData);
      } else {
        print("No changes detected.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ViewDetailsText(
                viewClientDetailsTextt: isEditing
                    ? editLaborCategoryDetailsText
                    : viewLaborCategoryDetailsText,
                editOnPress: () {
                  setState(() {
                    isEditing = !isEditing;
                    isEnabled = !isEnabled;
                  });
                },
                deleteOnPress: AlartMessage(
                  api: '${ApiEndpoints.deleteLabourCategory}/${widget.id}',
                  onPress: const LaborCategoryDataView(),
                ),
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(children: [
                      LaborCategoryViewDetails(
                          enabled: isEditing,
                          laborCategoryController: laborCategoryController,
                          categorydistributionController:
                              categorydistributionController),
                      CreateByCreatedOn(
                        createByController: createBy,
                        createOnController: createOn,
                        enabled: false,
                      ),
                      formSizebox15,
                      LongButton(
                        formKey: formKey,
                        text: update,
                        onPressed: () {
                          checkUpdatingValue();
                        },
                        isEnabled: isEnabled,
                      ),
                      if (updatedData != null)
                        if (updatedData.length != 0)
                          Column(
                            children: [
                              const UpdateHeader(
                                updatedByHeader: updateByHeaderText,
                                newValueHeader: newvalueHeaderText,
                                oldValueHeader: oldvlueHeaderText,
                              ),
                              ...updatedData.map((eachItem) {
                                return updatedDataItem(
                                  eachItem["updated_old_value"],
                                  eachItem["updated_new_value"],
                                  eachItem["updated_by"].toString(),
                                );
                              }).toList(),
                              bottomHeight,
                            ],
                          ),
                      bottomHeight,
                    ])
            ],
          ),
        ),
      ),
      bottomSheet: const BottomSheetLogo(),
    );
  }
}

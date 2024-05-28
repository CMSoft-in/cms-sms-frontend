// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../controler/ClientController/client_controller.dart';
import '../../../../../../controler/GetDate/get_date.dart';
import '../../../../../../controler/common_controller.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/Long_SizeButton.dart';
import '../../../../../widgets/CommonUsageForm/AlartBox/alart_popup.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_data_item.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_header.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../../../../widgets/CommonUsageForm/view_details_text.dart';
import '../work_category_text.dart';
import '../workcategorydataview/work_category_data_view.dart';
import 'work_category_view.dart';

class WorkCategoryViewDetailsMain extends StatefulWidget {
  const WorkCategoryViewDetailsMain({Key? key, required this.id})
      : super(key: key);
  final id;

  @override
  State<WorkCategoryViewDetailsMain> createState() =>
      _WorkCategoryViewDetailsMain();
}

class _WorkCategoryViewDetailsMain extends State<WorkCategoryViewDetailsMain> {
  Map<String, dynamic>? data;
  var updatedData;
  CommonController commonController = CommonController();

  @override
  void initState() {
    super.initState();
    fetchData();
    // fetchUpdateData();
  }

//get single work Category
  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("$ip/Admin/work-category/${widget.id}"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          print(data);

          if (data != null) {
            workCategoryController.text = data!["co_work_category_name"];
            categorydistributionController.text =
                data!["co_work_category_desc"];
            outturnValueController.text =
                data!["co_work_category_outturn_value"];
            outturnMeasurementController.text =
                data!["co_work_category_outturn_measurement"];
            createBy.text = data!["created_by"] ?? "";
            createOn.text = Date.getDate(data!["createdAt"]) ?? "";
          }
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error["message]');
    }
  }

  // Future<void> fetchUpdateData() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse("$ip/Admin/updatehistory/work-category"),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         var updateData = [];
  //         var data = jsonDecode(response.body);
  //         for (var eachData in data) {
  //           if (eachData["co_client_id"].toString() == widget.id) {
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

  bool isEditing = false;
  bool isEnabled = false;

//Update api
  void updateData(Map<String, dynamic> data) async {
    final url = "$ip/Admin/update-work-category/${widget.id}";
    print('Sending data to $url');
    print('Data: $data');

    try {
      var response = await http.patch(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const WorkCategoryDataView(),
        ));
      } else {
        print('Failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print("Update failed: $e");
    }
  }

  void checkUpdatingValue() {
    var oldData = data;
    print('Old Data: $oldData');
    if (oldData != null) {
      Map<String, dynamic> updatedData = {};
      var fields = {
        "co_work_category_name": workCategoryController.text,
        "co_work_category_desc": categorydistributionController.text,
        "co_work_category_outturn_value": outturnValueController.text,
        "co_work_category_outturn_measurement":
            outturnMeasurementController.text,
      };
      fields.forEach((key, value) {
        if (oldData[key] != null && oldData[key] != value && value != "") {
          updatedData[key] = value;
        }
      });
      if (updatedData.isNotEmpty) {
        print("Update Data: $updatedData");
        updateData(updatedData);
      } else {
        print("No changes detected.");
      }
    } else {
      print('Old data is null');
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
                    ? editWorkCategoryDetailsText
                    : viewWorkCategoryDetailsText,
                editOnPress: () {
                  setState(() {
                    isEditing = !isEditing;
                    isEnabled = !isEnabled;
                  });
                },
                deleteOnPress: AlartMessage(
                  api: "Admin/delete-work-category",
                  id: widget.id,
                  onPress: const WorkCategoryDataView(),
                ),
              ),
              WorkCategoryView(
                  enabled: isEnabled,
                  workCategoryController: workCategoryController,
                  categorydistributionController:
                      categorydistributionController,
                  outturnValueController: outturnValueController,
                  outturnMeasurementController: outturnMeasurementController),
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
            ],
          ),
        ),
      ),
      bottomSheet: const BottomSheetLogo(),
    );
  }
}

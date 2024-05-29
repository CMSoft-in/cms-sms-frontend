// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../controler/ClientController/client_controller.dart';
import '../../../../../../controler/GetDate/get_date.dart';
import '../../../../../../controler/common_controller.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_header.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_item.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../work_category_text.dart';
import '../workcategoryview/work_category_view.dart';

class WorkCategoryFormDeleteView extends StatefulWidget {
  const WorkCategoryFormDeleteView({Key? key, required this.id})
      : super(key: key);
  final id;

  @override
  State<WorkCategoryFormDeleteView> createState() =>
      _WorkCategoryFormDeleteView();
}

class _WorkCategoryFormDeleteView extends State<WorkCategoryFormDeleteView> {
  Map<String, dynamic>? data;
  var updatedData;
  CommonController commonController = CommonController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getWorkCategory}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            var controllers = {
              "co_client_name": control.clientName,
              "off_address_line1": control.addressline1,
            };
            controllers.forEach((key, controller) {
              controller.text = data![key]?.toString() ?? '';
            });
          }
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
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
                 DetailsText(enterDetails: deleteWorkCategoryDetailsText),
              WorkCategoryView(
                  enabled: true,
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
              const deleteTableHeader(
                deleteDate: deleteDate,
                deleteReason: deleteReason,
                deleteperson: deletePerson,
              ),
              DeleteDataItem(
                deletepersonName: 'Admin 1',
                deleteReason: () {
                  if (data == null) {
                    return "";
                  } else {
                    return data!["deletion_reason"];
                  }
                }(),
                deletedDate: () {
                  if (data == null) {
                    return "";
                  } else {
                    return Date.getDate(data!["deleted_At"]);
                  }
                }(),
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

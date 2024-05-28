// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';

import '../../../../../../controler/GetDate/get_date.dart';
import '../supplier_category_text.dart';
import 'supplier_category_view_details.dart';
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
import '../suppliercategorydataview/supplier_category_data_view.dart';

class SupplierCategoryViewDetailsMain extends StatefulWidget {
  const SupplierCategoryViewDetailsMain({Key? key, required this.id})
      : super(key: key);
  final id;

  @override
  State<SupplierCategoryViewDetailsMain> createState() =>
      _SupplierCategoryViewDetailsMain();
}

class _SupplierCategoryViewDetailsMain
    extends State<SupplierCategoryViewDetailsMain> {
  Map<String, dynamic>? data;
  var updatedData;
  CommonController commonController = CommonController();

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchUpdateData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("$ip/Admin/get-supplier-category/${widget.id}"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            var controllers = {
         
    "co_supplier_category_name": supplierCategoryController,
    "co_supplier_category_desc": materialSuppliedController,
    "created_by": createBy,
    "createdAt": createOn,
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

  Future<void> fetchUpdateData() async {
    try {
      final response = await http.get(
        Uri.parse("$ip/Admin/updatehistory-supplier-category"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          var updateData = [];

          var data = jsonDecode(response.body);

          for (var eachData in data) {
            if (eachData["co_supplier_category_id"].toString() == widget.id) {
              updateData.add(eachData);
            }
          }
          updatedData = updateData;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  bool isEditing = false;
  bool isEnabled = false;

  void updateData(data) async {
    try {
      print("before update");

      var response = await http.post(
        Uri.parse("$ip/Admin/update-supplier-category/${widget.id}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SupplierCategoryDataView()));
      }
    } catch (e) {
      print("update failed $e");
    }
  }
void supplierCategoryCheckUpdatingValue() {
  if (data != null) {
    Map<String, dynamic> updatedData = {};

        var controllers = {
           
            };
    controllers.forEach((key, value) {
      if (data![key] != null && data![key].toString() != value && value.isNotEmpty) {
        updatedData[key] = value;
      }
    });

    if (updatedData.isNotEmpty) {
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
                    ? editSupplierCategoryDetailsText
                    : viewSupplierCategoryDetailsText,
                editOnPress: () {
                  setState(() {
                    isEditing = !isEditing;
                    isEnabled = !isEnabled;
                  });
                },
                deleteOnPress: AlartMessage(
                  api:  "/Admin/delete-supplier-category/${widget.id}",
                  id: widget.id,
                  onPress: const SupplierCategoryDataView(),
                ),
              ),
              SupplierCategoryViewDetails(
                  enabled: isEnabled,
                  isEditing: isEditing,
                  supplierCategoryController: supplierCategoryController,
                  materialSuppliedController: materialSuppliedController),
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
                 supplierCategoryCheckUpdatingValue();
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

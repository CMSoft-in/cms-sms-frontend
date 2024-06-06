import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../../Model/api/api_model.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';
import '../../../../../widgets/MyDrawer/s.dart';
import '../supplier_category_text.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/local.dart';
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
  const SupplierCategoryViewDetailsMain({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<SupplierCategoryViewDetailsMain> createState() => _SupplierCategoryViewDetailsMain();
}

class _SupplierCategoryViewDetailsMain extends State<SupplierCategoryViewDetailsMain> {
  List materialdropdownItems1 = [];
  List<int> selectedMaterialCategoryIds = [];
  Map<String, dynamic>? data;
  var updatedData;
  CommonController commonController = CommonController();
  List<int> comaterialCategoryId = [];

  // Initialize TextEditingControllers
  TextEditingController supplierCategoryController = TextEditingController();
  TextEditingController materialSuppliedController = TextEditingController();
  TextEditingController createByController = TextEditingController();
  TextEditingController createOnController = TextEditingController();

  bool isEditing = false;
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    fetchData();
    MaterialfetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getSupplierCategory}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
           
            supplierCategoryController.text = data!["co_supplier_category_name"] ?? '';
           
            if (data!["co_material_id"] != null) {
              List<String> materialNames = [];
              for (var material in data!["co_material_id"]) {
                materialNames.add(material["co_material_name"] ?? '');
              }
              materialSuppliedController.text = materialNames.join(', ');
            }
            createByController.text = data!["created_by"] ?? '';
            createOnController.text = data!["createdAt"] ?? '';
          }
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void changeValue(List<dynamic> v) {
    setState(() {
      comaterialCategoryId = v.cast<int>();
    });
  }

  void updateData(Map<String, dynamic> updatedData) async {
    try {
      print("Before update: $updatedData");

      final response = await http.patch(
        Uri.parse('${ApiEndpoints.updateSupplierCategory}/${widget.id}'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        print("Update successful: ${response.body}");
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SupplierCategoryDataView(),
          ),
        );
      } else {
        print("Update failed: ${response.body}");
      }
    } catch (e) {
      print("Update failed: $e");
    }
  }

  void supplierCategoryCheckUpdatingValue() {
    if (data != null) {
      Map<String, dynamic> updatedData = {};

     
      List<int> currentMaterialIds = [];
      if (data!["co_material_id"] != null) {
        for (var material in data!["co_material_id"]) {
          currentMaterialIds.add(material["co_material_id"] ?? 0); 
        }
      }

      var controllers = {
        'co_supplier_category_name': supplierCategoryController.text,
        'co_material_id': comaterialCategoryId.isEmpty ? currentMaterialIds : comaterialCategoryId,
        'created_by': createByController.text,
        'createdAt': createOnController.text,
      };

      
      String coSupplierCategoryName = controllers['co_supplier_category_name'] as String;
      List<int> coMaterialId = controllers['co_material_id'] as List<int>;

      if (data!["co_supplier_category_name"] != coSupplierCategoryName &&
          coSupplierCategoryName.isNotEmpty) {
        updatedData['co_supplier_category_name'] = coSupplierCategoryName;
      }

      if (currentMaterialIds.join(', ') != coMaterialId.join(', ') &&
          coMaterialId.isNotEmpty) {
        updatedData['co_material_id'] = coMaterialId;
      }
      
      print(updatedData);
      if (updatedData.isNotEmpty) {
        updateData(updatedData);
      } else {
        print("No changes detected.");
      }
    } else {
      print("Data is null.");
    }
  }

  Future<void> MaterialfetchData() async {
    String uri = ApiEndpoints.getAllMaterials;
    try {
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      var body = json.decode(response.body);

      if (response.statusCode == 200) {
        var newList = [];
        body.forEach((each) {
          int id = each["co_material_id"];
          String name = each["co_material_name"];
          newList.add({"id": id, "name": name});
        });
        setState(() {
          materialdropdownItems1 = newList;
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void onMultiSelectChanged(List<dynamic> newIds) {
    setState(() {
      changeValue(newIds.cast<int>());
      selectedMaterialCategoryIds = newIds.cast<int>();
      comaterialCategoryId = selectedMaterialCategoryIds;

      print(comaterialCategoryId);
    });
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
                  api: '${ApiEndpoints.deleteSupplierCategory}/${widget.id}',
                  onPress: const SupplierCategoryDataView(),
                ),
              ),
              TextformField(
                controller: supplierCategoryController,
                text: supplierCategoryText,
                star: star,
                limitLength: 20,
                optionalisEmpty: true,
                inputformat: alphabatsAndNumbers,
                inputtype: keyboardTypeNone,
                enabled: isEnabled,
              ),
              formSizebox10,
              isEditing
                  ? MultiSelectTwoDropDownForm(
                      selectedIds: selectedMaterialCategoryIds,
                      onChanged: onMultiSelectChanged,
                      dropdownItems: materialdropdownItems1,
                      dropDownName: materialSupplied,
                      star: star,
                      optionalisEmpty: true,
                      controller: materialSuppliedController,
                    )
                  : MaxMinTextFormField(
                      maxLines: 4,
                      minLines: 1,
                      controller: materialSuppliedController,
                      text: materialSupplied,
                      star: star,
                      limitLength: 20,
                      optionalisEmpty: true,
                      inputformat: alphabatsAndNumbers,
                      inputtype: keyboardTypeNone,
                      enabled: isEnabled,
                    ),
              CreateByCreatedOn(
                createByController: createByController,
                createOnController: createOnController,
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
              if (updatedData != null && updatedData.length != 0)
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
               ] ),
              ),
           
         
      ),
        bottomSheet: const BottomSheetLogo(),
    );
  }
}

import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/MyDrawer/s.dart';
import '/src/View/screens/Home/Admin/laborcategory/labor_category_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../labor_text_const.dart';

class LaborViewDetailsTwo extends StatefulWidget {
  LaborViewDetailsTwo(
      {Key? key,
      required this.changeValue,
      required this.coLabourCategoryId,
      required this.bloodGroupController,
      required this.laborCategoryController,
      required this.rateModelController,
      required this.laborRateController,
      required this.isEditing,
      required this.enabled})
      : super(key: key);

  int? coLabourCategoryId;
  final Function changeValue;
  final TextEditingController bloodGroupController;
  final TextEditingController laborCategoryController;
  final TextEditingController rateModelController;
  final TextEditingController laborRateController;
  final bool isEditing;
  final bool enabled;

  @override
  State<LaborViewDetailsTwo> createState() => _LaborViewDetailsTwoState();
}

class _LaborViewDetailsTwoState extends State<LaborViewDetailsTwo> {
  List labordropdownItems = [];
  int? selectedLaborCategoryId;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("$ip/Admin/getAll-labourcategory"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body)["data"];
        var newList = [];
        body.forEach((each) {
          int id = each["co_labour_category_id"];
          String name = each["co_labour_category_name"];
          newList.add({"id": id, "name": name});
        });
        setState(() {
          labordropdownItems = newList;
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }


  void onDropdownChanged(newId) {
    setState(() {
       widget.changeValue(newId);
      selectedLaborCategoryId = newId;
      widget.coLabourCategoryId = selectedLaborCategoryId;
    });
  }

  // Future<void> sendSelectedLaborCategoryId() async {
  //   if (selectedLaborCategoryId != null) {
  //     try {
  //       final response = await http.post(
  //         Uri.parse("$ip/Admin/selected-labourcategory"),
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //           'Content-Type': 'application/json',
  //         },
  //         body: json.encode({'co_labour_category_id': selectedLaborCategoryId}),
  //       );
  //       if (response.statusCode == 200) {
  //         print("Data sent successfully");
  //       } else {
  //         print("Failed to send data: ${response.statusCode}");
  //       }
  //     } catch (error) {
  //       print('Error sending data: $error');
  //     }
  //   } else {
  //     print('No labor category selected');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox10,
        TextformField(
          controller: widget.bloodGroupController,
          text: bloodGroup,
          star: estar,
          limitLength: 6,
          optionalisEmpty: false,
          inputformat: bloodGroupp,
          inputtype: keyboardTypeNone,
          enabled: widget.enabled,
        ),
        formSizebox10,
        widget.isEditing
            ? DropDownFormm(
                selectedId: selectedLaborCategoryId,
                onChanged: onDropdownChanged,
                dropdownItems: labordropdownItems,
                dropDownName: laborCategoryText,
                star: star,
                optionalisEmpty: true,
                controller: widget.laborCategoryController,
              )
            : TextformField(
                controller: widget.laborCategoryController,
                text: laborCategoryText,
                limitLength: 40,
                star: star,
                inputformat: alphabats,
                optionalisEmpty: true,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
        formSizebox10,
        widget.isEditing
            ? DropDownForm(
                dropdownItems: const ['Rate150', 'Rate 200'],
                dropDownName: rateModel,
                star: star,
                optionalisEmpty: true,
                controller: widget.rateModelController)
            : TextformField(
                controller: widget.rateModelController,
                text: rateModel,
                limitLength: 20,
                star: star,
                inputformat: alphabats,
                optionalisEmpty: true,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
        formSizebox10,
        TextformField(
          controller: widget.laborRateController,
          text: laborRate,
          star: estar,
          limitLength: 40,
          optionalisEmpty: false,
          inputformat: alphabatsAndNumbers,
          inputtype: keyboardTypeNone,
          enabled: widget.enabled,
        ),
      ],
    );
  }
}
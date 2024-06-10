import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/dropdown/multi_select_drop_down.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/dropdown/sigle_select_drop_down.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_maxLines.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../labor_text_const.dart';
class LaborViewDetailsThree extends StatefulWidget {
  final int? coLabourCategoryId;
  final int? coCurrentSiteAllocationIds;
     final Function(List<String>) changeValue;
   final Function(int?) changeValueOne; // Updated to accept List<int>
  final TextEditingController aadharController;
  final TextEditingController siteWorkedController;
  final TextEditingController currentSiteAllocationController;
  final bool isEditing;
  final bool enabled;

  LaborViewDetailsThree({
    Key? key,
    required this.changeValue,
    required this.coLabourCategoryId,
    required this.aadharController,
    required this.siteWorkedController,
    required this.changeValueOne,
    required this.currentSiteAllocationController,
    required this.isEditing,
    required this.coCurrentSiteAllocationIds,
    required this.enabled,
  }) : super(key: key);

  @override
  State<LaborViewDetailsThree> createState() => _LaborViewDetailsThreeState();
}

class _LaborViewDetailsThreeState extends State<LaborViewDetailsThree> {
  List<Map<String, dynamic>> siteDropdownItems = [];
  List<Map<String, dynamic>> currentSiteDropdownItems1 = [];
  List<String> selectedSiteIds = [];
  int? selectedCurrentSiteIds;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String uri = ApiEndpoints.getAllSites;
    try {
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
         var body = json.decode(response.body) as List;
            final List<dynamic> body1 = json.decode(response.body);
        // List<Map<String, dynamic>> siteList = [];
          var newList = body.map((each) {
          return {
            "id": each["co_site_id"].toString(),
            "name": each["co_site_name"],
          };
        }).toList();
  

        setState(() {
          siteDropdownItems = newList;
       
           currentSiteDropdownItems1 = body1
              .map((each) => {
                    "id": each["co_site_id"],
                    "name": each["co_site_name"]
                  })
              .toList();
        });
      
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
      



void onMultiSelectChanged(List<String> newIds) {
    setState(() {
      selectedSiteIds = newIds;
      widget.changeValue(newIds);
    });
  }
 
//  void onDropdownChangedOneList(List<String> newIds) {
//     setState(() {
//       selectedCurrentSiteIds = newIds;
//       widget.changeValueOne(newIds);
//     });
//   }

  void onDropdownChangedOneList(String selectedId) {
    int? newId = int.tryParse(selectedId);
    setState(() {
      selectedCurrentSiteIds = newId;
      widget.changeValueOne(newId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         formSizebox10,
        TextformField(
          controller: widget.aadharController,
          text: aadharNumber,
          limitLength: 12,
          optionalisEmpty: true,
          inputformat: number,
          star: star,
          inputtype: keyboardTypeNumber,
          enabled: widget.enabled,
        ),
         formSizebox10,
        widget.isEditing
            ? 
              SingleSelectDropDown(
                  selectedId: selectedCurrentSiteIds,
                  onChanged: onDropdownChangedOneList,
                  dropdownItems: currentSiteDropdownItems1,
                  dropDownName: cuurentSiteAllocation,
                  star: star,
                  optionalisEmpty: true,
                  controller: widget.currentSiteAllocationController,
                )
            : TextformField(
                controller: widget.currentSiteAllocationController,
                text: cuurentSiteAllocation,
                limitLength: 40,
                star: star,
                inputformat: alphabats,
                optionalisEmpty: true,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
         formSizebox10,
        widget.isEditing
            ?
              MultiSelectDropDown(
                  selectedIds: selectedSiteIds,
                  onChanged: onMultiSelectChanged,
                  dropdownItems: siteDropdownItems,
                  dropDownName: siteWorked,
                  star: star,
                  optionalisEmpty: true,
                  controller: widget.siteWorkedController,
                )
            : MaxMinTextFormField(
                maxLines: 4,
                minLines: 1,
                controller: widget.siteWorkedController,
                text: siteWorked,
                limitLength: 40,
                star: star,
                inputformat: alphabats,
                optionalisEmpty: true,
                inputtype: keyboardTypeNone,
                enabled: widget.enabled,
              ),
        formSizebox10,
      ],
    );
  }
}

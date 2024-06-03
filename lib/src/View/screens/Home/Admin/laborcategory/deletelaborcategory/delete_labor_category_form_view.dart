// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../controler/GetDate/get_date.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_header.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_item.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_width.dart';
import '../../laborOutturn/labor_outturn_text.dart';
import '../labor_category_text.dart';
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

class LaborCategoryFormDeleteView extends StatefulWidget {
  const LaborCategoryFormDeleteView({Key? key, required this.id})
      : super(key: key);
  final id;

  @override
  State<LaborCategoryFormDeleteView> createState() =>
      _LaborCategoryFormDeleteView();
}

class _LaborCategoryFormDeleteView extends State<LaborCategoryFormDeleteView> {
    final List<TextEditingController> _labourController = [];
  final List<TextEditingController> _rateController = [];
  final formKey=GlobalKey<FormState>();
  final CommonController commonController = CommonController();
  final TextEditingController laborCategoryController = TextEditingController();
  final TextEditingController categorydistributionController = TextEditingController();
  final TextEditingController createBy = TextEditingController();
  final TextEditingController createOn = TextEditingController();
  Map<String, dynamic>? data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

   Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("${ApiEndpoints.getLabourCategory}/${widget.id}"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body)["data"];
          if (data != null) {
            laborCategoryController.text = data!["co_labour_category_name"];
            categorydistributionController.text = data!["co_labour_category_desc"];
            createBy.text = data!["created_by"];
            createOn.text = data!["created_at"];
            
          
            if (data!['CoLabourCategoryTeams'] != null) {
              for (var teamMember in data!['CoLabourCategoryTeams']) {
                _labourController.add(TextEditingController(text: teamMember['co_labour_category_team_name']));
                _rateController.add(TextEditingController(text: teamMember['co_labour_category_team_rate'].toString()));
              }
            }
            
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
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController laborCategoryController =
        TextEditingController();
    final TextEditingController categorydistributionController =
        TextEditingController();
    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const DetailsText(enterDetails: deleteLaborCategoryDetailsText),
             Column(
                      children: [
                        LaborCategoryViewDetails(
                          enabled: false,
                          laborCategoryController: laborCategoryController,
                          categorydistributionController: categorydistributionController,
                        ),
                       
                       
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _labourController.length,
                                  itemBuilder: (context, index) {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextFormFieldWidth(
                                                Width: 250,
                                                controller: _labourController[index],
                                                text: teamMeamber,
                                                limitLength: 50,
                                                optionalisEmpty: false,
                                                inputformat: alphabatsAndNumbers,
                                                star: estar,
                                                inputtype: keyboardTypeNone,
                                                enabled: false,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: TextFormFieldWidth(
                                                  Width: 100,
                                                  controller: _rateController[index],
                                                  text: rate,
                                                  limitLength: 5,
                                                  optionalisEmpty: false,
                                                  inputformat: number,
                                                  star: estar,
                                                  inputtype: keyboardTypeNumber,
                                                  enabled: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          // if (index != 0)
                                        
                                          //   GestureDetector(
                                          //     onTap: () {
                                          //       setState(() {
                                          //         _labourController[index].clear();
                                          //         _rateController[index].clear();
                                          //         _labourController.removeAt(index);
                                          //         _rateController.removeAt(index);
                                          //       });
                                          //     },
                                          //     child: const Icon(
                                          //       Icons.delete,
                                          //       color: Color(0xFF6B74D6),
                                          //       size: 35,
                                          //     ),
                                          //   )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              
                              ],
                            ),
                          ),
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
       ] ),
      ),
    
    ),
      bottomSheet: const BottomSheetLogo(),);
  }
}

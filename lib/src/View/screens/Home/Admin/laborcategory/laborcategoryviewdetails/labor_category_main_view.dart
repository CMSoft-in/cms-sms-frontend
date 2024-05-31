import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../controler/common_controller.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/Long_SizeButton.dart';
import '../../../../../widgets/CommonUsageForm/AlartBox/alart_popup.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_data_item.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_header.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field_width.dart';
import '../../../../../widgets/CommonUsageForm/view_details_text.dart';
import '../labor_category_text.dart';
import '../laborcategorydataview/labor_category_data_view.dart';
import 'labor_category_view.dart';

class LaborCategoryViewDetailsMain extends StatefulWidget {
  final BuildContext context;
  final String id;

  const LaborCategoryViewDetailsMain({
    Key? key,
    required this.context,
    required this.id,
  }) : super(key: key);

  @override
  State<LaborCategoryViewDetailsMain> createState() =>
      _LaborCategoryViewDetailsMainState();
}

class _LaborCategoryViewDetailsMainState
    extends State<LaborCategoryViewDetailsMain> {
  final List<TextEditingController> _labourController = [];
  final List<TextEditingController> _rateController = [];
  final formKey = GlobalKey<FormState>();
  final CommonController commonController = CommonController();
  final TextEditingController laborCategoryController = TextEditingController();
  final TextEditingController categorydistributionController =
      TextEditingController();
  final TextEditingController createBy = TextEditingController();
  final TextEditingController createOn = TextEditingController();
  Map<String, dynamic>? data;
  bool isEditing = false;
  bool isEnabled = false;
  bool isLoading = true;
  var updatedData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getLabourCategory}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body)["data"];
          if (data != null) {
            laborCategoryController.text = data!["co_labour_category_name"];
            categorydistributionController.text =
                data!["co_labour_category_desc"];
            createBy.text = data!["created_by"];
            createOn.text = data!["created_at"];

            if (data!['CoLabourCategoryTeams'] != null) {
              for (var teamMember in data!['CoLabourCategoryTeams']) {
                _labourController.add(TextEditingController(
                    text: teamMember['co_labour_category_team_name']));
                _rateController.add(TextEditingController(
                    text:
                        teamMember['co_labour_category_team_rate'].toString()));
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

  void updateData(Map<String, dynamic> data) async {
    try {
      var response = await http.patch(
        Uri.parse('${ApiEndpoints.updateLabourCategory}/${widget.id}'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const LaborCategoryDataView()));
      } else {
        print(response.body);
      }
    } catch (e) {
      print("update failed $e");
    }
  }

  void checkUpdatingValue() {
    var oldData = data;
    if (oldData != null) {
      Map<String, dynamic> updatedData = {};
      var checkingFields = {
        "co_labour_category_name": laborCategoryController.text,
        "co_labour_category_desc": categorydistributionController.text,
      };
      checkingFields.forEach((key, value) {
        if (oldData[key] != value && value.isNotEmpty) {
          updatedData[key] = value;
        }
      });

      // Check updates in the team members
      List<Map<String, dynamic>> updatedTeams = [];
      for (int i = 0; i < _labourController.length; i++) {
        String newTeamName = _labourController[i].text;
        String newTeamRate = _rateController[i].text;

        if (i < (data!['CoLabourCategoryTeams'] as List).length) {
          var oldTeam = data!['CoLabourCategoryTeams'][i];
          if (oldTeam['co_labour_category_team_name'] != newTeamName ||
              oldTeam['co_labour_category_team_rate'].toString() !=
                  newTeamRate) {
            updatedTeams.add({
              'co_labour_category_team_name': newTeamName,
              'co_labour_category_team_rate': newTeamRate,
            });
          }
        } else {
          // New team member
          updatedTeams.add({
            'co_labour_category_team_name': newTeamName,
            'co_labour_category_team_rate': newTeamRate,
          });
        }
      }

      if (updatedTeams.isNotEmpty) {
        updatedData['CoLabourCategoryTeams'] = updatedTeams;
      }

      if (updatedData.isNotEmpty) {
        updateData(updatedData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Column(children: [
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
              : Column(
                  children: [
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
                  ],
                ),
        ]),
      )),
      bottomSheet: const BottomSheetLogo(),
    );
  }
}

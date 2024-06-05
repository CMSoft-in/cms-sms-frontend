import 'dart:convert';
import 'package:cmssms/src/View/screens/Home/Admin/laborOutturn/labor_outturn_text.dart';
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
  // void updateData(Map<String, dynamic> data) async {
  //   try {
  //     var response = await http.patch(
  //       Uri.parse("${ApiEndpoints.updateLabourCategory}/${widget.id}"),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer $token",
  //       },
  //       body: jsonEncode(data),
  //     );
  //     if (response.statusCode == 200) {
  //       Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => const LaborCategoryDataView()));
  //     } else {
  //       print(response.body);
  //     }
  //   } catch (e) {
  //     print("update failed $e");
  //   }
  // }

  void checkUpdatingValue() {
    if (data == null) return;

    Map<String, dynamic> updatedData = {};

    // Checking fields
    Map<String, String> checkingFields = {
      "co_labour_category_name": laborCategoryController.text,
      "co_labour_category_desc": categorydistributionController.text,
    };

    checkingFields.forEach((key, value) {
      if (data![key] != value && value.isNotEmpty) {
        updatedData[key] = value;
      }
    });

    // Updating team members
    List<Map<String, dynamic>> updatedTeams = [];
    List<dynamic> existingTeams =
        data!['CoLabourCategoryTeams'] as List<dynamic>;
    int existingTeamsLength = existingTeams.length;

    for (int i = 0; i < _labourController.length; i++) {
      String newTeamName = _labourController[i].text;
      String newTeamRate = _rateController[i].text;

      if (i < existingTeamsLength) {
        var oldTeam = existingTeams[i];
        String oldTeamName = oldTeam['co_labour_category_team_name'];
        String oldTeamRate = oldTeam['co_labour_category_team_rate'].toString();

        if (oldTeamName != newTeamName || oldTeamRate != newTeamRate) {
          updatedTeams.add({
            'co_labour_category_team_id': oldTeam['co_labour_category_team_id'],
            'co_labour_category_team_name': newTeamName,
            'co_labour_category_team_rate': newTeamRate,
          });
        }
      } else {
        updatedTeams.add({
          'co_labour_category_team_name': newTeamName,
          'co_labour_category_team_rate': newTeamRate,
        });
      }
    }
    if (updatedTeams.isNotEmpty) {
      updatedData['co_labour_category_team'] = updatedTeams;
    }
    if (updatedData.isNotEmpty) {
      print(updatedData);
      updateData(updatedData);
    }
  }

  Future<void> updateData(Map<String, dynamic> updatedData) async {
    try {
      var response = await http.patch(
        Uri.parse("${ApiEndpoints.updateLabourCategory}/${widget.id}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LaborCategoryDataView(),
          ),
        );
      } else {
        print("Update failed with status: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("Update failed with error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labor Category Details'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                        api:
                            '${ApiEndpoints.deleteLabourCategory}/${widget.id}',
                        onPress: const LaborCategoryDataView(),
                      ),
                    ),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              LaborCategoryViewDetails(
                                enabled: isEditing,
                                laborCategoryController:
                                    laborCategoryController,
                                categorydistributionController:
                                    categorydistributionController,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  TextFormFieldWidth(
                                                    Width: 250,
                                                    controller:
                                                        _labourController[
                                                            index],
                                                    text: teamMeamber,
                                                    limitLength: 50,
                                                    optionalisEmpty: false,
                                                    inputformat:
                                                        alphabatsAndNumbers,
                                                    star: estar,
                                                    inputtype: keyboardTypeNone,
                                                    enabled: isEnabled,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: TextFormFieldWidth(
                                                      Width: 100,
                                                      controller:
                                                          _rateController[
                                                              index],
                                                      text: rate,
                                                      limitLength: 5,
                                                      optionalisEmpty: false,
                                                      inputformat: number,
                                                      star: estar,
                                                      inputtype:
                                                          keyboardTypeNumber,
                                                      enabled: isEnabled,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              if (index != 0)
                                                isEditing
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            _labourController[
                                                                    index]
                                                                .clear();
                                                            _rateController[
                                                                    index]
                                                                .clear();
                                                            _labourController
                                                                .removeAt(
                                                                    index);
                                                            _rateController
                                                                .removeAt(
                                                                    index);
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons.delete,
                                                          color:
                                                              Color(0xFF6B74D6),
                                                          size: 35,
                                                        ),
                                                      )
                                                    : formSizebox10
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    isEditing
                                        ? ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                _labourController.add(
                                                    TextEditingController());
                                                _rateController.add(
                                                    TextEditingController());
                                              });
                                            },
                                            child:
                                                const Text('Add More Labour'),
                                          )
                                        : formSizebox10
                                  ],
                                ),
                              ),
                              CreateByCreatedOn(
                                createByController: createBy,
                                createOnController: createOn,
                                enabled: false,
                              ),
                              const SizedBox(height: 15),
                              LongButton(
                                formKey: formKey,
                                text: update,
                                onPressed: () {
                                  checkUpdatingValue();
                                },
                                isEnabled: isEnabled,
                              ),
                              if (updatedData != null && updatedData.isNotEmpty)
                                Column(
                                  children: [
                                    const UpdateHeader(
                                      updatedByHeader: updateByHeaderText,
                                      newValueHeader: newvalueHeaderText,
                                      oldValueHeader: oldvlueHeaderText,
                                    ),
                                    ...updatedData.map<Widget>((eachItem) {
                                      return updatedDataItem(
                                        eachItem["updated_old_value"],
                                        eachItem["updated_new_value"],
                                        eachItem["updated_by"].toString(),
                                      );
                                    }).toList(),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              const SizedBox(height: 20),
                            ],
                          ),
                  ],
                ),
              ),
            ),
      bottomSheet: const BottomSheetLogo(),
    );
  }
}







 // if (!isEditing &&
                        //     data != null &&
                        //     data!['co_labour_category_team'] != null)
                        //   ListView.builder(
                        //     shrinkWrap: true,
                        //     itemCount: data!['co_labour_category_team'].length,
                        //     itemBuilder: (context, index) {
                        //       var teamMember = data!['co_labour_category_team'][index];
                        //       return Column(
                        //         children: [
                        //           Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Text(
                        //                 teamMember["co_labour_team_name"] ?? '',
                        //                 style: const TextStyle(fontSize: 16),
                        //               ),
                        //               const SizedBox(width: 10),
                        //               Text(
                        //                 teamMember["co_labour_team_rate"].toString() ?? '',
                        //                 style: const TextStyle(fontSize: 16),
                        //               ),
                        //             ],
                        //           ),
                        //           const SizedBox(height: 10),
                        //         ],
                        //       );
                        //     },
                        //   ),
                        // if (!isEditing &&
                        //     data != null &&
                        //     data!['co_labour_category_team'] != null)
                        //   CreateByCreatedOn(
                        //     createByController: createBy,
                        //     createOnController: createOn,
                        //     enabled: false,
                        //   ),
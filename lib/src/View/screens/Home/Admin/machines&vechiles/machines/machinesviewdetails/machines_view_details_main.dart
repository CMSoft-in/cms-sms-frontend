// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import '../../../../../../../Model/api/api_model.dart';
import '../../../../../../../controler/GetDate/get_date.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/machines/machinesviewdetails/machines_view_details_four.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/machines/machinesviewdetails/machines_view_details_one.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/machines/machinesviewdetails/machines_view_details_three.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/machines/machinesviewdetails/machines_view_details_two.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../../Model/Const/color.dart';
import '../../../../../../../Model/Const/height_width.dart';
import '../../../../../../../Model/Const/text_const.dart';
import '../../../../../../../Model/api/local.dart';
import '../../../../../../../controler/common_controller.dart';
import '../../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../../widgets/Buttons/Long_SizeButton.dart';
import '../../../../../../widgets/CommonUsageForm/AlartBox/alart_popup.dart';
import '../../../../../../widgets/CommonUsageForm/Update/update_data_item.dart';
import '../../../../../../widgets/CommonUsageForm/Update/update_header.dart';
import '../../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../../../../../widgets/CommonUsageForm/view_details_text.dart';
import '../../m_v_text.dart';
import '../machinesdataview/machines_data_view.dart';

class MachinesViewDetailsMain extends StatefulWidget {
  const MachinesViewDetailsMain({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<MachinesViewDetailsMain> createState() =>
      _MachinesViewDetailsMainState();
}

class _MachinesViewDetailsMainState extends State<MachinesViewDetailsMain> {
  Map<String, dynamic>? data;
  var updatedData;

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchUpdateData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getMachine}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            mnameController.text = data!["co_machine_no"] ?? "";
            msecondNameController.text = data!["owner_first_name"] ?? "";
            addressline1Controller.text = data!["off_address_line1"] ?? "";
            addressline2Controller.text = data!["off_address_line2"] ?? "";
            cityController.text = data!["city"] ?? "";
            stateController.text = data!["state"] ?? "";
            pincodeController.text = data!["pincode"].toString();
            mcompanyController.text = data!["co_machine_company_name"] ?? "";
            mmodelController.text = data!["co_machine_model"] ?? "";
            myearofMakeController.text = data!["co_machine_yearofmake"] ?? "";
            minsuranceExpiryDateController.text =
                Datee.getDate(data!["co_machine_insurance_exp_date"]) ?? "";
            mnextFCDateController.text =
                Datee.getDate(data!["co_machine_next_fitness_certificate_date"]) ?? "";
            createBy.text = data!["created_by"] ?? "";
            createOn.text = Date.getDate(data!["createdAt"]) ?? "";
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
        Uri.parse('${ApiEndpoints.getMachineUpdateHistory}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          var updateData = [];

          var data = jsonDecode(response.body);

          for (var eachData in data) {
            if (eachData["co_machine_id"].toString() == widget.id) {
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

      var response = await http.patch(
        Uri.parse('${ApiEndpoints.updateMachine}/${widget.id}'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
       
      );
       print(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MachinesDataView()));
      }
    } catch (e) {
      print("update failed $e");
    }
  }
  
  void machinesCheckUpdatingValue() {
     var oldData = data;
    if (oldData != null) {
      Map<String, dynamic> updatedData = {};
      var controllers = {
        "co_machine_no": mnameController.text,
        "owner_first_name": msecondNameController.text,
        "off_address_line1": addressline1Controller.text,
        "off_address_line2": addressline2Controller.text,
        "city": cityController.text,
        "state": stateController.text,
        "pincode": pincodeController.text,
        "co_machine_company_name": mcompanyController.text,
        "co_machine_model": mmodelController.text,
        "co_machine_yearofmake": myearofMakeController.text,
        "co_machine_insurance_exp_date": minsuranceExpiryDateController.text,
        "co_machine_next_fitness_certificate_date": mnextFCDateController.text,
       
      };

      controllers.forEach((key, value) {
      // ignore: unnecessary_null_comparison
      if (value != null && value.isNotEmpty && (oldData[key] ?? '') != value) {
        updatedData[key] = value;
        print(updatedData);
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
  //

  CommonController commonController = CommonController();

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
                viewClientDetailsTextt:
                    isEditing ? editMachineDetailsText : viewMachineDetailsText,
                editOnPress: () {
                  setState(() {
                    isEditing = !isEditing;
                    isEnabled = !isEnabled;
                  });
                },
                deleteOnPress: AlartMessage(
                  api: '${ApiEndpoints.deleteMachine}/${widget.id}',
                  onPress: const MachinesDataView(),
                ),
              ),
              MachineViewDetailsOne(
                  NameController: mnameController,
                  secondNameController: msecondNameController,
                  addressline1Controller: addressline1Controller,
                  addressline2Controller: addressline2Controller,
                  cityController: cityController,
                  pincodeController: pincodeController,
                  stateController: stateController,
                  enabled: isEnabled),
              MachinesViewDetailsTwo(
                  enabled: isEnabled,
                  CompanyController: mcompanyController,
                  ModelController: mmodelController,
                  yearofMakeController:myearofMakeController),
              MachinesViewDetailsThree(
                  machineImagesFilePathController:
                     mmachineImagesFilePathController,
                  registrationCertificateFilePathController:
                      mregistrationCertificateFilePathController,
                  insuranceFilePathController: minsuranceFilePathController,
                  fitnessCertificateFilePathController:
                      mfitnessCertificateFilePathController,
                  enabled: isEnabled),
              MachinesViewDetailsFour(
                  enabled: isEnabled,
                  isEditing: isEditing,
                  insuranceExpiryDateController: minsuranceExpiryDateController,
                  nextFCDateController: mnextFCDateController),
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
                  machinesCheckUpdatingValue();
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

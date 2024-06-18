// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:cmssms/src/Model/api/api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../Model/Const/color.dart';
import '../../../../../../../Model/Const/height_width.dart';
import '../../../../../../../Model/Const/text_const.dart';
import '../../../../../../../Model/api/local.dart';
import '../../../../../../../controler/GetDate/get_date.dart';
import '../../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_header.dart';
import '../../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_item.dart';
import '../../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../../widgets/CommonUsageForm/Update/update_data_item.dart';
import '../../../../../../widgets/CommonUsageForm/Update/update_header.dart';
import '../../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../m_v_text.dart';
import '../vechilesdataview/vechiles_data_view.dart';
import '../vechilesviewdetails/vechiles_view_details_four.dart';
import '../vechilesviewdetails/vechiles_view_details_one.dart';
import '../vechilesviewdetails/vechiles_view_details_three.dart';
import '../vechilesviewdetails/vechiles_view_details_two.dart';

class VechilesFormDeleteView extends StatefulWidget {
  const VechilesFormDeleteView({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<VechilesFormDeleteView> createState() => _VechilesFormDeleteViewState();
}

class _VechilesFormDeleteViewState extends State<VechilesFormDeleteView> {
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
        Uri.parse('${ApiEndpoints.getVehicle}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          print(data);
          if (data != null) {
            vnameController.text = data!["co_vehicle_reg_no"] ?? "";
            vsecondNameController.text = data!["owner_first_name"] ?? "";
            addressline1Controller.text = data!["off_address_line1"] ?? "";
            addressline2Controller.text = data!["off_address_line2"] ?? "";
            cityController.text = data!["city"] ?? "";
            stateController.text = data!["state"] ?? "";
            pincodeController.text = data!["pincode"] ?? "";
            vcompanyController.text = data!["co_vehicle_company_name"] ?? "";
            vmodelController.text = data!["co_vehicle_model"] ?? "";
            vyearofMakeController.text = data!["co_vehicle_yearofmake"] ?? "";
            vengineChassisNoController.text =
                data!["co_vehicle_engine_no"] ?? "";
            createBy.text = data!["created_by"] ?? "";
            createOn.text = Date.getDate(data!["createdAt"]) ?? "";
            // insuranceFilePathController.text =
            //     data!["co_vehicle_registration_certificate"].toString() ?? "";
            vinsuranceExpiryDateController.text =
                Datee.getDate(data!["co_vehicle_insurance_exp_date"]) ?? "";
            vnextFCDateController.text = Datee.getDate(
                    data!["co_vehicle_next_fitness_certificate_date"]) ??
                "";
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
        Uri.parse('${ApiEndpoints.getVehicleUpdateHistory}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      var data = jsonDecode(response.body);
      print(response.body);
      if (response.statusCode == 200) {
        setState(() {
          List<dynamic> updateData = [];

          print(data);
          for (var eachData in data) {
            if (eachData["co_vehicle_id"].toString() == widget.id) {
              updateData.add(eachData);
            }
          }
          updatedData = updateData;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching UpdateData: $error');
    }
  }

  bool isEditing = false;
  bool isEnabled = false;

  void updateData(data) async {
    try {
      var response = await http.patch(
        Uri.parse('${ApiEndpoints.updateVehicle}/${widget.id}'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const VechilesDataView()));
      } else {
        print(response.body);
      }
    } catch (e) {
      print("update failed $e");
    }
  }

  void vehiclesCheckUpdatingValue() {
    var oldData = data;
    if (oldData != null) {
      Map<String, dynamic> updatedData = {};

      var controllers = {
        "co_vehicle_reg_no": vnameController.text,
        "owner_first_name": vsecondNameController.text,
        "off_address_line1": addressline1Controller.text,
        "off_address_line2": addressline2Controller.text,
        "city": cityController.text,
        "state": stateController.text,
        "pincode": pincodeController.text,
        "co_vehicle_company_name": vcompanyController.text,
        "co_vehicle_model": vmodelController.text,
        "co_vehicle_yearofmake": vyearofMakeController.text,
        "co_vehicle_engine_no": vengineChassisNoController.text,
        "co_vehicle_registration_certificate":
            vinsuranceFilePathController.text,
        "co_vehicle_insurance_exp_date": vinsuranceExpiryDateController.text,
        "co_vehicle_next_fitness_certificate_date": vnextFCDateController.text
      };

      controllers.forEach((key, value) {
        if (value.isNotEmpty && (oldData[key] ?? '') != value) {
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
              DetailsText(enterDetails: deleteVechilesDetailsText),
              VechilesViewDetailsOne(
                  NameController: vnameController,
                  secondNameController: vsecondNameController,
                  addressline1Controller: addressline1Controller,
                  addressline2Controller: addressline2Controller,
                  cityController: cityController,
                  pincodeController: pincodeController,
                  stateController: stateController,
                  enabled: false),
              VechilesViewDetailsTwo(
                  enabled: false,
                  engineChassisNoController:vengineChassisNoController,
                  CompanyController: vcompanyController,
                  ModelController: vmodelController,
                  yearofMakeController: vyearofMakeController),
              VechilesViewDetailsThree(
                  machineImagesFilePathController:
                      vmachineImagesFilePathController,
                  registrationCertificateFilePathController:
                      vregistrationCertificateFilePathController,
                  insuranceFilePathController: vinsuranceFilePathController,
                  fitnessCertificateFilePathController:
                      vfitnessCertificateFilePathController,
                  enabled: false),
              VechilesViewDetailsFour(
                  enabled: false,
                  isEditing: false,
                  insuranceExpiryDateController: vinsuranceExpiryDateController,
                  nextFCDateController: vnextFCDateController),
              CreateByCreatedOn(
                createByController: createBy,
                createOnController: createOn,
                enabled: false,
              ),
              formSizebox10,
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
                            eachItem["updated_old_value"].toString() ?? "",
                            eachItem["updated_new_value"].toString() ?? "",
                            eachItem["updated_by"].toString(),
                          );
                        }).toList(),
                       
                      ],
                    ),
               formSizebox10,
                const deleteTableHeader(
                  deleteDate: deleteDate,
                  deleteReason: deleteReason,
                  deleteperson: deletePerson,
                ),
                DeleteDataItem(
                  deletepersonName: () {
                    if (data == null) {
                      return "";
                    } else {
                      return data!["deleted_by"].toString()??"";
                    }
                  }(),
                  deleteReason: () {
                    if (data == null) {
                      return "";
                    } else {
                      return data!["deletion_reason"].toString()??"";
                    }
                  }(),
                  deletedDate: () {
                    if (data == null) {
                      return "";
                    } else {
                      return Date.getDate(data!["deleted_on"]).toString()??"";
                    }
                  }(),
                ),
                formSizebox10,
              formSizebox15,
              bottomHeight
            ],
          ),
        ),
      ),
      bottomSheet: const BottomSheetLogo(),
    );
  }
}

// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
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
import '../../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../m_v_text.dart';
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
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("$ip/Admin/vehicle/${widget.id}"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            // var clint = ClientData.fromJson(jsonDecode(response.body));
             vnameController.text = data!["co_vehicle_reg_no"] ?? "";
            vsecondNameController.text = data!["owner_first_name"] ?? "";
            addressline1Controller.text = data!["address_line1"] ?? "";
            addressline2Controller.text = data!["address_line2"] ?? "";
            cityController.text = data!["town"] ?? "";
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
                    return Date.getDate(data!["deleted_on"]);
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

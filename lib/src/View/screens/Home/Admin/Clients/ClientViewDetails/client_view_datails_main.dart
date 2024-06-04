// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';

import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/api_model.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../Model/utility/client/client_text_const.dart';
import '../../../../../../controler/ClientController/client_controller.dart';
import '../../../../../../controler/GetDate/get_date.dart';
import '../../../../../../controler/common_controller.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/Long_SizeButton.dart';
import '../../../../../widgets/CommonUsageForm/AlartBox/alart_popup.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_data_item.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_header.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../../../../widgets/CommonUsageForm/view_details_text.dart';
import '../ClientDataView/client_data_view_main.dart';
import 'client_view_details_five.dart';
import 'client_view_details_four.dart';
import 'client_view_details_one.dart';
import 'client_view_details_six.dart';
import 'client_view_details_three.dart';
import 'client_view_details_two.dart';

class ClientViewDetailsMain extends StatefulWidget {
  const ClientViewDetailsMain({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<ClientViewDetailsMain> createState() => _ClientViewDetailsMainState();
}

class _ClientViewDetailsMainState extends State<ClientViewDetailsMain> {
  Map<String, dynamic>? data;
  var updatedData;
  CommonController commonController = CommonController();

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchUpdateData();
    getToken();
  }

  bool isEditing = false;
  bool isEnabled = false;
  bool isLoading = true;
  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getClient}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        isLoading = false;
        setState(() {
          data = jsonDecode(response.body);
          print(data);
          if (data != null) {
            control.clientName.text = data!["co_client_name"] ?? '';
            control.addressline1.text = data!["off_address_line1"] ?? '';
            control.addressline2.text = data!["off_address_line2"] ?? '';
            control.city.text = data!["off_town"] ?? '';
            control.pincode.text = data!["off_pincode"] ?? '';
            control.state.text = data!["off_state"] ?? '';
            control.firstName.text = data!["owner_first_name"] ?? '';
            control.lastName.text = data!["owner_last_name"] ?? '';
            control.phoneNumber.text = data!["mobile_no"] ?? '';
            control.email.text = data!["email"] ?? '';
            control.whatsapp.text = data!["whatsapp"] ?? '';
            control.addressline1Controller.text =
                data!["resi_address_line1"] ?? '';
            control.addressline2Controller.text =
                data!["resi_address_line2"] ?? '';
            control.cityController.text = data!["resi_town"] ?? '';
            control.pincodeController.text = data!["resi_pincode"] ?? '';
            control.stateController.text = data!["resi_state"] ?? '';
            control.primaryName.text = data!["primary_contact_name"] ?? '';
            control.primaryPhoneNumber.text = data!["primary_contact_no"] ?? '';
            control.primaryEmail.text = data!["primary_contact_email"] ?? '';
            control.primaryWhatsapp.text =
                data!["primary_contact_whatsapp"] ?? '';
            control.secondaryName.text = data!["secondary_contact_name"] ?? '';
            control.secondaryPhoneNumber.text =
                data!["secondary_contact_no"] ?? '';
            control.secondaryEmail.text =
                data!["secondary_contact_email"] ?? '';
            control.secondaryWhatsapp.text =
                data!["secondary_contact_whatsapp"] ?? '';
            control.gstNumber.text = data!["gst_no"] ?? '';
            control.accountNumber.text = data!["bank_acc_no"] ?? '';
            control.ifscCode.text = data!["bank_ifsc_code"] ?? '';
            control.accountName.text = data!["bank_acc_name"] ?? '';
            control.accountType.text = data!["bank_acc_type"] ?? '';
            control.bankName.text = data!["bank_name"] ?? '';
            control.bankLocation.text = data!["bank_acc_location"] ?? '';
            createBy.text = data!["created_by"] ?? '';
            createOn.text = Date.getDate(data!["createdAt"]) ?? '';
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
        Uri.parse('${ApiEndpoints.getClientUpdateHistory}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          var updateData = [];

          var data = jsonDecode(response.body);

          for (var eachData in data) {
            if (eachData["co_client_id"].toString() == widget.id) {
              updateData.add(eachData);
            }
          }
          updatedData = updateData;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching Updatedata: $error');
    }
  }

  void updateData(data) async {
    try {
      print("before update");
      var response = await http.patch(
        Uri.parse('${ApiEndpoints.updateClient}/${widget.id}'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );
      print(response.body);
      if (response.statusCode == 200) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ClientDataView()));
      } else {
        print("before e");
        print(response.statusCode);
      }
    } catch (e) {
      print("update failed $e");
    }
  }

  void checkUpdatingValue() {
    var oldData = data;
    print(oldData);
    if (oldData != null) {
      Map<String, dynamic> updatedData = {};
      var clientFields = {
        "co_client_name": control.clientName.text,
        "off_address_line1": control.addressline1.text,
        "off_address_line2": control.addressline2.text,
        "off_town": control.city.text,
        "off_pincode": control.pincode.text,
        "off_state": control.state.text,
        "owner_first_name": control.firstName.text,
        "owner_last_name": control.lastName.text,
        "mobile_no": control.phoneNumber.text,
        "email": control.email.text,
        "whatsapp": control.whatsapp.text,
        "resi_address_line1": control.addressline1Controller.text,
        "resi_address_line2": control.addressline2Controller.text,
        "resi_town": control.cityController.text,
        "resi_pincode": control.pincodeController.text,
        "resi_state": control.stateController.text,
        "primary_contact_name": control.primaryName.text,
        "primary_contact_no": control.primaryPhoneNumber.text,
        "primary_contact_email": control.primaryEmail.text,
        "primary_contact_whatsapp": control.primaryWhatsapp.text,
        "secondary_contact_name": control.secondaryName.text,
        "secondary_contact_no": control.secondaryPhoneNumber.text,
        "secondary_contact_email": control.secondaryEmail.text,
        "secondary_contact_whatsapp": control.secondaryWhatsapp.text,
        "gst_no": control.gstNumber.text,
        "bank_acc_no": control.accountNumber.text,
        "bank_ifsc_code": control.ifscCode.text,
        "bank_acc_name": control.accountName.text,
        "bank_acc_type": control.accountType.text,
        "bank_name": control.bankName.text,
        "bank_acc_location": control.bankLocation.text,
        // "aadhar_no": _aadharNumber.text,
        //   "pan_no": _panNumber.text,
      };

      clientFields.forEach((key, value) {
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ViewDetailsText(
                      viewClientDetailsTextt: isEditing
                          ? editClientDetailsText
                          : viewClientDetailsText,
                      editOnPress: () {
                        setState(() {
                          isEditing = !isEditing;
                          isEnabled = !isEnabled;
                        });
                      },
                      deleteOnPress: AlartMessage(
                        api: '${ApiEndpoints.deleteClient}/${widget.id}',
                        onPress: const ClientDataView(),
                      ),
                    ),
                    ClientViewDetailsOne(
                      clientNamee: control.clientName,
                      addressline1Controller: control.addressline1,
                      addressline2Controller: control.addressline2,
                      cityController: control.city,
                      pincodeController: control.pincode,
                      stateController: control.state,
                      enabled: isEditing,
                    ),
                    ClientViewDetailsTwo(
                      firstNamee: control.firstName,
                      lastNamee: control.lastName,
                      phoneNumberr: control.phoneNumber,
                      emaill: control.email,
                      whatsappp: control.whatsapp,
                      enabled: isEditing,
                    ),
                    ClientViewDetailsThree(
                      addressline1Controller: control.addressline1Controller,
                      addressline2Controller: control.addressline2Controller,
                      cityController: control.cityController,
                      pincodeController: control.pincodeController,
                      stateController: control.stateController,
                      enabled: isEditing,
                    ),
                    ClientViewDetailsFour(
                      primaryNameController: control.primaryName,
                      primaryPhoneNumberController: control.primaryPhoneNumber,
                      primaryEmailController: control.primaryEmail,
                      primaryWhatsappController: control.primaryWhatsapp,
                      secondaryNameController: control.secondaryName,
                      secondaryPhoneNumberController:
                          control.secondaryPhoneNumber,
                      secondaryEmailController: control.secondaryEmail,
                      secondaryWhatsappController: control.secondaryWhatsapp,
                      enabled: isEditing,
                    ),
                    ClientViewDetailsFive(
                      gstNumber: control.gstNumber,
                      accountNumberController: control.accountNumber,
                      ifscCodeController: control.ifscCode,
                      accountNameController: control.accountName,
                      accountTypeController: control.accountType,
                      bankNameController: control.bankName,
                      bankLocationController: control.bankLocation,
                      enabled: isEditing,
                      isEditing: isEditing,
                    ),
                    ClientViewDetailsSix(
                      enabled: isEditing,
                    ),
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
                                eachItem["updated_old_value"] ?? "",
                                eachItem["updated_new_value"] ?? "",
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

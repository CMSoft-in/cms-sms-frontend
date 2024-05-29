import 'dart:convert';
import '../../../../../../Model/api/api_model.dart';
import '/src/View/widgets/AppBar/AppBar.dart';
import '/src/Model/utility/client/client_text_const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../../Model/api/local.dart';
import '../../../../../../controler/ClientController/client_controller.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_header.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_item.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../controler/GetDate/get_date.dart';
import '../ClientViewDetails/client_view_details_five.dart';
import '../ClientViewDetails/client_view_details_four.dart';
import '../ClientViewDetails/client_view_details_one.dart';
import '../ClientViewDetails/client_view_details_six.dart';
import '../ClientViewDetails/client_view_details_three.dart';
import '../ClientViewDetails/client_view_details_two.dart';

class ClientFormDeleteView extends StatefulWidget {
  const ClientFormDeleteView({super.key, this.id});
  final id;
  @override
  State<ClientFormDeleteView> createState() => _ClientFormDeleteViewState();
}

class _ClientFormDeleteViewState extends State<ClientFormDeleteView> {
  @override
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Map<String, dynamic>? data;

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getClient}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            var controllers = {
              "co_client_name": control.clientName,
              "off_address_line1": control.addressline1,
              "off_address_line2": control.addressline2,
              "off_town": control.city,
              "off_pincode": control.pincode,
              "off_state": control.state,
              "owner_first_name": control.firstName,
              "owner_last_name": control.lastName,
              "mobile_no": control.phoneNumber,
              "email": control.email,
              "whatsapp": control.whatsapp,
              "resi_address_line1": control.addressline1Controller,
              "resi_address_line2": control.addressline2Controller,
              "resi_town": control.cityController,
              "resi_pincode": control.pincodeController,
              "resi_state": control.stateController,
              "primary_contact_name": control.primaryName,
              "primary_contact_no": control.primaryPhoneNumber,
              "primary_contact_email": control.primaryEmail,
              "primary_contact_whatsapp": control.primaryWhatsapp,
              "secondary_contact_name": control.secondaryName,
              "secondary_contact_no": control.secondaryPhoneNumber,
              "secondary_contact_email": control.secondaryEmail,
              "secondary_contact_whatsapp": control.secondaryWhatsapp,
              "gst_no": control.gstNumber,
              "bank_acc_no": control.accountNumber,
              "bank_ifsc_code": control.ifscCode,
              "bank_acc_name": control.accountName,
              "bank_acc_type": control.accountType,
              "bank_name": control.bankName,
              "bank_acc_location": control.bankLocation
            };
            controllers.forEach((key, controller) {
              controller.text = data![key]?.toString() ?? '';
            });
          }
        });
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  bool isEditing = false;

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
              const DetailsText(enterDetails: deleteClientDetailsText),
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
                secondaryPhoneNumberController: control.secondaryPhoneNumber,
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
        ),
      ),
      bottomSheet: const BottomSheetLogo(),
    );
  }
}

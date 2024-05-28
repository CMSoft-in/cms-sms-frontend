// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_eight.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_five.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_four.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_one.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_seven.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_six.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_three.dart';
import 'package:cmssms/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_two.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';

import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import '../../../../../../controler/ClientController/client_controller.dart';
import '../../../../../../controler/GetDate/get_date.dart';
import '../../../../../../controler/common_controller.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_header.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_item.dart';
import '../../../../../widgets/CommonUsageForm/createBy.dart';
import '../../machines&vechiles/m_v_text.dart';

class SiteFormDeleteView extends StatefulWidget {
  const SiteFormDeleteView({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<SiteFormDeleteView> createState() => _SiteFormDeleteViewState();
}

class _SiteFormDeleteViewState extends State<SiteFormDeleteView> {
  Map<String, dynamic>? data;
  var updatedData;
  CommonController commonController = CommonController();

  @override
  void initState() {
    super.initState();
    fetchData();
    getToken();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("$ip/Admin/get-site/${widget.id}"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
          siteNameController.text = data![dbSiteName] ?? "";
addressline1Controller.text = data![dbSiteAddressOne] ?? "";
addressline2Controller.text = data![dbSiteAddressTwo] ?? "";
pincodeController.text = data![dbSitePincode] ?? "";
cityController.text = data![dbSiteTown] ?? "";
stateController.text = data![dbSiteState] ?? "";
sitegpsController.text = data![dbSiteGpsLocation] ?? "";
projectWorkNameController.text = data![dbSiteProjectWorkName] ?? "";
projectSizeController.text = data![dbSiteProjectSize] ?? "";
projectStartDateController.text = data![dbSiteProjectStartDate] ?? "";
expectedCompletionDateController.text = data![dbSiteProjectCompletionDate] ?? "";
projectWorkDescriptionofController.text = data![dbSiteProjectDesc] ?? "";
companySiteEngineersAllocatedController.text = data![""] ?? "";
laborsAllocatedController.text = data![" "] ?? "";
primaryEmailController.text = data![dbPrimaryEmail] ?? "";
primaryNameController.text = data![dbPrimaryName] ?? "";
primaryPhoneNumberController.text = data![dbPrimaryNumber] ?? "";
primaryWhatsappController.text = data![""] ?? "";
secondaryEmailController.text = data![dbSecondaryEmail] ?? "";
secondaryNameController.text = data![dbSecondaryName] ?? "";
secondaryPhoneNumberController.text = data![dbSecondaryNumber] ?? "";
secondaryWhatsappController.text = data![""] ?? "";
governmentApprovalsController.text = data![""] ?? "";
clientArchitectEmailController.text = data![""] ?? "";
clientArchitectNameController.text = data![dbPrimaryName] ?? "";
clientArchitectPhoneNumberController.text = data![dbPrimaryNumber] ?? "";
clientArchitectWhatsappController.text = data![""] ?? "";
clientEngineerEmailController.text = data![dbSecondaryEmail] ?? "";
clientEngineerNameController.text = data![dbSecondaryName] ?? "";
clientEngineerPhoneNumberController.text = data![dbSecondaryNumber] ?? "";
clientEngineerWhatsappController.text = data![""] ?? "";
siteEngineerEmailController.text = data![dbPrimaryEmail] ?? "";
siteEngineerNameController.text = data![dbPrimaryName] ?? "";
siteEngineerPhoneNumberController.text = data![dbPrimaryNumber] ?? "";
siteEngineerWhatsappController.text = data![""] ?? "";
clientPurchaseOfficerEmailController.text = data![dbSecondaryEmail] ?? "";
clientPurchaseOfficerNameController.text = data![dbSecondaryName] ?? "";
clientPurchaseOfficerPhoneNumberController.text = data![dbSecondaryNumber] ?? "";
clientPurchaseOfficerWhatsappController.text = data![""] ?? "";
clientQualityOfficerEmailController.text = data![dbPrimaryEmail] ?? "";
clientQualityOfficerNameController.text = data![dbPrimaryName] ?? "";
clientQualityOfficerPhoneNumberController.text = data![dbPrimaryNumber] ?? "";
clientQualityOfficerWhatsappController.text = data![dbPrimaryWhatsapp] ?? "";

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
              SiteViewDetailsOne(
                isEditing: false,
                  enabled: false,
                  addressline1Controller: addressline1Controller,
                  addressline2Controller: addressline2Controller,
                  cityControllerName: cityController,
                  pincodeControllerName: pincodeController,
                  siteNameController: siteNameController,
                  stateControllerName: stateController,
                  sitegpsController: sitegpsController),
              SiteViewDetailsTwo(
                  enabled: false,
                  isEditing: false,
                  expectedCompletionDateController:
                      expectedCompletionDateController,
                  projectSizeController: projectSizeController,
                  projectStartDateController: projectStartDateController,
                  projectWorkDescriptionofController:
                      projectWorkDescriptionofController,
                  projectWorkNameController: projectWorkNameController),
              SiteViewDetailsThree(
                  enabled: false,
                  companySiteEngineersAllocatedController:
                      companySiteEngineersAllocatedController,
                  laborsAllocatedController: laborsAllocatedController),
              SiteViewDetailsFour(
                  enabled: false,
                  emailController: emailController,
                  nameController: nameController,
                  phoneNumberController: phoneNumberController,
                  secondaryEmailController: secondaryEmailController,
                  secondaryNameController: secondaryNameController,
                  secondaryPhoneNumberController:
                      secondaryPhoneNumberController,
                  secondaryWhatsappController: secondaryWhatsappController,
                  whatsappController: whatsappController),
              SiteViewDetailsFive(
                  enabled: false,
                  governmentApprovalsController: governmentApprovalsController),
              SiteViewDetailsSix(
                  clientArchitectEmailController:
                      clientArchitectEmailController,
                  clientArchitectNameController: clientArchitectNameController,
                  clientArchitectPhoneNumberController:
                      clientArchitectPhoneNumberController,
                  clientArchitectWhatsappController:
                      clientArchitectWhatsappController,
                  clientEngineerEmailController: clientEngineerEmailController,
                  clientEngineerNameController: clientEngineerNameController,
                  clientEngineerPhoneNumberController:
                      clientEngineerPhoneNumberController,
                  clientEngineerWhatsappController:
                      clientEngineerWhatsappController,
                  enabled: false),
              SiteViewDetailsSeven(
                  siteEngineerEmailController: siteEngineerEmailController,
                  siteEngineerNameController: siteEngineerNameController,
                  siteEngineerPhoneNumberController:
                      siteEngineerPhoneNumberController,
                  siteEngineerWhatsappController:
                      siteEngineerWhatsappController,
                  clientPurchaseOfficerEmailController:
                      clientPurchaseOfficerEmailController,
                  clientPurchaseOfficerNameController:
                      clientPurchaseOfficerNameController,
                  clientPurchaseOfficerPhoneNumberController:
                      clientPurchaseOfficerPhoneNumberController,
                  clientPurchaseOfficerWhatsappController:
                      clientPurchaseOfficerWhatsappController,
                  enabled: false),
              SiteViewDetailsEight(
                  clientQualityOfficerEmailController:
                      clientQualityOfficerEmailController,
                  clientQualityOfficerNameController:
                      clientQualityOfficerNameController,
                  clientQualityOfficerPhoneNumberController:
                      clientQualityOfficerPhoneNumberController,
                  clientQualityOfficerWhatsappController:
                      clientQualityOfficerWhatsappController,
                  enabled: false),
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
        ),
      ),
      bottomSheet: const BottomSheetLogo(),
    );
  }
}

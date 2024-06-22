// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'package:cmssms/src/Model/api/api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/api/local.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';
import '../suppliersdataview/supplier_data_view.dart';
import '../suppliersviewdetails/supplier_view_details_four.dart';

class SupplierFormPageFour extends StatefulWidget {
  const SupplierFormPageFour({super.key, required this.data});
  final Map data;

  @override
  State<SupplierFormPageFour> createState() => _SupplierFormPageFourState();
}

class _SupplierFormPageFourState extends State<SupplierFormPageFour> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  final formKey = GlobalKey<FormState>();
  SupplierTextEditingController supplierTextEditingController =
      SupplierTextEditingController();
  Future<dynamic> navigateToPage(BuildContext context) async {
    try {
      final oldData = widget.data;
      var apiURL = Uri.parse(ApiEndpoints.createSupplier);

      var values = {
        ...oldData,
        "owner_first_name":
            supplierTextEditingController.firstNameController.text.isEmpty
                ? null
                : supplierTextEditingController.firstNameController.text.trim(),
        "owner_last_name":
            supplierTextEditingController.lastNameController.text.isEmpty
                ? null
                : supplierTextEditingController.lastNameController.text.trim(),
        "mobile_no": supplierTextEditingController
                .phoneNumberController.text.isEmpty
            ? null
            : int.parse(supplierTextEditingController.phoneNumberController.text
                .trim()),
        "secondary_contact_name": supplierTextEditingController
                .secondaryNameController.text.isEmpty
            ? null
            : supplierTextEditingController.secondaryNameController.text.trim(),
        "secondary_contact_no": supplierTextEditingController
                .secondaryPhoneNumberController.text.isEmpty
            ? null
            : int.parse(supplierTextEditingController
                .secondaryPhoneNumberController.text
                .trim()),
        "secondary_contact_email":
            supplierTextEditingController.secondaryEmailController.text.isEmpty
                ? null
                : supplierTextEditingController.secondaryEmailController.text
                    .trim(),
        "secondary_contact_whatsapp": supplierTextEditingController
                .secondaryWhatsappController.text.isEmpty
            ? null
            : int.parse(supplierTextEditingController
                .secondaryWhatsappController.text
                .trim()),
      };
      print(values);

      var body = json.encode(values);
      var response = await http.post(
        apiURL,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: body,
      );
      print(response.body);
      if (response.statusCode == 201) {
        print('Response body: ${response.body}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SupplierDataView(),
          ),
        );
      } else {
        print(response.body);
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print("E$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      formSizebox8,
                      const StackText(
                        stacktext: supplierPage4,
                        color: red,
                      ),
                      formSizebox15,
                      SupplierViewDetailsFour(
                          enabled: true,
                          firstNameController:
                              supplierTextEditingController.firstNameController,
                          lastNameController:
                              supplierTextEditingController.lastNameController,
                          phoneNumberController: supplierTextEditingController
                              .phoneNumberController,
                          secondaryNameController: supplierTextEditingController
                              .secondaryNameController,
                          secondaryPhoneNumberController:
                              supplierTextEditingController
                                  .secondaryPhoneNumberController,
                          secondaryEmailController:
                              supplierTextEditingController
                                  .secondaryEmailController,
                          secondaryWhatsappController:
                              supplierTextEditingController
                                  .secondaryWhatsappController),
                      formSizebox15,
                      bottomHeight,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
        formKey: formKey,
        isEnabled: true,
        onPress: () => navigateToPage(context),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

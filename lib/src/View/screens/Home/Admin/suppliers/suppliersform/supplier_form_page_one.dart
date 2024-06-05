import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';
import '../suppliersviewdetails/supplier_view_details_one.dart';
import 'supplier_form_page_two.dart';

class SupplierFormPageOne extends StatefulWidget {
  const SupplierFormPageOne({super.key});

  @override
  State<SupplierFormPageOne> createState() => _SupplierFormPageOneState();
}

class _SupplierFormPageOneState extends State<SupplierFormPageOne> {
SupplierTextEditingController supplierTextEditingController =
      SupplierTextEditingController();

  void navigateToPageTwo(BuildContext context) {
    var data = {
      "co_supplier_name": supplierTextEditingController
              .supplierNameController.text.isEmpty
          ? null
          : supplierTextEditingController.supplierNameController.text.trim(),
      "off_address_line1": supplierTextEditingController
              .addressline1Controller.text.isEmpty
          ? null
          : supplierTextEditingController.addressline1Controller.text.trim(),
      "off_address_line2": supplierTextEditingController
              .addressline2Controller.text.isEmpty
          ? null
          : supplierTextEditingController.addressline2Controller.text.trim(),
      "off_town": supplierTextEditingController.cityController.text.isEmpty
          ? null
          : supplierTextEditingController.cityController.text.trim(),
      "off_state": supplierTextEditingController.stateController.text.isEmpty
          ? null
          : supplierTextEditingController.stateController.text.trim(),
      "off_pincode":
          supplierTextEditingController.pincodeController.text.isEmpty
              ? null
              : int.parse(
                  supplierTextEditingController.pincodeController.text.trim()),
    };
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SupplierFormPageTwo(data: data),
      ),
    );
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: white,
      appBar: BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              formSizebox8,
              const DetailsText(enterDetails: supplierdetails),
              formSizebox15,
              const StackText(
                stacktext: supplierPage1,
                color: red,
              ),
              SupplierViewDetailsOne(
                  addressline1Controller:supplierTextEditingController.addressline1Controller,
                  addressline2Controller:supplierTextEditingController.addressline2Controller,
                  cityController:supplierTextEditingController.cityController,
                  enabled: true,
                  pincodeController: supplierTextEditingController.pincodeController,
                  stateController:supplierTextEditingController.stateController,
                  supplierNameController:supplierTextEditingController.supplierNameController),
                   formSizebox15,
                    bottomHeight,
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
          formKey: formKey,
          isEnabled: false,
          onPress: () => navigateToPageTwo(context)),
      bottomNavigationBar: BottomSheetLogo(),
    );
  }
}

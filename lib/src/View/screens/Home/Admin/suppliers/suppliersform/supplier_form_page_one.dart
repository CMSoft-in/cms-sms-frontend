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

class SupplierFormPageOne extends StatelessWidget {
  const SupplierFormPageOne({super.key});

  @override
  Widget build(BuildContext context) {

SupplierTextEditingController supplierTextEditingController=SupplierTextEditingController();

    void navigateToPageTwo(BuildContext context) {
      var data = {
        "co_supplier_name": supplierTextEditingController.supplierNameController.text,
    "off_address_line1": supplierTextEditingController.addressline1Controller.text,
    "off_address_line2": supplierTextEditingController.addressline2Controller.text,
    "off_town": supplierTextEditingController.cityController.text,
    "off_state":supplierTextEditingController. stateController.text,
    "off_pincode":supplierTextEditingController.pincodeController.text,
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SupplierFormPageTwo(data: data),
        ),
      );
    }
    final formKey = GlobalKey<FormState>();
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

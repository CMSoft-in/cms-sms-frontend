import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';
import '../suppliersviewdetails/supplier_view_details_two.dart';
import 'supplier_form_page_three.dart';

class SupplierFormPageTwo extends StatefulWidget {
class SupplierFormPageTwo extends StatefulWidget {
  const SupplierFormPageTwo({super.key, required this.data});

  final data;


  @override
  State<SupplierFormPageTwo> createState() => _SupplierFormPageTwoState();
}

class _SupplierFormPageTwoState extends State<SupplierFormPageTwo> {
   

  final formKey = GlobalKey<FormState>();

  SupplierTextEditingController supplierTextEditingController =
      SupplierTextEditingController();

  void navigateToPageThree(BuildContext context) {
    var oldData = widget.data;
    var updatedData = {
      ...oldData,
      "gst_no": supplierTextEditingController.gstController.text.isEmpty
          ? null
          : int.parse(supplierTextEditingController.gstController.text.trim()),
      "primary_contact_name":
          supplierTextEditingController.primaryNameController.text.isEmpty
              ? null
              : supplierTextEditingController.primaryNameController.text.trim(),
      "primary_contact_no": supplierTextEditingController
              .primaryPhoneNumberController.text.isEmpty
          ? null
          : int.parse(supplierTextEditingController
              .primaryPhoneNumberController.text
              .trim()),
      "primary_contact_email": supplierTextEditingController
              .primaryEmailController.text.isEmpty
          ? null
          : supplierTextEditingController.primaryEmailController.text.trim(),
      "primary_contact_whatsapp":
          supplierTextEditingController.primaryWhatsappController.text.isEmpty
              ? null
              : int.parse(supplierTextEditingController
                  .primaryWhatsappController.text
                  .trim()),
      "payment_timeline":
          supplierTextEditingController.timeLineController.text.isEmpty
              ? null
              : supplierTextEditingController.timeLineController.text.trim(),
    };
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SupplierFormPageThree(data: updatedData),
      ),
    );
  }

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
              const StackText(
                stacktext: supplierPage2,
        color: red,
              ),
              formSizebox15,
              SupplierViewDetailsTwo(
                  enabled: true,
                  gstController:supplierTextEditingController. gstController,
                  primaryEmailController:
                      supplierTextEditingController.primaryEmailController,
                  primaryNameController:
                      supplierTextEditingController.primaryNameController,
                  primaryPhoneNumberController:
                     supplierTextEditingController.primaryPhoneNumberController,
                  primaryWhatsappController:
                      supplierTextEditingController.primaryWhatsappController,
                  timeLineController: supplierTextEditingController.timeLineController),
                   formSizebox15,
                    bottomHeight,
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
          formKey: formKey,
          isEnabled: true,
          onPress: () => navigateToPageThree(context)),
      bottomNavigationBar: BottomSheetLogo(),
    );
  }
}

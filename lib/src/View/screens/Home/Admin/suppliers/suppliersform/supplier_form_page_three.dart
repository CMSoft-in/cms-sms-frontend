import 'package:flutter/material.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';
import '../suppliersviewdetails/supplier_view_details_three.dart';
import 'supplier_form_page_four.dart';

class SupplierFormPageThree extends StatelessWidget {
  const SupplierFormPageThree({super.key, required this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    var oldData = data;
    final formKey = GlobalKey<FormState>();
    SupplierTextEditingController supplierTextEditingController=SupplierTextEditingController();
    void navigateToPageFour(BuildContext context) {
      var updatedData = {
        ...oldData,
        "co_supplier_category_id": supplierTextEditingController.supplierCategoryController.text,
        "co_material_id":supplierTextEditingController.materialsSuppliedController.text,
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SupplierFormPageFour(data: updatedData),
        ),
      );
    }

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
              SupplierViewDetailsThree(
                  enabled: true,
                  materialsSuppliedController: supplierTextEditingController.materialsSuppliedController,
                  supplierCategoryController: supplierTextEditingController.supplierCategoryController),
                  formSizebox15,
                    bottomHeight, 
              
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
          formKey: formKey,
          isEnabled: true,
          onPress: () => navigateToPageFour(context)),
      bottomNavigationBar: BottomSheetLogo(),
    );
  }
}

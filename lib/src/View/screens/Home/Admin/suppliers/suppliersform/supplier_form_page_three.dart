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

class SupplierFormPageThree extends StatefulWidget {
  const SupplierFormPageThree({super.key, required this.data});
  final data;

  @override
  State<SupplierFormPageThree> createState() => _SupplierFormPageThreeState();
}

class _SupplierFormPageThreeState extends State<SupplierFormPageThree> {
  List<dynamic> comaterialCategoryId = [];
  final formKey = GlobalKey<FormState>();
  SupplierTextEditingController supplierTextEditingController =
      SupplierTextEditingController();
  int? coSupplierCategoryIds;
  void changeValue(int v) {
    setState(() {
      coSupplierCategoryIds = v;
    });
  }

  void changeMaterialValue(List<dynamic> v) {
    setState(() {
      comaterialCategoryId = v;
    });
  }

  void navigateToPageFour(BuildContext context) {
    var oldData = widget.data;
    var updatedData = {
      ...oldData,
      "co_supplier_category_id": [coSupplierCategoryIds],
      "co_material_id":
          comaterialCategoryId.isEmpty ? null : comaterialCategoryId,
    };
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SupplierFormPageFour(data: updatedData),
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
                stacktext: supplierPage3,
                color: red,
              ),
              formSizebox15,
              SupplierViewDetailsThree(
                  twoOrNot: false,
                  isMultiSelectDropDownEditing: true,
                  changeValue: changeValue,
                  coSupplierCategoryId: coSupplierCategoryIds,
                  changeMaterialValue: changeMaterialValue,
                  comaterialCategoryId: comaterialCategoryId.isNotEmpty
                      ? comaterialCategoryId.first
                      : null,
                  isEditing: true,
                  enabled: true,
                  materialsSuppliedController:
                      supplierTextEditingController.materialsSuppliedController,
                  supplierCategoryController:
                      supplierTextEditingController.supplierCategoryController),
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

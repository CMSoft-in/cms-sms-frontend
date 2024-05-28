import '../supplier_category_text.dart';
import '/src/View/widgets/CommonUsageForm/textformfeild/drop_down_form_field.dart';
import '../../../../../../Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';

class SupplierCategoryViewDetails extends StatelessWidget {
  const SupplierCategoryViewDetails({
    super.key,
    required this.enabled,
    required this.isEditing,
    required this.supplierCategoryController,
    required this.materialSuppliedController,
  });
  final bool enabled;
  final bool isEditing;
  final TextEditingController supplierCategoryController;
  final TextEditingController materialSuppliedController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          formSizebox10,
          isEditing
              ? DropDownForm(
                  dropdownItems: const [
                      "Supplier CateGory 1",
                      "Supplier CateGory 2",
                      "Supplier CateGory 3",
                      "Supplier CateGory 4"
                    ],
                  dropDownName: supplierCategoryText,
                  star: star,
                  optionalisEmpty: true,
                  controller: supplierCategoryController)
              : TextformField(
                  controller: supplierCategoryController,
                  text: supplierCategoryText,
                  star: star,
                  limitLength: 20,
                  optionalisEmpty: true,
                  inputformat: alphabatsAndNumbers,
                  inputtype: keyboardTypeNone,
                  enabled: enabled,
                ),
          formSizebox10,
          isEditing
              ? DropDownForm(
                  dropdownItems: const [
                      'Materials 1',
                      'Materials 2',
                      'Materials 3',
                      '1'
                    ],
                  dropDownName: materialSupplied,
                  star: star,
                  optionalisEmpty: true,
                  controller: materialSuppliedController)
              : TextformField(
                  controller: materialSuppliedController,
                  text: materialSupplied,
                  star: star,
                  limitLength: 20,
                  optionalisEmpty: true,
                  inputformat: alphabatsAndNumbers,
                  inputtype: keyboardTypeNone,
                  enabled: enabled,
                )
        ],
      ),
    );
  }
}

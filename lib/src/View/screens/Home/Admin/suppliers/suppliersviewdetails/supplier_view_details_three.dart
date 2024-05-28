import 'package:flutter/material.dart';

import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '../../../../../../Model/utility/supplier/supplier_text_const.dart';

class SupplierViewDetailsThree extends StatelessWidget {
  const SupplierViewDetailsThree({super.key,
  required this.enabled,
  required this.materialsSuppliedController,
  required this.supplierCategoryController});
  final TextEditingController supplierCategoryController;
  final TextEditingController materialsSuppliedController;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        formSizebox10,
        TextformField(
            controller: supplierCategoryController,
            text: supplierCategoryText,
            limitLength: 30,
            optionalisEmpty: true,
            inputformat: alphabatsAndNumbers,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: enabled),
        formSizebox10,
        TextformField(
            controller: materialsSuppliedController,
            text: supplierMaterialsSupplied,
            limitLength: 30,
            optionalisEmpty: true,
            inputformat: alphabatsAndNumbers,
            star: star,
            inputtype: keyboardTypeNone,
            enabled: enabled)
      ],
    );
  }
}

import 'package:flutter/material.dart';

class SupplierController {
  late final TextEditingController supplierNameController =
      TextEditingController();
  late final TextEditingController timeLineController = TextEditingController();
  late final TextEditingController materialsSuppliedController =
      TextEditingController();
  late final TextEditingController supplierCategoryController = TextEditingController();

}
SupplierController supplierController = SupplierController();
TextEditingController supplierNameController = supplierController.supplierNameController;
TextEditingController timeLineController = supplierController.timeLineController;
TextEditingController materialsSuppliedController = supplierController.materialsSuppliedController;


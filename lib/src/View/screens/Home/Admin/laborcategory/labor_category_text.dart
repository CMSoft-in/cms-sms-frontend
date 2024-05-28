import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const laborCategoryText = 'Labor Category';
const categorydistribution = 'Category Description';
const laborCategorydetails = 'Enter Labor Category Details';
const deletelaborCategory = 'Delete Labor Category';
const deleteLaborCategoryText = "Deleted Labor Category";
const deleteLaborCategoryDetailsText = "Deleted Labor Category Details";
const viewLaborCategoryDetailsText = "View Labor Category Details";
const editLaborCategoryDetailsText = "Edit Labor Category Details";

final TextEditingController laborCategoryController = TextEditingController();
final TextEditingController categorydistributionController =
    TextEditingController();

class LaborCategoryTextEditingController {
  final TextEditingController laborCategoryController = TextEditingController();
  final TextEditingController categorydistributionController =
      TextEditingController();
}

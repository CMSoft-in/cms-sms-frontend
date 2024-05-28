import "/src/View/screens/Home/Admin/machines&vechiles/m&vcommonusepages/m_v_common_use_page_four.dart";
import "package:flutter/material.dart";

class VechilesViewDetailsFour extends StatelessWidget {
  const VechilesViewDetailsFour(
      {super.key,
      required this.enabled,
      required this.insuranceExpiryDateController,
      required this.nextFCDateController,
      required this.isEditing
      });
  final bool enabled;
  final bool isEditing;
  final TextEditingController insuranceExpiryDateController;
  final TextEditingController nextFCDateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    MVCommonBasicFormFour(enabled: enabled,isEditing: isEditing, insuranceExpiryDateController: insuranceExpiryDateController, nextFCDateController: nextFCDateController)
      ],
    );
  }
}

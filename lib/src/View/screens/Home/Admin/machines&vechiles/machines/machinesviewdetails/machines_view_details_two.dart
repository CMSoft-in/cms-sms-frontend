import "/src/View/screens/Home/Admin/machines&vechiles/m&vcommonusepages/m_v_common_use_page_two.dart";
import "package:flutter/material.dart";
import "../../m_v_text.dart";

class MachinesViewDetailsTwo extends StatelessWidget {
  const MachinesViewDetailsTwo(
      {super.key,
      required this.enabled,
      required this.CompanyController,
      required this.ModelController,
      required this.yearofMakeController,
      });
  final bool enabled;
  final TextEditingController CompanyController;
 
  final TextEditingController ModelController;
   final TextEditingController yearofMakeController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      MVCommonBasicFormTwo(enabled: enabled, stackText: machineDetails, CompanyController: CompanyController, ModelController: ModelController, yearofMakeController: yearofMakeController)
      ],
    );
  }
}

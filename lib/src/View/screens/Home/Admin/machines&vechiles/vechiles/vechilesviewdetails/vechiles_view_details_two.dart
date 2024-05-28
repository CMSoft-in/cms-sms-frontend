import "/src/Model/Const/height_width.dart";
import "/src/Model/Const/text_const.dart";
import "/src/View/screens/Home/Admin/machines&vechiles/m&vcommonusepages/m_v_common_use_page_two.dart";
import "/src/View/widgets/CommonUsageForm/textformfeild/text_form_field.dart";
import "package:flutter/material.dart";
import "../../m_v_text.dart";

class VechilesViewDetailsTwo extends StatelessWidget {
  const VechilesViewDetailsTwo(
      {super.key,
      required this.enabled,
      required this.CompanyController,
      required this.ModelController,
      required this.yearofMakeController,
      required this.engineChassisNoController
      });
  final bool enabled;
  final TextEditingController CompanyController;
 final TextEditingController engineChassisNoController;
  final TextEditingController ModelController;
   final TextEditingController yearofMakeController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      MVCommonBasicFormTwo(enabled: enabled, stackText: vechileDetails, CompanyController: CompanyController, ModelController: ModelController, yearofMakeController: yearofMakeController)
      ,formSizebox10,
      TextformField(controller: engineChassisNoController, text: engineChassisNo, limitLength: 30, optionalisEmpty: true, inputformat: alphabatsAndNumbers, star: star, inputtype: keyboardTypeNone, enabled: enabled)
      ],
    );
  }
}

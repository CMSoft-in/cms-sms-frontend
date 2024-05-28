import '/src/Model/Const/height_width.dart';
import '/src/Model/general/address.dart';
import '/src/View/screens/Home/Admin/machines&vechiles/m&vcommonusepages/m_v_common_use_page_one.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Model/Const/color.dart';
import '../../../../../../../Model/Const/text_const.dart';
import '../../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../m_v_text.dart';


class VechilesViewDetailsOne extends StatelessWidget {
  const VechilesViewDetailsOne(
      {Key? key,
      required this.NameController,required this.secondNameController,
      required this.addressline1Controller,
      required this.addressline2Controller,
      required this.cityController,
      required this.pincodeController,
      required this.stateController,
      required this.enabled})
      : super(key: key);
       final TextEditingController NameController;
  final TextEditingController secondNameController;
  final TextEditingController addressline1Controller;
  final TextEditingController addressline2Controller;
  final TextEditingController cityController;
  final TextEditingController pincodeController;
  final TextEditingController stateController;

  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
       formSizebox10,
      MVCommonBasicFormOne(enabled: enabled, NameController: NameController, secondNameController: secondNameController, nameOne: vehicleRegistrationNo, nameTwo: ownerName)
     , formSizebox10,
      const StackText(
        stacktext: OwnerAddress,
        color: grey,
      ),
     Address(addressline1OptionalisEmpty: true,
     addressline2OptionalisEmpty: false,
     cityOptionalisEmpty: true,
     pincodeOptionalisEmpty: true,
     stateOptionalisEmpty: true,
     star:star,
     estar: estar,enabled: enabled, addressline1Controller: addressline1Controller, addressline2Controller: addressline2Controller, cityController: cityController, pincodeController: pincodeController, stateController: stateController)
    ]);
  }
}

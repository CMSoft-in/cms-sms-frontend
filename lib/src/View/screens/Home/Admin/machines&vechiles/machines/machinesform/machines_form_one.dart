import '../../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../../widgets/Buttons/next_back_button.dart';
import '/src/Model/Const/height_width.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Model/Const/color.dart';
import '../../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../m_v_text.dart';
import '../machinesviewdetails/machines_view_details_one.dart';
import 'machines_form_two.dart';


class MachinesFormPageOne extends StatelessWidget {
  const MachinesFormPageOne(
      {Key? key,
      
      })
      : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final formKey=GlobalKey<FormState>();
    MachinesTextEditingController machinesTextEditingController=MachinesTextEditingController();
    void navigateToPageTwo(BuildContext context) {
      var updatedData = {
      "co_machine_no": machinesTextEditingController.nameController.text,      
    "owner_first_name": machinesTextEditingController.secondNameController.text,
       "off_address_line1":  machinesTextEditingController.addressline1Controller.text,
        "off_address_line2":  machinesTextEditingController.addressline2Controller.text,
        "city":  machinesTextEditingController.cityController.text,
        "state":  machinesTextEditingController.stateController.text,
        "pincode":  machinesTextEditingController.pincodeController.text,
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MachinesFormPageTwo(data: updatedData),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child:
              Center(
                child: Form(
                  key: formKey,
                  child:Column(children: [
                     formSizebox8,
                      const StackText(
                        stacktext: mvpage1,
                        color: red,
                      ),
                      formSizebox15,
      MachineViewDetailsOne(NameController:machinesTextEditingController. nameController,
       secondNameController: machinesTextEditingController.secondNameController, 
       addressline1Controller: machinesTextEditingController.addressline1Controller,
        addressline2Controller:machinesTextEditingController. addressline2Controller,
         cityController:machinesTextEditingController. cityController,
          pincodeController:machinesTextEditingController. pincodeController,
           stateController: machinesTextEditingController.stateController,
            enabled: true)
      ]),)))),
       bottomSheet: BackNextButton(
          formKey: formKey,
          isEnabled: true,
          onPress: () => navigateToPageTwo(context)),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

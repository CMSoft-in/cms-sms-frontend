import 'package:cmssms/src/Model/Const/image_const.dart';
import 'package:cmssms/src/View/screens/Home/Admin/machines&vechiles/machines/machinesdataview/machines_data_view.dart';
import 'package:cmssms/src/View/screens/Home/Admin/machines&vechiles/vechiles/vechilesdataview/vechiles_data_view.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../widgets/AppBar/AppBar.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../AdminScreen/AdminElevatedButton.dart';
import 'package:flutter/material.dart';

class MachinesAndVechiles extends StatefulWidget {
  const MachinesAndVechiles({
    Key? key,
  }) : super(key: key);

  @override
  State<MachinesAndVechiles> createState() => _MachinesAndVechiles();
}
class _MachinesAndVechiles extends State<MachinesAndVechiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
  appBar: const BuildAppBar(),
  body: Center(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          adminSizeboxHeight,
          BuildElevatedButton(
            icon: machines,
            label: titleMachines,
            onPressed: MachinesDataView(),
          ),
          adminSizeboxHeight,
          BuildElevatedButton(
            icon: vechicle,
            label: titleVechicles,
            onPressed: VechilesDataView(),
          ),
        ],
      ),
    ),
  ),
  bottomSheet: BottomSheetLogo(),
);

  }   
}
   
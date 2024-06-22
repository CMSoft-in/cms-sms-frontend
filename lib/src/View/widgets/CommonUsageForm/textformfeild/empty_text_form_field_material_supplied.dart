import 'package:flutter/material.dart';
import '../../../../Model/Const/height_width.dart';
import '../../../../Model/Const/text_const.dart';
import '../../../screens/Home/Admin/suppliers/materialsuppliedselection.dart';


class EmptyTextformFieldMaterialSupplied extends StatefulWidget {
  const EmptyTextformFieldMaterialSupplied(
      {super.key,
      this.changeAddedDeletedItems,
      this.materialSupplied,
      required this.controller,
      required this.text,
      required this.optionalisEmpty,
      required this.enabled,
      required this.changeMateralSupplied});

  final Function? changeAddedDeletedItems;
  final TextEditingController controller;
  final String text;
  final bool optionalisEmpty;
  final bool enabled;
  final Function? changeMateralSupplied;
  final List? materialSupplied;

  @override
  State<EmptyTextformFieldMaterialSupplied> createState() =>
      _EmptyTextformFieldMaterialSuppliedState();
}

class _EmptyTextformFieldMaterialSuppliedState
    extends State<EmptyTextformFieldMaterialSupplied> {
  List<Map<String, dynamic>> materialSuppliedLists = [];

  void _goMaterialSuppliedPage() async {
    final List<Map<String, dynamic>> getMaterialSuppliedList =
        await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MatterialSuppliedSelection(
          changeAddedDeletedItems: widget.changeAddedDeletedItems,
          materialSupplied: widget.materialSupplied,
          changeMateralSupplied: widget.changeMateralSupplied,
          materialSuppliedLists: materialSuppliedLists,
        ),
      ),
    );

    setState(() {
      print(getMaterialSuppliedList);
      if (getMaterialSuppliedList.isEmpty) {
        widget.controller.text = "Material Supplier Not Allocated";
      } else {
        widget.controller.text = "Material Supplier Allocated";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: primaryWidth,
      child: TextFormField(
        readOnly: true,
        onTap: _goMaterialSuppliedPage,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.text,
                  style: textStyleGrey18,
                ),
                const TextSpan(
                  style: textStyleRedStar,
                ),
              ],
            ),
          ),
          errorStyle: const TextStyle(color: Colors.red),
        ),
        validator: validMethod,
        controller: widget.controller,
        enabled: widget.enabled,
        style: textStyleBlack18,
      ),
    );
  }

  String? validMethod(value) {
    if (widget.optionalisEmpty) {
      if (value == null || value.isEmpty) {
        return "Please enter ${widget.text == '+91-' ? 'Phone Number' : widget.text}";
      }
    }
    return null;
  }
}

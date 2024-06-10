import 'package:flutter/material.dart';
import '../../../../Model/Const/height_width.dart';
import '../../../../Model/Const/text_const.dart';
import '../../../screens/Home/Admin/suppliers/materialsuppliedselection.dart';
import '../../AlloctationPage/allocation_page.dart';

class EmptyTextformFieldMaterialSupplied extends StatefulWidget {
  const EmptyTextformFieldMaterialSupplied({
    super.key,
    required this.controller,
    required this.text,
    required this.optionalisEmpty,
    required this.enabled,
    required this.materialSuppliedLists,
  });

  final TextEditingController controller;
  final String text;
  final bool optionalisEmpty;
  final bool enabled;
  final List<int> materialSuppliedLists;

  @override
  State<EmptyTextformFieldMaterialSupplied> createState() =>
      _EmptyTextformFieldMaterialSuppliedState();
}

class _EmptyTextformFieldMaterialSuppliedState
    extends State<EmptyTextformFieldMaterialSupplied> {
  List<int> materialSuppliedLists = [];

  void _goMaterialSuppliedPage() async {
    var getMaterialSuppliedList = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MatterialSuppliedSelection(
          materialSuppliedLists: materialSuppliedLists,
        ),
      ),
    );

    if (getMaterialSuppliedList != null && getMaterialSuppliedList.isNotEmpty) {
      setState(() {
        materialSuppliedLists = List<int>.from(getMaterialSuppliedList);
        widget.controller.text = "Material Allocated";
      });
    } else {
      setState(() {
        widget.controller.text = "Material Supplierd Allocated";
      });
    }
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

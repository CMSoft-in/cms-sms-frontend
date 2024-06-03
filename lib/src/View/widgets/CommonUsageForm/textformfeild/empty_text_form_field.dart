import 'package:flutter/material.dart';
import '../../../../Model/Const/height_width.dart';
import '../../../../Model/Const/text_const.dart';
import '../../AlloctationPage/allocation_page.dart';

class EmptyTextformField extends StatefulWidget {
  const EmptyTextformField({
    super.key,
    required this.controller,
    required this.text,
    required this.optionalisEmpty,
    required this.enabled,
    required this.labourAllocationLists,
  });

  final TextEditingController controller;
  final String text;
  final bool optionalisEmpty;
  final bool enabled;
  final List<int> labourAllocationLists;

  @override
  State<EmptyTextformField> createState() => _EmptyTextformFieldState();
}

class _EmptyTextformFieldState extends State<EmptyTextformField> {
  List<int> labourAllocationLists = [];

  void _goAllocationPage() async {
    var getlabourAllocationList = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllocationPage(
          labourAllocationList: labourAllocationLists,
        ),
      ),
    );

    if (getlabourAllocationList != null && getlabourAllocationList.isNotEmpty) {
      setState(() {
        labourAllocationLists = List<int>.from(getlabourAllocationList);
        widget.controller.text = "Labour Allocated";
      });
    } else {
      setState(() {
        widget.controller.text = "Labour not Allocated";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: primaryWidth,
      child: TextFormField(
        readOnly: true,
        onTap: _goAllocationPage,
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

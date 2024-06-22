import 'package:cmssms/src/Model/Const/color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../Model/api/api_model.dart';
import '../../../../../Model/api/local.dart';
import '../../../../widgets/Buttons/custom_button.dart';

class MatterialSuppliedSelection extends StatefulWidget {
  const MatterialSuppliedSelection(
      {Key? key,
      this.changeAddedDeletedItems,
      this.materialSupplied,
      required this.changeMateralSupplied,
      this.materialSuppliedLists})
      : super(key: key);
  final List? materialSuppliedLists;
  final Function? changeMateralSupplied;
  final List? materialSupplied;
  final Function? changeAddedDeletedItems;

  @override
  MatterialSuppliedSelectionState createState() =>
      MatterialSuppliedSelectionState();
}

class MatterialSuppliedSelectionState
    extends State<MatterialSuppliedSelection> {
  List<Map<String, dynamic>> materialsData = [];
  Map<String, List<Map<String, dynamic>>> materialDict = {};
  List<Map<String, dynamic>> selectedItems = [];
  List<Map<String, dynamic>> realSelectedItems = [];
  List<Map<String, dynamic>> initialSelectedItems = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void getData() {
    materialDict.clear();
    for (var item in materialsData) {
      String materialName = item["co_material_name"];
      Map<String, dynamic> variantInfo = {
        "co_material_id": item["co_material_id"],
        "co_material_name": materialName,
        "material_variant": item["material_variant"]
      };
      if (!materialDict.containsKey(materialName)) {
        materialDict[materialName] = [];
      }
      materialDict[materialName]!.add(variantInfo);
    }
  }

  Future<void> fetchData() async {
    String apiUrl = ApiEndpoints.getAllMaterials;
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> parsedJson = jsonDecode(response.body);
        List<Map<String, dynamic>> materials =
            List<Map<String, dynamic>>.from(parsedJson);
        setState(() {
          materialsData = materials;
          getData();
          preselectItems();
        });
      } else {
        throw Exception('Failed to load materials');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void preselectItems() {
    if (widget.materialSupplied != null) {
      for (var suppliedItem in widget.materialSupplied!) {
        for (var item in materialsData) {
          if (suppliedItem["co_material_id"] == item["co_material_id"] &&
              suppliedItem["material_variant"] == item["material_variant"]) {
            selectedItems.add(item);
          }
        }
      }
    }
    initialSelectedItems = List.from(selectedItems);
  }

  void onPress() {
    List<Map<String, dynamic>> addedItems = [];
    List<Map<String, dynamic>> removedItems = [];

    for (var item in selectedItems) {
      if (!initialSelectedItems.contains(item)) {
        addedItems.add(item);
      }
    }

    for (var item in initialSelectedItems) {
      if (!selectedItems.contains(item)) {
        removedItems.add(item);
      }
    }

    if (widget.changeAddedDeletedItems != null) {
      widget.changeAddedDeletedItems!(addedItems, removedItems);
    }
    
    if (widget.changeMateralSupplied != null) {
      widget.changeMateralSupplied!(selectedItems);
    }

    setState(() {
      print("working ");
      if (widget.materialSupplied != null) {
        widget.materialSupplied!.removeWhere((item) => removedItems.any(
            (removed) =>
                removed["co_material_id"] == item["co_material_id"] &&
                removed["material_variant"] == item["material_variant"]));
        widget.materialSupplied!.addAll(addedItems);
      }
      realSelectedItems = selectedItems;
    });
    Navigator.pop(context, realSelectedItems);
  }

  Future<bool> onWillPop() async {
    Navigator.pop(context, realSelectedItems);
    return Future.value(false);
  }

  void updateSelectedItems(
      String materialName, List<Map<String, dynamic>> variants) {
    setState(() {
      selectedItems
          .removeWhere((item) => item['co_material_name'] == materialName);
      selectedItems.addAll(variants);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Material Supplied Selection'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: materialsData.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: materialDict.length,
                            itemBuilder: (context, index) {
                              String materialName =
                                  materialDict.keys.elementAt(index);
                              List<Map<String, dynamic>> variants =
                                  materialDict[materialName]!;
                              return MaterialListItem(
                                materialName: materialName,
                                variants: variants,
                                onSelectionChanged: updateSelectedItems,
                                selectedItems: selectedItems,
                              );
                            },
                          ),
                        ),
                      ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomButton(
                    backgroundColor: red,
                    buttonText: "Save",
                    onPressEvent: onPress,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class MaterialListItem extends StatefulWidget {
  final String materialName;
  final List<Map<String, dynamic>> variants;
  final Function(String materialName, List<Map<String, dynamic>> variants)?
      onSelectionChanged;
  final List<Map<String, dynamic>> selectedItems;

  const MaterialListItem({
    required this.materialName,
    required this.variants,
    Key? key,
    this.onSelectionChanged,
    required this.selectedItems,
  }) : super(key: key);

  @override
  _MaterialListItemState createState() => _MaterialListItemState();
}

class _MaterialListItemState extends State<MaterialListItem> {
  bool _isExpanded = false;
  bool _isSelected = false;
  List<bool> _variantCheckedState = [];

  @override
  void initState() {
    super.initState();
    _variantCheckedState =
        List.generate(widget.variants.length, (index) => false);
    _initializeCheckedState();
  }

  void _initializeCheckedState() {
    for (int i = 0; i < widget.variants.length; i++) {
      for (var selectedItem in widget.selectedItems) {
        if (widget.variants[i]["co_material_id"] ==
                selectedItem["co_material_id"] &&
            widget.variants[i]["material_variant"] ==
                selectedItem["material_variant"]) {
          _variantCheckedState[i] = true;
          _isSelected = true;
        }
      }
    }
  }

  void _updateSelection() {
    List<Map<String, dynamic>> selectedVariants = [];
    for (int i = 0; i < widget.variants.length; i++) {
      if (_variantCheckedState[i]) {
        selectedVariants.add(widget.variants[i]);
      }
    }
    if (widget.onSelectionChanged != null) {
      widget.onSelectionChanged!(widget.materialName, selectedVariants);
    } else {
      print("Error: onSelectionChanged is null");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            color: const Color.fromARGB(0, 207, 202, 202),
            child: Row(
              children: [
                Checkbox(
                  value: _isSelected,
                  onChanged: (value) {
                    setState(() {
                      _isSelected = value!;
                      for (int i = 0; i < _variantCheckedState.length; i++) {
                        _variantCheckedState[i] = _isSelected;
                      }
                      _updateSelection();
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    widget.materialName,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Column(
            children: widget.variants.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> variant = entry.value;

              return CheckboxListTile(
                title: Text(variant['material_variant']),
                value: _variantCheckedState[index],
                onChanged: (value) {
                  setState(() {
                    _variantCheckedState[index] = value!;
                    _updateSelection();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              );
            }).toList(),
          ),
      ],
    );
  }
}

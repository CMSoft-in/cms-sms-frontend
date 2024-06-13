import 'package:cmssms/src/Model/Const/color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../Model/api/api_model.dart';
import '../../../../../Model/api/local.dart';
import '../../../../widgets/Buttons/custom_button.dart';

class MatterialSuppliedSelection extends StatefulWidget {
  const MatterialSuppliedSelection({Key? key, this.materialSuppliedLists})
      : super(key: key);
  final List? materialSuppliedLists;

  @override
  MatterialSuppliedSelectionState createState() =>
      MatterialSuppliedSelectionState();
}

class MatterialSuppliedSelectionState
    extends State<MatterialSuppliedSelection> {
  List<Map<String, dynamic>> materialsData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
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
          print(materials);
          materialsData = materials;
        });
      } else {
        throw Exception('Failed to load materials');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  void onPress() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          itemCount: materialsData.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> materialData =
                                materialsData[index];
                            String materialName =
                                materialData['co_material_name'];
                            List<Map<String, dynamic>> variants = [
                              materialData
                            ];
                            for (int i = index + 1;
                                i < materialsData.length;
                                i++) {
                              if (materialsData[i]['co_material_name'] ==
                                  materialName) {
                                variants.add(materialsData[i]);
                              }
                            }

                            return MaterialListItem(
                              materialName: materialName,
                              variants: variants,
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
    );
  }
}

class MaterialListItem extends StatefulWidget {
  final String materialName;
  final List<Map<String, dynamic>> variants;

  const MaterialListItem({
    required this.materialName,
    required this.variants,
    Key? key,
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

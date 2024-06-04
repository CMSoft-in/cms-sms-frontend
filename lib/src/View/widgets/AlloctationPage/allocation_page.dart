import 'dart:convert';
import 'package:cmssms/src/Model/Const/text_const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Model/api/api_model.dart';
import '../../../Model/api/local.dart';

class CheckboxItem {
  int id;
  String name;
  bool isChecked;

  CheckboxItem({required this.id, required this.name, this.isChecked = false});
}

class AllocationPage extends StatefulWidget {
  const AllocationPage({Key? key, required this.labourAllocationList})
      : super(key: key);
  final List<int> labourAllocationList;

  @override
  State<AllocationPage> createState() => _AllocationPageState();
}

class _AllocationPageState extends State<AllocationPage> {
  bool isLoading = true;
  List data = [];
  List<CheckboxItem> availableData = [];
  List<CheckboxItem> allocatedData = [];
  late List<int> allocatedDataId;

  @override
  void initState() {
    super.initState();
    allocatedDataId = widget.labourAllocationList;
    fetchLabourNames();
  }

  void fetchLabourNames() async {
    String url = ApiEndpoints.getAllLabours;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        setState(() {
          data = body;
          availableData = data
              .map((e) => CheckboxItem(
                    id: e["co_labour_id"],
                    name: "${e["first_name"]} ${e["last_name"]}",
                  ))
              .toList();
          updateAllocatedData();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  void updateAllocatedData() {
    setState(() {
      allocatedData = availableData
          .where((item) => allocatedDataId.contains(item.id))
          .toList();
      for (var item in allocatedData) {
        item.isChecked = true;
      }
    });
  }

  void setAllocatedData() {
    setState(() {
      allocatedData = availableData.where((item) => item.isChecked).toList();
      allocatedDataId = allocatedData.map((item) => item.id).toList();
    });
  }

  void dropAllocatedData() {
    setState(() {
      allocatedData = availableData.where((item) => item.isChecked).toList();
      allocatedDataId = allocatedData.map((item) => item.id).toList();
    });
  }

  void saveLaboursAllocation() {
    Navigator.pop(context, allocatedDataId);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double availableBoxContainer = (screenWidth * 0.48) - 8;
    return Scaffold(
      appBar: AppBar(title: const Text("Labour List"), actions: [
        TextButton.icon(
          onPressed: () {
            saveLaboursAllocation();
          },
          icon: const Icon(Icons.save),
          label: const Text('Save'),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: availableBoxContainer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(child: Text("Available",style: textStyle20)),

                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: screenHeight - (screenHeight * 0.20),
                            width: availableBoxContainer,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: const Color.fromARGB(255, 14, 5, 5),
                                width: 1.0,
                              ),
                            ),
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.builder(
                                    itemCount: availableData.length,
                                    itemBuilder: (context, index) {
                                      return CheckboxListTile(
                                        title: Text(availableData[index].name),
                                        value: availableData[index].isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            availableData[index].isChecked =
                                                value!;
                                          });
                                        },
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right), // The icon
                    iconSize: 25.0,
                    color: Colors.white, // Color of the icon
                    onPressed: () {
                      setAllocatedData();
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.chevron_left), // The icon
                    color: Colors.white, // Color of the icon
                    onPressed: () {
                      dropAllocatedData();
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: availableBoxContainer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(child: Text("Allocated",style: textStyle20)),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: screenHeight - (screenHeight * 0.20),
                            width: availableBoxContainer,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: const Color.fromARGB(255, 14, 5, 5),
                                width: 1.0,
                              ),
                            ),
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.builder(
                                    itemCount: allocatedData.length,
                                    itemBuilder: (context, index) {
                                      return CheckboxListTile(
                                        title: Text(allocatedData[index].name),
                                        value: allocatedData[index].isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            allocatedData[index].isChecked =
                                                value!;
                                          });
                                        },
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

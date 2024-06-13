import 'package:flutter/material.dart';
import 'src/View/screens/Home/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Site Management Software',
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Expandable Material List"),
//         ),
//         body: const MaterialList(),
//       ),
//     );
//   }
// }

// class MaterialList extends StatefulWidget {
//   const MaterialList({super.key});

//   @override
//   _MaterialListState createState() => _MaterialListState();
// }

// class _MaterialListState extends State<MaterialList> {
//   List<String> materials = [
//     "Wood",
//     "Metal",
//     "Plastic",
//     "Glass",
//   ];

//   Map<String, List<String>> variants = {
//     "Wood": ["Pine", "Oak", "Maple", "Cherry"],
//     "Metal": ["Steel", "Aluminum", "Copper", "Brass"],
//     "Plastic": ["Polyethylene", "Polypropylene", "PVC", "ABS"],
//     "Glass": [
//       "Float Glass",
//       "Tempered Glass",
//       "Laminated Glass",
//       "Frosted Glass"
//     ],
//   };

//   Map<String, Map<String, bool>> checkedVariants = {
//     "Wood": {"Pine": false, "Oak": false, "Maple": false, "Cherry": false},
//     "Metal": {
//       "Steel": false,
//       "Aluminum": false,
//       "Copper": false,
//       "Brass": false
//     },
//     "Plastic": {
//       "Polyethylene": false,
//       "Polypropylene": false,
//       "PVC": false,
//       "ABS": false
//     },
//     "Glass": {
//       "Float Glass": false,
//       "Tempered Glass": false,
//       "Laminated Glass": false,
//       "Frosted Glass": false
//     },
//   };

//   Map<String, bool> expandedStates = {
//     "Wood": false,
//     "Metal": false,
//     "Plastic": false,
//     "Glass": false,
//   };

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: materials.length,
//       itemBuilder: (context, index) {
//         String material = materials[index];
//         bool isExpanded = expandedStates[material] ?? false;
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               title: Text(material),
//               onTap: () {
//                 setState(() {
//                   expandedStates[material] = !isExpanded;
//                 });
//               },
//             ),
//             if (isExpanded)
//               Column(
//                 children: variants[material]!
//                     .map((variant) => CheckboxListTile(
//                           title: Text(variant),
//                           value: checkedVariants[material]![variant],
//                           onChanged: (value) {
//                             setState(() {
//                               checkedVariants[material]![variant] = value!;
//                             });
//                           },
//                           controlAffinity: ListTileControlAffinity.leading,
//                           contentPadding:
//                               const EdgeInsets.symmetric(horizontal: 16.0),
//                         ))
//                     .toList(),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'src/Model/api/api_model.dart';
// import 'src/Model/api/local.dart';
// import 'src/View/screens/Home/Admin/suppliers/suppliersform/supplier_form_page_three.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Expandable Checkbox List"),
//         ),
//         body: const SupplierFormPageThree(data: "",),
//       ),
//     );
//   }
// }

// class MaterialList extends StatefulWidget {
//   const MaterialList({Key? key, this.materialSuppliedLists}) : super(key: key);
//    final List? materialSuppliedLists;

//   @override
//   _MaterialListState createState() => _MaterialListState();
// }

// class _MaterialListState extends State<MaterialList> {
//   List<Map<String, dynamic>> materialsData = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//   String apiUrl = ApiEndpoints.getAllMaterials;

//     try {
//       final response = await http.get(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       );
//       if (response.statusCode == 200) {
//         List<dynamic> parsedJson = jsonDecode(response.body);
//         List<Map<String, dynamic>> materials =
//             List<Map<String, dynamic>>.from(parsedJson);

//         setState(() {
//           materialsData = materials;
//         });
//       } else {
//         throw Exception('Failed to load materials');
//       }
//     } catch (e) {
//       // Handle error
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return materialsData.isEmpty
//         ? const Center(child: CircularProgressIndicator())
//         : ListView.builder(
//             itemCount: materialsData.length,
//             itemBuilder: (context, index) {
//               Map<String, dynamic> materialData = materialsData[index];
//               String materialName = materialData['co_material_name'];
//               List<Map<String, dynamic>> variants = [materialData];
//               for (int i = index + 1; i < materialsData.length; i++) {
//                 if (materialsData[i]['co_material_name'] == materialName) {
//                   variants.add(materialsData[i]);
//                 }
//               }

//               return MaterialListItem(
//                 materialName: materialName,
//                 variants: variants,
//               );
//             },
//           );
//   }
// }

// class MaterialListItem extends StatefulWidget {
//   final String materialName;
//   final List<Map<String, dynamic>> variants;

//   const MaterialListItem({
//     required this.materialName,
//     required this.variants,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _MaterialListItemState createState() => _MaterialListItemState();
// }

// class _MaterialListItemState extends State<MaterialListItem> {
//   bool _isExpanded = false;
//   bool _isSelected = false;
//   List<bool> _variantCheckedState = [];

//   @override
//   void initState() {
//     super.initState();
//     _variantCheckedState =
//         List.generate(widget.variants.length, (index) => false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               _isExpanded = !_isExpanded;
//             });
//           },
//           child: Container(
//             color: Colors.transparent,
//             child: Row(
//               children: [
//                 Checkbox(
//                   value: _isSelected,
//                   onChanged: (value) {
//                     setState(() {
//                       _isSelected = value!;
//                       for (int i = 0; i < _variantCheckedState.length; i++) {
//                         _variantCheckedState[i] = _isSelected;
//                       }
//                     });
//                   },
//                 ),
//                 Expanded(
//                   child: Text(
//                     widget.materialName,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (_isExpanded)
//           Column(
//             children: widget.variants.asMap().entries.map((entry) {
//               int index = entry.key;
//               Map<String, dynamic> variant = entry.value;

//               return CheckboxListTile(
//                 title: Text(variant['material_variant']),
//                 value: _variantCheckedState[index],
//                 onChanged: (value) {
//                   setState(() {
//                     _variantCheckedState[index] = value!;
//                   });
//                 },
//                 controlAffinity: ListTileControlAffinity.leading,
//               );
//             }).toList(),
//           ),
//       ],
//     );
//   }
// }

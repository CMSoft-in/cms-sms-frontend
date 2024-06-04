import 'package:flutter/material.dart';
import 'src/View/screens/Home/Admin/Sites/SiteFormPage/site_form_three.dart';
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
      // home: const SiteFormPageThree(
      //   data: {},
      // ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

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
//           title: const Text('Dynamic Checkbox List with API Call'),
//         ),
//         body: const CheckboxList(),
//       ),
//     );
//   }
// }

// class CheckboxItem {
//   int id;
//   String name;
//   bool isChecked;

//   CheckboxItem({required this.id, required this.name, this.isChecked = false});
// }

// class CheckboxList extends StatefulWidget {
//   const CheckboxList({super.key});

//   @override
//   _CheckboxListState createState() => _CheckboxListState();
// }

// class _CheckboxListState extends State<CheckboxList> {

//   List<CheckboxItem> items = [
//     CheckboxItem(id: 1, name: "gowtham"),
//     CheckboxItem(id: 2, name: "gowtham"),
//     CheckboxItem(id: 3, name: "gowtham"),
//   ];

//   Future<void> _submitSelectedItems() async {
//     // Collect selected IDs
//     List<int> selectedIds =
//         items.where((item) => item.isChecked).map((item) => item.id).toList();

//     // API endpoint
//     String url = 'https://yourapiendpoint.com/submit';

//     print(selectedIds);

//     // Payload
//     Map<String, dynamic> payload = {
//       'selectedIds': selectedIds,
//     };


//     // Making the API call
//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(payload),
//       );

//       if (response.statusCode == 200) {
//         // Success response
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Submission successful')),
//         );
//       } else {
//         // Error response
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Failed to submit')),
//         );
//       }
//     } catch (e) {
//       // Exception
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('An error occurred')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               return CheckboxListTile(
//                 title: Text(items[index].name),
//                 value: items[index].isChecked,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     items[index].isChecked = value!;
//                   });
//                 },
//               );
//             },
//           ),
//         ),
//         ElevatedButton(
//           onPressed: _submitSelectedItems,
//           child: const Text('Submit'),
//         ),
//       ],
//     );
//   }
// }

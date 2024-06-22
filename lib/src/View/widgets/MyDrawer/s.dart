// // // import 'package:flutter/material.dart';

// // // import '../AppBar/AppBar.dart';

// // // import '../BottomLogo/bottomLogo.dart';
// // // import '../Const/image_const.dart';

// // // import 'my_drawer.dart';

// // // class summ extends StatelessWidget {
// // //   const summ({Key? key}) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: const BuildAppBar(),
// // //       drawer: const MyDrawer(),
// // //       body: Center(
// // //           child:
// // //               Stack(children: [Image.asset(titleImage), const BottomLogo()])),
// // //     );
// // //   }
// // // }
// // ListView.builder(
// //   itemCount: data.length,
// //   itemBuilder: (context, index) {
// //     return DataItem(name: data[index][0], primaryNumber: data[index][1]);
// //   },
// // ),
// // import 'package:flutter/material.dart';

// // class bottom extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Bottom Sheet Example'),
// //         ),
// //         body: Center(
// //           child: ElevatedButton(
// //             onPressed: () {
// //               showModalBottomSheet(
// //                 context: context,
// //                 builder: (BuildContext context) {
// //                   return Container(
// //                     height: 200, // Set the height of the bottom sheet here
// //                     child: Center(
// //                       child: Text('This is a bottom sheet'),
// //                     ),
// //                   );
// //                 },
// //               );
// //             },
// //             child: Text('Show Bottom Sheet'),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// // import 'package:cmssms/src/View/widgets/CommonUsageForm/DataViewHeaderItem/data_header.dart';

// // import '../../../Model/Const/color.dart';
// // import '../../../Model/Const/height_width.dart';
// // import '../../../Model/Const/padding_const.dart';
// // import '../../../Model/EmptyDataScreenView/empty_image.dart';
// // import '../../../Model/utility/client/client_text_const.dart';
// // import '../AppBar/AppBar.dart';
// // import '../BottomLogo/bottom_sheet_logo.dart';
// // import '/src/Model/api/local.dart';

// // import 'package:flutter/material.dart';

// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // import 'my_drawer.dart';

// // class DataView extends StatefulWidget {
// //   const DataView({
// //     Key? key,
// //     required this.dataTableNameOne,
// //     required this.dataTableNameTwo,
// //     required this.uri,
// //     required this.id,
// //     required this.name,
// //     required this.number,
// //     required this.doubleStar,
// //     required this.navigatePage,
// //     required this.bottomsheet,
// //     required this.header,
// //     required this.image,

// //   }) : super(key: key);

// //   final dataTableNameOne;
// //   final dataTableNameTwo;
// //   final uri;
// //   final id;
// //   final name;
// //   final number;
// //   final image;
// //   final header;
// //   final doubleStar;
// //   final navigatePage;
// //   final bottomsheet;

// //   @override
// //   _DataViewState createState() => _DataViewState();
// // }

// // class _DataViewState extends State<DataView> {
// //   var data = [];
// //   bool isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchData();
// //   }

// //   Future<void> fetchData() async {
// //     try {
// //       final response = await http.get(
// //         Uri.parse(widget.uri),
// //         headers: {
// //           'Authorization': 'Bearer $token',
// //         },
// //       );
// //       if (response.statusCode == 200) {
// //         print(jsonDecode(response.body));
// //         setState(() {
// //           data = jsonDecode(response.body);
// //           isLoading = false;
// //         });
// //       } else {
// //         print('Error fetching data: ${response.statusCode}');

// //         throw Exception('Failed to load data');
// //       }
// //     } catch (error) {
// //       print('Error fetching data: $error');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: const BuildAppBar(),
// //       drawer: MyDrawer(context: context),
// //       body: Container(
// //         color: Colors.white,
// //         child: Stack(children: [
// //           widget.header,
// //              data.isEmpty ? Center(
// //                 child: isLoading
// //                     ? const CircularProgressIndicator()
// //                     :
// //                         Center(child: EmptyDataImage(image: widget.image))

// //               ):
// //           SingleChildScrollView(
// //           child:Column(
// //             children: [
// //                 widget.header,
// //                  DataHeader(
// //                             titlename: widget.dataTableNameOne,
// //                             dataTableNameTwo: widget.dataTableNameTwo,
// //                           ),
// //                 ...data
// //                   .map(
// //                     (item) => DataItem(

// //                       navigatePage: () => widget.navigatePage(item[widget.id]),
// //                       name: item[widget.name],
// //                       doubleStar: widget.doubleStar,
// //                       primaryNumber: item[widget.number].toString(),
// //                     ),
// //                   )
// //                   .toList(),
// //               bottomHeight,
// //             ],
// //           ),

// //         ),
// //         ],)
// //       ),
// //       bottomSheet: widget.bottomsheet,
// //       bottomNavigationBar: const BottomSheetLogo(),
// //     );
// //   }
// // }

// // class DataItem extends StatelessWidget {
// //   const DataItem(
// //       {Key? key,
// //       required this.name,
// //       required this.primaryNumber,
// //       required this.doubleStar,
// //       required this.navigatePage,
// //       })
// //       : super(key: key);
// //   final doubleStar;
// //   final name;

// //   final primaryNumber;
// //   final navigatePage;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         border: Border.all(color: grey),
// //         color: white,
// //       ),
// //       width: double.infinity,
// //     height: 50,
// //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// //        Expanded(
// //          child:
// //         //  TwoDataNameOne(navigatePage, doubleStar, name)
// //          Padding(
// //             padding:left30,
// //             child: GestureDetector(
// //               onTap: () {
// //                navigatePage();
// //               },
// //               child: Text(
// //                 doubleStar+name,
// //                 style: datatableblack16,
// //               ),
// //             ),
// //           ),

// //        ),
// //            Expanded(
// //              child: Text(
// //               primaryNumber,
// //               style: datatableblack16,
// //                        ),
// //            ),
// //         Expanded(
// //           child: Padding(
// //             padding:right25,
// //             child: Text(
// //               primaryNumber,
// //               style: datatableblack16,
// //             ),
// //           ),
// //         )
// //       ]),
// //     );
// //   }
// // }

// // Widget TwoDataNameOne(navigatePage,doubleStar,name){
// //   return Column(
// //            children: [
// //              Padding(
// //                 padding:left30,
// //                 child: GestureDetector(
// //                   onTap: () {
// //                    navigatePage();
// //                   },
// //                   child: Text(
// //                     doubleStar+name,
// //                     style: datatableblack16,
// //                   ),
// //                 ),
// //               ),
// //               Text(
// //                     doubleStar+name,
// //                     style: datatableblack16,
// //                   ),
// //            ],
// //          );
// // }

// // import 'package:flutter/material.dart';

// // import '../../../Model/Const/height_width.dart';
// // import '../../../Model/Const/text_const.dart';

// // class DropDownForm1 extends StatefulWidget {
// //   final List<String> dropdownItems;
// //   final String dropDownName;
// //   final bool optionalisEmpty;
// //   final String star;
// //   final TextEditingController controller;
// //   const DropDownForm1({
// //     super.key,
// //     required this.dropdownItems,
// //     required this.dropDownName,
// //     required this.star,
// //     required this.optionalisEmpty,
// //     required this.controller,
// //   });

// //   @override
// //   DropDownForm1State createState() => DropDownForm1State();
// // }

// // class DropDownForm1State extends State<DropDownForm1> {
// //   List<String> selectedItems = [];

// //   @override
// //   Widget build(BuildContext context) {
// //     return SingleChildScrollView(
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: <Widget>[
// //           SizedBox(
// //             width: primaryWidth,
// //             child: InputDecorator(
// //               decoration: InputDecoration(
// //                 labelText: widget.dropDownName,
// //                 labelStyle: textStyleGrey18,
// //                 errorStyle: const TextStyle(color: Colors.red),
// //                 border: const OutlineInputBorder(),
// //               ),
// //               child: InkWell(
// //                 onTap: () {
// //                   _showMultiSelect(context);
// //                 },
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: <Widget>[
// //                     Expanded(
// //                       child: Text(
// //                         selectedItems.isEmpty
// //                             ? 'Select ${widget.dropDownName}'
// //                             : selectedItems.join(', '),
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //                     ),
// //                     Icon(Icons.arrow_drop_down),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _showMultiSelect(BuildContext context) {
// //     showModalBottomSheet(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return ListView.builder(
// //           itemCount: widget.dropdownItems.length,
// //           itemBuilder: (BuildContext context, int index) {
// //             final String item = widget.dropdownItems[index];
// //             return CheckboxListTile(
// //               title: Text(item),
// //               value: selectedItems.contains(item),
// //               onChanged: (bool? value) {
// //                 setState(() {
// //                   if (value != null && value) {
// //                     selectedItems.add(item);
// //                   } else {
// //                     selectedItems.remove(item);
// //                   }
// //                 });
// //               },
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }

// //   String? validMethod(value) {
// //     if (widget.optionalisEmpty == true) {
// //       if (value == null || value.isEmpty) {
// //         return "Please enter ${widget.dropDownName}";
// //       }
// //       return null;
// //     }
// //     return null;
// //   }
// // }

// // class kkkk extends StatelessWidget {
// //   const kkkk({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final TextEditingController dropDownForm1controller=TextEditingController();
// //     return Scaffold(
// //       body: Container(
// //         child: DropDownForm1(
// //             dropdownItems: ['lkjhg','lkbv','kjhgfgh'],
// //             dropDownName: "jjj",
// //             star: estar,
// //             optionalisEmpty: false,
// //             controller: dropDownForm1controller),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:pdf/pdf.dart';
// // import 'package:pdf/widgets.dart' as pw;
// // import 'package:printing/printing.dart';

// // class MyHomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Print/Save as PDF'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             _showPrintOptions(context);
// //           },
// //           child: Text('Print/Save as PDF'),
// //         ),
// //       ),
// //     );
// //   }

// //   void _showPrintOptions(BuildContext context) async {
// //     final pdf = pw.Document();

// //     pdf.addPage(
// //       pw.Page(
// //         build: (pw.Context context) => pw.Center(
// //           child: pw.Text('Hello World'),
// //         ),
// //       ),
// //     );

// //     final bytes = await pdf.save();

// //     await Printing.layoutPdf(
// //       onLayout: (PdfPageFormat format) async => bytes,
// //     );
// //   }
// // }

// // Future<void> fetchData() async {
// //   try {
// //     final response = await http.get(
// //       Uri.parse("$ip/Admin/get-site/${widget.id}"),
// //       headers: {
// //         'Authorization': 'Bearer $token',
// //       },
// //     );
// //     if (response.statusCode == 200) {
// //       setState(() {
// //         data = jsonDecode(response.body);
// //         print(data);
// //         if (data != null) {
// //           setControllersWithData(data!);
// //         }
// //       });
// //     } else {
// //       throw Exception('Failed to load data');
// //     }
// //   } catch (error) {
// //     print('Error fetching data: $error');
// //   }
// // }

// // void setControllersWithData(Map<String, dynamic> data) {
// //    siteNameController.text = data![dbSiteName]?.toString() ?? "";
// //         addressline1Controller.text = data![dbSiteAddressOne]?.toString() ?? "";
// //         addressline2Controller.text = data![dbSiteAddressTwo]?.toString() ?? "";
// //         pincodeController.text = data![dbSitePincode]?.toString() ?? "";
// //         cityController.text = data![dbSiteTown]?.toString() ?? "";
// //         stateController.text = data![dbSiteState]?.toString() ?? "";
// //         sitegpsController.text = data![dbSiteGpsLocation]?.toString() ?? "";
// //         projectWorkNameController.text = data![dbSiteProjectWorkName]?.toString() ?? "";
// //         projectSizeController.text = data![dbSiteProjectSize]?.toString() ?? "";
// //         projectStartDateController.text = data![dbSiteProjectStartDate]?.toString() ?? "";
// //         expectedCompletionDateController.text = data![dbSiteProjectCompletionDate]?.toString() ?? "";
// //         projectWorkDescriptionofController.text = data![dbSiteProjectDesc]?.toString() ?? "";
// //         companySiteEngineersAllocatedController.text = data![""]?.toString() ?? "";
// //         laborsAllocatedController.text = data![" "]?.toString() ?? "";
// //         primaryEmailController.text = data![dbPrimaryEmail]?.toString() ?? "";
// //         primaryNameController.text = data![dbPrimaryName]?.toString() ?? "";
// //         primaryPhoneNumberController.text = data![dbPrimaryNumber]?.toString() ?? "";
// //         primaryWhatsappController.text = data![""]?.toString() ?? "";
// //         secondaryEmailController.text = data![dbSecondaryEmail]?.toString() ?? "";
// //         secondaryNameController.text = data![dbSecondaryName]?.toString() ?? "";
// //         secondaryPhoneNumberController.text = data![dbSecondaryNumber]?.toString() ?? "";
// //         secondaryWhatsappController.text = data![""]?.toString() ?? "";
// //         governmentApprovalsController.text = data![""]?.toString() ?? "";
// //         clientArchitectEmailController.text = data![""]?.toString() ?? "";
// //         clientArchitectNameController.text = data![dbPrimaryName]?.toString() ?? "";
// //         clientArchitectPhoneNumberController.text = data![dbPrimaryNumber]?.toString() ?? "";
// //         clientArchitectWhatsappController.text = data![""]?.toString() ?? "";
// //         clientEngineerEmailController.text = data![dbSecondaryEmail]?.toString() ?? "";
// //         clientEngineerNameController.text = data![dbSecondaryName]?.toString() ?? "";
// //         clientEngineerPhoneNumberController.text = data![dbSecondaryNumber]?.toString() ?? "";
// //         clientEngineerWhatsappController.text = data![""]?.toString() ?? "";
// //         siteEngineerEmailController.text = data![dbPrimaryEmail]?.toString() ?? "";
// //         siteEngineerNameController.text = data![dbPrimaryName]?.toString() ?? "";
// //         siteEngineerPhoneNumberController.text = data![dbPrimaryNumber]?.toString() ?? "";
// //         siteEngineerWhatsappController.text = data![""]?.toString() ?? "";
// //         clientPurchaseOfficerEmailController.text = data![dbSecondaryEmail]?.toString() ?? "";
// //         clientPurchaseOfficerNameController.text = data![dbSecondaryName]?.toString() ?? "";
// //         clientPurchaseOfficerPhoneNumberController.text = data![dbSecondaryNumber]?.toString() ?? "";
// //         clientPurchaseOfficerWhatsappController.text = data![""]?.toString() ?? "";
// //         clientQualityOfficerEmailController.text = data![dbPrimaryEmail]?.toString() ?? "";
// //         clientQualityOfficerNameController.text = data![dbPrimaryName]?.toString() ?? "";
// //         clientQualityOfficerPhoneNumberController.text = data![dbPrimaryNumber]?.toString() ?? "";
// //         clientQualityOfficerWhatsappController.text = data![dbPrimaryWhatsapp]?.toString() ?? "";
// // }

// import 'package:flutter/material.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
// import '../../../Model/Const/color.dart';
// import '../../../Model/Const/height_width.dart';
// import '../../../Model/Const/text_const.dart';
// import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';

// class MyHomePage extends StatefulWidget {
//   final List<Map<String, dynamic>> dropdownItems;
//   final String dropDownName;
//   final bool optionalisEmpty;
//   final String star;
//   final Function(List<dynamic>) onChanged;
//   final List<String> selectedIds;
//   final TextEditingController controller;

//   const MyHomePage(
//       {Key? key,
//       required this.selectedIds,
//       required this.dropdownItems,
//       required this.dropDownName,
//       required this.onChanged,
//       required this.star,
//       required this.optionalisEmpty,
//       required this.controller})
//       : super(key: key);

//   @override
//   MyHomePageState createState() =>
//       MyHomePageState();
// }

// class MyHomePageState
//     extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           SizedBox(
//             width: primaryWidth,
//             child: GestureDetector(
//               onTap: () async {
//                 await showDialog(
//                   context: context,
//                   builder: (context) {
//                     return MultiSelectDialog(
//                       items: widget.dropdownItems
//                           .map((item) =>
//                               MultiSelectItem(item["id"], item["name"]))
//                           .toList(),
//                       initialValue: widget.selectedIds,
//                       title: Text(widget.dropDownName, style: textStyleGrey18),
//                       onConfirm: (values) {
//                         widget.onChanged(values);
//                         widget.controller.text = values
//                             .map((id) => widget.dropdownItems
//                                 .firstWhere((item) => item['id'] == id)['name'])
//                             .join(', ');
//                       },
//                     );
//                   },
//                 );
//               },
//               child: AbsorbPointer(
//                 child: TextFormField(
//                   controller: widget.controller,
//                   decoration: InputDecoration(
//                     labelText: widget.dropDownName,
//                     labelStyle: textStyleGrey18,
//                     suffixIcon: Icon(Icons.arrow_drop_down, color: black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5),
//                       borderSide: BorderSide(color: grey, width: 2),
//                     ),
//                     // errorText: validMethod(widget.selectedIds),
//                     errorStyle: const TextStyle(color: Colors.red),
//                   ),
//                   maxLines: 15,
//                   minLines: 1,
//                   validator: (value) {
//                     return validMethod(value);
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String? validMethod(value) {
//     if (widget.optionalisEmpty) {
//       if (value.isEmpty) {
//         return "Please enter ${widget.dropDownName}";
//       }
//     }
//     return null;
//   }
// }

// class MultiSelectDropDownForm extends StatefulWidget {
//   final List dropdownItems;
//   final String dropDownName;
//   final bool optionalisEmpty;
//   final String star;
//   final onChanged;
//   final List selectedIds;
//   final TextEditingController controller;

//   const MultiSelectDropDownForm(
//       {Key? key,
//       required this.selectedIds,
//       required this.dropdownItems,
//       required this.dropDownName,
//       required this.onChanged,
//       required this.star,
//       required this.optionalisEmpty,
//       required this.controller})
//       : super(key: key);

//   @override
//   MultiSelectDropDownFormState createState() => MultiSelectDropDownFormState();
// }

// class MultiSelectDropDownFormState extends State<MultiSelectDropDownForm> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           SizedBox(
//               width: primaryWidth,
//               child: MultiSelectDialogField(
//                   items: widget.dropdownItems
//                       .map((item) => MultiSelectItem(item["id"], item["name"]))
//                       .toList(),
//                   title: Text(widget.dropDownName, style: textStyleGrey18),
//                   // selectedColor: Colors.blue,
//                   decoration: BoxDecoration(
//                     // color: Colors.blue.withOpacity(0.1),
//                     borderRadius: BorderRadius.all(Radius.circular(5)),
//                     border: Border.all(
//                       color: grey,
//                       width: 2,
//                     ),
//                   ),
//                   buttonIcon: Icon(
//                     Icons.arrow_drop_down,
//                     color: black,
//                   ),
//                   buttonText: Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: widget.dropDownName,
//                           style:
//                               textStyleGrey18, // Adjust to match textStyleGrey18
//                         ),
//                         TextSpan(
//                           text: widget.star,
//                           style:
//                               textStyleRedStar, // Adjust to match textStyleGrey18
//                         ),
//                       ],
//                     ),
//                   ),
//                   validator: (value) {
//                     return validMethod(value);
//                   },
//                   onConfirm: widget.onChanged,
//                   initialValue: widget.selectedIds,
//                   chipDisplay: MultiSelectChipDisplay(
//                     icon: null,
//                     chipColor: white, // Change this to your desired color
//                     textStyle: TextStyle(color: black),
//                   ))),
//         ],
//       ),
//     );
//   }

//   String? validMethod(value) {
//     if (widget.optionalisEmpty == true) {
//       if (value.runtimeType == int) {
//         return null;
//       }
//       if (value == null || value.isEmpty) {
//         return "Please enter ${widget.dropDownName}";
//       }
//       return null;
//     }
//     return null;
//   }
// }

// // import 'package:flutter/material.dart';
// // // ignore: depend_on_referenced_packages
// // import 'package:multi_select_flutter/multi_select_flutter.dart';
// // import '../../../Model/Const/height_width.dart';
// // import '../../../Model/Const/text_const.dart';

// class DropDownFormm extends StatefulWidget {
//   final List dropdownItems;
//   final String dropDownName;
//   final bool optionalisEmpty;
//   final String star;
//   final onChanged;
//   final selectedId;
//   final TextEditingController controller;
//   final int? defaultValue; // Add this line

//   const DropDownFormm({
//     super.key,
//     required this.selectedId,
//     required this.dropdownItems,
//     required this.dropDownName,
//     required this.onChanged,
//     required this.star,
//     required this.optionalisEmpty,
//     required this.controller,
//     this.defaultValue, // Add this line
//   });

//   @override
//   DropDownFormmState createState() => DropDownFormmState();
// }

// class DropDownFormmState extends State<DropDownFormm> {
//   @override
//   Widget build(BuildContext context) {
//     print(widget.dropdownItems);
//     print(widget.defaultValue);
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           SizedBox(
//             width: primaryWidth,
//             child: DropdownButtonFormField(
//               decoration: InputDecoration(
//                 label: RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: widget.dropDownName,
//                         style: textStyleGrey18,
//                       ),
//                       TextSpan(
//                         text: widget.star,
//                         style: textStyleRedStar,
//                       )
//                     ],
//                   ),
//                 ),
//                 errorStyle: const TextStyle(color: Colors.red),
//                 border: const OutlineInputBorder(),
//               ),
//               validator: validMethod,
//               style: textStyleBlack18,
//               value:
//                   widget.selectedId ?? widget.defaultValue, // Set default value
//               onChanged: widget.onChanged,
//               items: widget.dropdownItems
//                   .map<DropdownMenuItem<int>>((dynamic item) {
//                 return DropdownMenuItem<int>(
//                   value: item["id"],
//                   child: Text(item["name"]),
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String? validMethod(value) {
//     if (widget.optionalisEmpty == true) {
//       if (value.runtimeType == int) {
//         return null;
//       }
//       if (value == null || value.isEmpty) {
//         return "Please enter ${widget.dropDownName}";
//       }
//       return null;
//     }
//     return null;
//   }
// }

// // class DropDownFormmm extends StatefulWidget {
// //   final List dropdownItems;
// //   final String dropDownName;
// //   final bool optionalisEmpty;
// //   final String star;
// //   final Function(List) onChanged;
// //   final List selectedIds;
// //   final TextEditingController controller;

// //   const DropDownFormmm({
// //     super.key,
// //     required this.selectedIds,
// //     required this.dropdownItems,
// //     required this.dropDownName,
// //     required this.onChanged,
// //     required this.star,
// //     required this.optionalisEmpty,
// //     required this.controller,
// //   });

// //   @override
// //   DropDownFormmmState createState() => DropDownFormmmState();
// // }

// // class DropDownFormmmState extends State<DropDownFormmm> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return SingleChildScrollView(
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: <Widget>[
// //           SizedBox(
// //             width: primaryWidth,
// //             child: FormField<List>(
// //               initialValue: widget.selectedIds,
// //               validator: validMethod,
// //               builder: (state) {
// //                 return Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     MultiSelectDialogField(
// //                       decoration: BoxDecoration(
// //                         border: Border.all(
// //                           color: state.hasError ? Colors.red : Colors.grey,
// //                         ),
// //                         borderRadius: BorderRadius.circular(5),
// //                       ),
// //                       buttonText: Text(
// //                         widget.dropDownName,
// //                         style: textStyleGrey18,
// //                       ),
// //                       title: RichText(
// //                       text: TextSpan(
// //                     children: [
// //                       TextSpan(
// //                         text: widget.dropDownName,
// //                         style: textStyleGrey18,
// //                       ),
// //                       TextSpan(
// //                         text: widget.star,
// //                         style: textStyleRedStar,
// //                       )
// //                     ],
// //                   )),
// //                       items: widget.dropdownItems
// //                           .map((item) => MultiSelectItem(item['id'], item['name']))
// //                           .toList(),
// //                       initialValue: widget.selectedIds,
// //                       onConfirm: (values) {
// //                         widget.onChanged(values);
// //                         state.didChange(values);
// //                       },
// //                     ),
// //                     state.hasError
// //                         ? Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Text(
// //                               state.errorText ?? '',
// //                               style: TextStyle(color: Colors.red),
// //                             ),
// //                           )
// //                         : Container(),
// //                   ],
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   String? validMethod(List<dynamic>? values) {
// //     if (widget.optionalisEmpty) {
// //       if (values == null || values.isEmpty) {
// //         return "Please enter ${widget.dropDownName}";
// //       }
// //       return null;
// //     }
// //     return null;
// //   }
// // }
// // // class DropDownFormmm extends StatefulWidget {
// // //   final List dropdownItems;
// // //   final String dropDownName;
// // //   final bool optionalisEmpty;
// // //   final String star;
// // //   final Function(List) onChanged;
// // //   final List selectedIds;
// // //   final TextEditingController controller;

// // //   const DropDownFormmm({
// // //     super.key,
// // //     required this.selectedIds,
// // //     required this.dropdownItems,
// // //     required this.dropDownName,
// // //     required this.onChanged,
// // //     required this.star,
// // //     required this.optionalisEmpty,
// // //     required this.controller,
// // //   });

// // //   @override
// // //   DropDownFormmmState createState() => DropDownFormmmState();
// // // }

// // // class DropDownFormmmState extends State<DropDownFormmm> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return SingleChildScrollView(
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: <Widget>[
// // //           SizedBox(
// // //             width: primaryWidth,
// // //             child: FormField<List>(
// // //               initialValue: widget.selectedIds,
// // //               validator: validMethod,
// // //               builder: (state) {
// // //                 return Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     MultiSelectDialogField(
// // //                       decoration: BoxDecoration(
// // //                         border: Border.all(
// // //                           color: state.hasError ? Colors.red : Colors.grey,
// // //                         ),
// // //                         borderRadius: BorderRadius.circular(5),
// // //                       ),
// // //                       buttonText: Text(
// // //                         widget.dropDownName,
// // //                         style: textStyleGrey18,
// // //                       ),
// // //                       title: Text(
// // //                         widget.dropDownName,
// // //                         style: textStyleGrey18,
// // //                       ),
// // //                       items: widget.dropdownItems
// // //                           .map((item) => MultiSelectItem(item['id'], item['name']))
// // //                           .toList(),
// // //                       initialValue: widget.selectedIds,
// // //                       onConfirm: (values) {
// // //                         widget.onChanged(values);
// // //                         state.didChange(values);
// // //                       },
// // //                     ),
// // //                     state.hasError
// // //                         ? Padding(
// // //                             padding: const EdgeInsets.all(8.0),
// // //                             child: Text(
// // //                               state.errorText ?? '',
// // //                               style: TextStyle(color: Colors.red),
// // //                             ),
// // //                           )
// // //                         : Container(),
// // //                   ],
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// class DropDownFormmm extends StatefulWidget {
//   final List dropdownItems;
//   final String dropDownName;
//   final bool optionalisEmpty;
//   final String star;
//   final Function(List) onChanged;
//   final List selectedIds;
//   final TextEditingController controller;
//   final List defaultSelectedIds; // Add this

//   const DropDownFormmm({
//     super.key,
//     required this.selectedIds,
//     required this.defaultSelectedIds, // Add this
//     required this.dropdownItems,
//     required this.dropDownName,
//     required this.onChanged,
//     required this.star,
//     required this.optionalisEmpty,
//     required this.controller,
//   });

//   @override
//   DropDownFormmmState createState() => DropDownFormmmState();
// }

// class DropDownFormmmState extends State<DropDownFormmm> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           SizedBox(
//             width: primaryWidth,
//             child: FormField<List>(
//               initialValue: widget.selectedIds,
//               validator: validMethod,
//               builder: (state) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MultiSelectDialogField(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: state.hasError ? Colors.red : Colors.grey,
//                         ),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       buttonText: Text(
//                         widget.dropDownName,
//                         style: textStyleGrey18,
//                       ),
//                       title: RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: widget.dropDownName,
//                               style: textStyleGrey18,
//                             ),
//                             TextSpan(
//                               text: widget.star,
//                               style: textStyleRedStar,
//                             )
//                           ],
//                         ),
//                       ),
//                       items: widget.dropdownItems
//                           .map((item) =>
//                               MultiSelectItem(item['id'], item['name']))
//                           .toList(),
//                       initialValue: widget
//                           .defaultSelectedIds, // Set default selected values here
//                       onConfirm: (values) {
//                         widget.onChanged(values);
//                         state.didChange(values);
//                       },
//                     ),
//                     state.hasError
//                         ? Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               state.errorText ?? '',
//                               style: const TextStyle(color: Colors.red),
//                             ),
//                           )
//                         : Container(),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String? validMethod(List<dynamic>? values) {
//     if (widget.optionalisEmpty) {
//       if (values == null || values.isEmpty) {
//         return "Please enter ${widget.dropDownName}";
//       }
//       return null;
//     }
//     return null;
//   }
// }
// import 'package:collection/collection.dart';
// import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';

// class SingleSelectDropDown extends StatefulWidget {
//   @override
//   _SingleSelectDropDownState createState() => _SingleSelectDropDownState();
// }

// class _SingleSelectDropDownState extends State<SingleSelectDropDown> {
//   int? selectedItemId;
//   List<Map<String, dynamic>> dropdownItems = [
//     {"id": 1, "name": "Option 1"},
//     {"id": 2, "name": "Option 2"},
//     {"id": 3, "name": "Option 3"},
//     {"id": 4, "name": "Option 4"},
//   ];

//   TextEditingController searchBoxController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return 
//             SizedBox(
//               child: DropdownSearch<Map<String, dynamic>>(
//                 items: dropdownItems,
//                 onChanged: (item) {
//                   setState(() {
//                     selectedItemId = item!['id'];
//                   });
//                 },
//                 selectedItem: dropdownItems.firstWhereOrNull((item) => item['id'] == selectedItemId),
//                 itemAsString: (item) => item['name'],
//                  popupProps: PopupProps.menu(
//                   showSearchBox: true
//                  ),
//                 // searchBoxController: searchBoxController, // Enables search functionality
                         
//                 validator: (value) {
//                   if (value == null) {
//                     return "Please select an option";
//                   }
//                   return null;
//                 },
//               ),
//             );
           
   
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';


// import '../../../Model/Const/color.dart';
// import '../../../Model/Const/height_width.dart';
// import '../../../Model/Const/text_const.dart';


// class SingleSelectDropDown extends StatefulWidget {
//   final List<Map<String, dynamic>> dropdownItems;
//   final String dropDownName;
//   final bool optionalisEmpty;
//   final String star;
//   final Function(List<dynamic>) onChanged;
//   final int? selectedId;
//   final TextEditingController controller;

//   const SingleSelectDropDown({
//     Key? key,
//     required this.selectedId,
//     required this.dropdownItems,
//     required this.dropDownName,
//     required this.onChanged,
//     required this.star,
//     required this.optionalisEmpty,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   SingleSelectDropDownState createState() => SingleSelectDropDownState();
// }

// class SingleSelectDropDownState extends State<SingleSelectDropDown> {
//   String? selectedItem;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize selectedItem based on selectedId if available
//     if (widget.selectedId != null) {
//       selectedItem = widget.dropdownItems.firstWhere((item) => item['id'] == widget.selectedId)['name'] as String;
//     } else if (widget.controller.text.isNotEmpty) {
//       selectedItem = widget.controller.text;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: primaryWidth, 
//       child: DropdownSearch<String>(
//         items: widget.dropdownItems.map((item) => item['name'] as String).toList(),
//         selectedItem: selectedItem,
//         dropdownDecoratorProps: DropDownDecoratorProps(
//           dropdownSearchDecoration: InputDecoration(
//             label: RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: widget.dropDownName,
//                     style: textStyleGrey18,
//                   ),
//                   TextSpan(
//                     text: widget.star,
//                     style: textStyleRedStar,
//                   ),
//                 ],
//               ),
//             ),
//             contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
//             border: OutlineInputBorder(),
//             errorStyle: const TextStyle(color: Colors.red),
//           ),
//         ),
//         onChanged: (value) {
//           if (value != null) {
//             setState(() {
//               selectedItem = value;
//             });
//             String selectedId = widget.dropdownItems
//                 .firstWhere((item) => item['name'] == value)['id'].toString();
//             widget.onChanged(selectedId);
//             widget.controller.text = value;
//           }
//         },
//         validator: (value) => validMethod(value),
//         popupProps: PopupProps.menu(
//           menuProps: MenuProps(
//             backgroundColor: white,
//           ),
//           showSelectedItems: true,
//           itemBuilder: (context, item, isSelected) {
//             return ListTile(
//               title: Text(item, style: textStyleGrey18,),
//               trailing: isSelected
//                   ? Icon(Icons.check_circle, color: Colors.green)
//                   : Icon(Icons.check_circle_outline, color: Colors.grey),
//             );
//           },
//           showSearchBox: true,
//         ),
//         clearButtonProps: ClearButtonProps(isVisible: true),
//       ),
//     );
//   }

//   String? validMethod(value) {
//     if (widget.optionalisEmpty) {
//       if (value == null || value.isEmpty) {
//         return "Please enter ${widget.dropDownName}";
//       }
//     }
//     return null;
//   }
// }

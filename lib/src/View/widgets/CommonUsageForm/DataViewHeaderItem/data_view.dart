import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../Model/Const/color.dart';
import '../../../../Model/Const/height_width.dart';
import '../../../../Model/Const/padding_const.dart';
import '../../../../Model/Const/text_const.dart';
import '../../../../Model/EmptyDataScreenView/empty_image.dart';
import '../../../../Model/api/local.dart';
import '../../../../controler/GetDate/get_date.dart';
import '../../AppBar/AppBar.dart';
import '../../BottomLogo/bottom_sheet_logo.dart';
import '../../MyDrawer/my_drawer.dart';
import 'data_header.dart';
import 'data_item.dart';

class DataView extends StatefulWidget {
  final String dataTableNameOne;
  final String dataTableNameTwo;
  final String uri;
  final String id;
  final String firstColumnMainName;
  final String image;
  final Widget header;
  final String doubleStar;
  final Function navigatePage;
  final String deletext;
  final int fixFistColumnLength;
  final String firstColumnsubName;
  final String firstColumnSecondSubName;
  final String lastColumMainName;
  final String lastColumnSubName;
  final String lastColumnSecondSubName;
  final String middleColumMainName;
  final String middleColumnSubName;
  final String middleColumnSecondSubName;
  final int fixLastColumnLength;
  final int fixMiddleColumnLength;
  final bool dateOrNot;
  final bool mapOrNot;
  final Widget onpress;

  const DataView({
    Key? key,
    required this.dataTableNameOne,
    required this.dataTableNameTwo,
    required this.uri,
    required this.id,
    required this.firstColumnMainName,
    required this.image,
    required this.onpress,
    required this.header,
    required this.doubleStar,
    required this.navigatePage,
    required this.deletext,
    required this.fixFistColumnLength,
    required this.firstColumnsubName,
    required this.firstColumnSecondSubName,
    required this.lastColumMainName,
    required this.lastColumnSubName,
    required this.lastColumnSecondSubName,
    required this.middleColumMainName,
    required this.middleColumnSubName,
    required this.middleColumnSecondSubName,
    required this.fixLastColumnLength,
    required this.fixMiddleColumnLength,
    required this.dateOrNot,
    required this.mapOrNot,
  }) : super(key: key);

  @override
  _DataViewState createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  var data = [];
  bool isLoading = true;
  final ScreenshotController screenshotController = ScreenshotController();

  void printCurrentPage() async {
    screenshotController.capture().then((Uint8List? image) async {
      if (image != null) {
        final pdf = pw.Document();
        final imageMemory = pw.MemoryImage(image);

        pdf.addPage(
          pw.Page(
            build: (pw.Context context) => pw.Center(
              child: pw.Image(imageMemory),
            ),
          ),
        );

        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save(),
        );
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(widget.uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      // print(response.body);
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      drawer: MyDrawer(context: context),
      body: Screenshot(
        controller: screenshotController,
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              widget.header,
              data.isEmpty
                  ? Center(
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Center(child: EmptyDataImage(image: widget.image)),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          widget.header,
                          DataHeader(
                            titlename: widget.dataTableNameOne,
                            dataTableNameTwo: widget.dataTableNameTwo,
                          ),
                          ...data.map((item) {
                            return DataItem(
                              fixLastColumnLength: widget.fixLastColumnLength,
                              fixFistColumnLength: widget.fixFistColumnLength,
                              fixMiddleColumnLength: widget.fixMiddleColumnLength,
                              navigatePage: () => widget.navigatePage(item[widget.id].toString()), // Ensure ID is a String
                              doubleStar: widget.doubleStar,
                              firstColumnMainName: item[widget.firstColumnMainName]?.toString() ?? '',
                              firstColumnSubName: widget.mapOrNot 
                                  ? (item[widget.firstColumnsubName]?["co_supplier_category_name"]?.toString() ?? '') 
                                  : (item[widget.firstColumnsubName]?.toString() ?? ''),
                              firstColumnSecondSubName: item[widget.firstColumnSecondSubName]?.toString() ?? '',
                              lastColumMainName: widget.dateOrNot 
                                  ? Date.getDate(item[widget.lastColumMainName]).toString()?? '' 
                                  : (item[widget.lastColumMainName]?.toString() ?? ''),
                              lastColumnSubName: item[widget.lastColumnSubName]?.toString() ?? '',
                              lastColumnSecondSubName: item[widget.lastColumnSecondSubName]?.toString() ?? '',
                              middleColumMainName: item[widget.middleColumMainName]?.toString() ?? '',
                              middleColumnSubName: item[widget.middleColumnSubName]?.toString() ?? '',
                              middleColumnSecondSubName: item[widget.middleColumnSecondSubName]?.toString() ?? '',
                            );
                          }).toList(),
                          bottomHeight,
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: black,
                minimumSize: Size(deleteButtonWidth, deleteprintHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget.onpress)),
              child: Text(widget.deletext, style: textStyleWhite18),
            ),
            Padding(
              padding: left10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: formButtonColor,
                  minimumSize: Size(printButtonWidth, deleteprintHeight),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: printCurrentPage,
                child: Text('Print', style: textStyleWhite18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}


// import '../../../../controler/GetDate/get_date.dart';
// import '/src/Model/api/local.dart';
// import '/src/View/widgets/CommonUsageForm/DataViewHeaderItem/data_item.dart';
// import '../../../../Model/EmptyDataScreenView/empty_image.dart';
// import '../../../../Model/Const/height_width.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../../AppBar/AppBar.dart';
// import '../../BottomLogo/bottom_sheet_logo.dart';
// import 'data_header.dart';
// import '../../MyDrawer/my_drawer.dart';

// class DataView extends StatefulWidget {
//    DataView({
//     Key? key,
   
//    required this.fixFistColumnLength,
//   required this.fixMiddleColumnLength,
//       required this.fixLastColumnLength,
//         required this.id,
//     required this.firstColumnMainName,
//       required this.firstColumnsubName,
//     required this.firstColumnSecondSubName,
//  required this.middleColumMainName,
//       required this.middleColumnSubName,
//       required this.middleColumnSecondSubName,
//      required this.lastColumMainName,
//       required this.lastColumnSubName,
//       required this.lastColumnSecondSubName,
//     required this.dataTableNameOne,
//     required this.dataTableNameTwo,
//     required this.uri,
//     required this.doubleStar,
//     required this.navigatePage,
//     required this.bottomsheet,
//     required this.header,
//     required this.image,
//    required this.dateOrNot,
//    required this.mapOrNot
//   }) : super(key: key);

//   final dataTableNameOne;
//   final dataTableNameTwo;
//   final uri;
//   final id;
//   final firstColumnMainName;
//   final image;
//   final header;
//   final doubleStar;
//   final navigatePage;
//   final bottomsheet;
//   final fixFistColumnLength;
//   final firstColumnsubName;
//   final firstColumnSecondSubName;
//   final lastColumMainName;
//    final lastColumnSubName;
//   final  lastColumnSecondSubName;
//   final  middleColumMainName;
//   final  middleColumnSubName;
//   final middleColumnSecondSubName;
//   final fixLastColumnLength;
//   final fixMiddleColumnLength;
//   final bool dateOrNot ;
//   final bool mapOrNot;
//   @override
//   _DataViewState createState() => _DataViewState();
// }

// class _DataViewState extends State<DataView> {
//   var data = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final response = await http.get(
//         Uri.parse(widget.uri),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       );
//       if (response.statusCode == 200) {
//         setState(() {
//           data = jsonDecode(response.body);
//           // isLoading = false;
//         });
//       } else {
//         print('Error fetching else data: ${response.statusCode}');

//         throw Exception('Failed to load data');
//       }
//     } catch (error) {
//       setState(() {
          
//           isLoading = false;
//         });
//       print('Error fetching catch data : $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const BuildAppBar(),
//       drawer: MyDrawer(context: context),
//       body: Container(
//         color: Colors.white,
//         child: Stack(children: [
//           widget.header,
//              data.isEmpty ? 
//              Center(
//                 child: isLoading
//                     ? const CircularProgressIndicator()
                    
//                        : Center(child: EmptyDataImage(image: widget.image))
                      
//               )
//               :
//           SingleChildScrollView(
//           child:Column(
//             children: [
//                 widget.header,
//                  DataHeader(
//                             titlename: widget.dataTableNameOne,
//                             dataTableNameTwo: widget.dataTableNameTwo,
//                           ),
//                 ...data
//                   .map(
//                     (item) => DataItem(
//                       fixLastColumnLength: widget.fixLastColumnLength,
//                       fixFistColumnLength: widget.fixFistColumnLength,
//                       fixMiddleColumnLength: widget.fixMiddleColumnLength,
//                       navigatePage: () => widget.navigatePage(item[widget.id]),
//                       doubleStar: widget.doubleStar,
//                      firstColumnMainName: item[widget.firstColumnMainName],
//                       firstColumnSubName:widget.mapOrNot ? item[widget.firstColumnsubName]["co_supplier_category_name"]:item[widget.firstColumnsubName],
//                       firstColumnSecondSubName: item[widget.firstColumnSecondSubName],
//                       lastColumMainName: widget.dateOrNot ? Date.getDate(item[widget.lastColumMainName]) :item[widget.lastColumMainName],
//                       lastColumnSubName:item[widget.lastColumnSubName] ,
//                        lastColumnSecondSubName: item[widget.lastColumnSecondSubName],
//                        middleColumMainName:item[widget.middleColumMainName] ,
//                        middleColumnSubName: item[widget.middleColumnSubName],
//                        middleColumnSecondSubName: item[widget.middleColumnSecondSubName],
//                     ),
//                   )
//                   .toList(),
//               bottomHeight,
//             ],
//           ),
          
//         ),
//         ],)
//       ),
//       bottomSheet: widget.bottomsheet,
//       bottomNavigationBar: const BottomSheetLogo(),
//     );
//   }
// }


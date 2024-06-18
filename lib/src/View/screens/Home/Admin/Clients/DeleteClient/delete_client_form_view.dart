import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';

import '../../../../../../Model/api/api_model.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_data_item.dart';
import '../../../../../widgets/CommonUsageForm/Update/update_header.dart';
import '/src/View/widgets/AppBar/AppBar.dart';
import '/src/Model/utility/client/client_text_const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../../Model/api/local.dart';
import '../../../../../../controler/ClientController/client_controller.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_header.dart';
import '../../../../../widgets/CommonUsageForm/Delete/delete_reason_table_item.dart';
import '../../../../../widgets/CommonUsageForm/DetailsText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../controler/GetDate/get_date.dart';
import '../ClientViewDetails/client_view_details_five.dart';
import '../ClientViewDetails/client_view_details_four.dart';
import '../ClientViewDetails/client_view_details_one.dart';
import '../ClientViewDetails/client_view_details_six.dart';
import '../ClientViewDetails/client_view_details_three.dart';
import '../ClientViewDetails/client_view_details_two.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

class ClientFormDeleteView extends StatefulWidget {
  const ClientFormDeleteView({super.key, this.id});
  final id;
  @override
  State<ClientFormDeleteView> createState() => _ClientFormDeleteViewState();
}

class _ClientFormDeleteViewState extends State<ClientFormDeleteView> {
  final ScreenshotController screenshotController = ScreenshotController();
   ScrollController scrollController = ScrollController();
final int numberOfPages = 10; 
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
  
   
// Future<void> printAllPages(
//   BuildContext context, // Accept BuildContext as a parameter
//   ScrollController scrollController,
//   ScreenshotController screenshotController,
// ) async {
//   final List<Uint8List> images = [];

//   // Determine total height of the webpage
//   double totalHeight = scrollController.position.maxScrollExtent;

//   // Capture screenshots of each part of the screen
//   double offset = 0;
//   while (offset < totalHeight) {
//     // Scroll to the next part of the screen
//     scrollController.jumpTo(offset);

//     // Give some time for rendering
//     await Future.delayed(Duration(milliseconds: 500));

//     // Capture screenshot
//     final Uint8List? image = await screenshotController.capture();
//     if (image != null) {
//       images.add(image);
//     }

//     // Move to the next section of the webpage
//     offset += MediaQuery.of(context).size.height; // Use the passed context
//   }

//   // Generate PDF with all captured images
//   final pdf = pw.Document();
//   for (final image in images) {
//     final imageMemory = pw.MemoryImage(image);
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) => pw.Center(
//           child: pw.Image(imageMemory),
//         ),
//       ),
//     );
//   }

//   // Save and print the PDF
//   try {
//     final pdfData = await pdf.save();
//     await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfData);
//   } catch (e) {
//     print("Error printing PDF: $e");
//     // Handle printing error
//   }
// }
  @override
  void initState() {
    super.initState();
     scrollController = ScrollController();
    fetchData();
     fetchUpdateData();
  }

var updatedData;
  Map<String, dynamic>? data;
//  Future<void> _generatePDF(BuildContext context) async {
//     final pdf = pw.Document();

//     // Add content to PDF
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Center(
//             child: pw.Text('Hello, World!'),
//           );
//         },
//       ),
//     );

//     // Save PDF to a temporary file
//     final String dir = (await getApplicationDocumentsDirectory()).path;
//     final String path = '$dir/example.pdf';
//     final File file = File(path);
//     await file.writeAsBytes(await pdf.save());

//     // Print the PDF
//     await Printing.layoutPdf(
//       onLayout: (PdfPageFormat format) async => pdf.save(),
//     );

//     // Open and display the PDF
//     await OpenFile.open(file.path);
//   }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getClient}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          if (data != null) {
            var controllers = {
              "co_client_name": control.clientName,
              "off_address_line1": control.addressline1,
              "off_address_line2": control.addressline2,
              "off_town": control.city,
              "off_pincode": control.pincode,
              "off_state": control.state,
              "owner_first_name": control.firstName,
              "owner_last_name": control.lastName,
              "mobile_no": control.phoneNumber,
              "email": control.email,
              "whatsapp": control.whatsapp,
              "resi_address_line1": control.addressline1Controller,
              "resi_address_line2": control.addressline2Controller,
              "resi_town": control.cityController,
              "resi_pincode": control.pincodeController,
              "resi_state": control.stateController,
              "primary_contact_name": control.primaryName,
              "primary_contact_no": control.primaryPhoneNumber,
              "primary_contact_email": control.primaryEmail,
              "primary_contact_whatsapp": control.primaryWhatsapp,
              "secondary_contact_name": control.secondaryName,
              "secondary_contact_no": control.secondaryPhoneNumber,
              "secondary_contact_email": control.secondaryEmail,
              "secondary_contact_whatsapp": control.secondaryWhatsapp,
              "gst_no": control.gstNumber,
              "bank_acc_no": control.accountNumber,
              "bank_ifsc_code": control.ifscCode,
              "bank_acc_name": control.accountName,
              "bank_acc_type": control.accountType,
              "bank_name": control.bankName,
              "bank_acc_location": control.bankLocation
            };
            controllers.forEach((key, controller) {
              controller.text = data![key]?.toString() ?? '';
            });
          }
        });
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
  Future<void> _saveAndPrintPdf() async {
    try {
      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Text('Your PDF content here'), // Customize this as per your UI
            );
          },
        ),
      );

      final output = await getTemporaryDirectory();
      final file = File("${output.path}/example.pdf");
      await file.writeAsBytes(await pdf.save());

      final pdfBytes = await file.readAsBytes();
      await Printing.layoutPdf(onLayout: (_) => Future.value(pdfBytes));
    } catch (e) {
      print('Error saving or printing PDF: $e');
    }
  }


Future<void> printEntirePage(BuildContext context) async {
  try {
    final Uint8List? imageBytes = await screenshotController.capture();

    if (imageBytes != null) {
      final pdf = pw.Document();
      final imageMemory = pw.MemoryImage(imageBytes);

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Center(
            child: pw.Image(imageMemory),
          ),
        ),
      );

      final outputDir = await getApplicationDocumentsDirectory();
      final file = File('${outputDir.path}/example.pdf');
      await file.writeAsBytes(await pdf.save());

      // Show toast message
      Fluttertoast.showToast(msg: 'PDF saved successfully');

      // Open the PDF file with the default PDF viewer
      OpenFile.open(file.path);
    } else {
      throw Exception('Failed to capture screenshot');
    }
  } catch (e) {
    print('Error printing page: $e');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error printing page')));
  }
}

  Future<void> fetchUpdateData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getClientUpdateHistory}/${widget.id}'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          var updateData = [];

          var data = jsonDecode(response.body);

          for (var eachData in data) {
            if (eachData["co_client_id"].toString() == widget.id) {
              updateData.add(eachData);
            }
          }
          updatedData = updateData;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching Updatedata: $error');
    }
  }
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: Screenshot(
        controller: screenshotController,
        child: SingleChildScrollView(
            controller: scrollController,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const DetailsText(enterDetails: deleteClientDetailsText),
                ClientViewDetailsOne(
                  clientNamee: control.clientName,
                  addressline1Controller: control.addressline1,
                  addressline2Controller: control.addressline2,
                  cityController: control.city,
                  pincodeController: control.pincode,
                  stateController: control.state,
                  enabled: isEditing,
                ),
                ClientViewDetailsTwo(
                  firstNamee: control.firstName,
                  lastNamee: control.lastName,
                  phoneNumberr: control.phoneNumber,
                  emaill: control.email,
                  whatsappp: control.whatsapp,
                  enabled: isEditing,
                ),
                ClientViewDetailsThree(
                   gstNumberController:control.gstNumberController ,
                  addressline1Controller: control.addressline1Controller,
                  addressline2Controller: control.addressline2Controller,
                  cityController: control.cityController,
                  pincodeController: control.pincodeController,
                  stateController: control.stateController,
                  enabled: isEditing,
                ),
                ClientViewDetailsFour(
                  primaryNameController: control.primaryName,
                  primaryPhoneNumberController: control.primaryPhoneNumber,
                  primaryEmailController: control.primaryEmail,
                  primaryWhatsappController: control.primaryWhatsapp,
                  secondaryNameController: control.secondaryName,
                  secondaryPhoneNumberController: control.secondaryPhoneNumber,
                  secondaryEmailController: control.secondaryEmail,
                  secondaryWhatsappController: control.secondaryWhatsapp,
                  enabled: isEditing,
                ),
                ClientViewDetailsFive(
                  
                  accountNumberController: control.accountNumber,
                  ifscCodeController: control.ifscCode,
                  accountNameController: control.accountName,
                  accountTypeController: control.accountType,
                  bankNameController: control.bankName,
                  bankLocationController: control.bankLocation,
                  enabled: isEditing,
                  isEditing: isEditing,
                ),
                ClientViewDetailsSix(
                  enabled: isEditing,
                ),
                formSizebox10,
                if (updatedData != null)
                  if (updatedData.length != 0)
                    Column(
                      children: [
                        const UpdateHeader(
                          updatedByHeader: updateByHeaderText,
                          newValueHeader: newvalueHeaderText,
                          oldValueHeader: oldvlueHeaderText,
                        ),
                        ...updatedData.map((eachItem) {
                          return updatedDataItem(
                            eachItem["updated_old_value"] ?? "",
                            eachItem["updated_new_value"] ?? "",
                            eachItem["updated_by"].toString(),
                          );
                        }).toList(),
                       
                      ],
                    ),
               formSizebox10,
                const deleteTableHeader(
                  deleteDate: deleteDate,
                  deleteReason: deleteReason,
                  deleteperson: deletePerson,
                ),
                DeleteDataItem(
                  deletepersonName: 'Admin 1',
                  deleteReason: () {
                    if (data == null) {
                      return "";
                    } else {
                      return data!["deletion_reason"];
                    }
                  }(),
                  deletedDate: () {
                    if (data == null) {
                      return "";
                    } else {
                      return Date.getDate(data!["deleted_At"]);
                    }
                  }(),
                ),
                formSizebox10,
               ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: formButtonColor,
    minimumSize: Size(primaryWidth, deleteprintHeight),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  ),
  onPressed: () async {
              await printEntirePage(context);
            },
  child: Text('Print', style: textStyleWhite18),
),

                bottomHeight,
              ],
            ),
          ),
        ),
      ),
      bottomSheet: const BottomSheetLogo(),
    );
  }
}

import '../../../../../../Model/api/api_model.dart';
import '/src/Model/Const/color.dart';
import '/src/View/widgets/CommonUsageForm/DataViewHeaderItem/data_view.dart';
import '/src/Model/Const/image_const.dart';
import '/src/Model/Const/text_const.dart';
import '/src/View/screens/Home/Admin/Clients/ClientForm/client_form_page_one.dart';
import '/src/View/screens/Home/Admin/Clients/ClientViewDetails/client_view_datails_main.dart';
import '/src/Model/utility/client/client_text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_header.dart';
import '../DeleteClient/delete_client_table.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

class ClientDataView extends StatefulWidget {
  const ClientDataView({Key? key}) : super(key: key);

  @override
  State<ClientDataView> createState() => _ClientDataViewState();
}

class _ClientDataViewState extends State<ClientDataView> {
   final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    
    void navigateToClientViewDetails(String id) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClientViewDetailsMain(id: id)),
      );
    }
   


    var dataViewContainer = DataView(
      onpress:ClientDeleteTable() ,
      // screenshotController: screenshotController,
     fixFistColumnLength: 2,mapOrNot: false,
     fixMiddleColumnLength: 1,
     fixLastColumnLength: 1,
        image: clientEmptyDataImage,
        header: const EmptyViewHeaderBar(
          image: clients,
          onpress: ClientFormPageOne(),
          text: titleclients,
        ),
        dateOrNot: false,
        navigatePage: navigateToClientViewDetails,
        doubleStar: estar,
        uri: ApiEndpoints.getAllClients,
        id: 'co_client_id',
        firstColumnMainName: 'co_client_name',
        firstColumnsubName: 'primary_contact_no',
      firstColumnSecondSubName:'co_client_name',
      middleColumMainName: 'co_client_name',
      middleColumnSubName: 'primary_contact_no',
       middleColumnSecondSubName:'co_client_name' ,
        lastColumMainName: 'primary_contact_no',
        lastColumnSecondSubName: 'co_client_name',
        lastColumnSubName: 'primary_contact_no',
        dataTableNameOne: clientDataTableName,
        dataTableNameTwo: clientDataTablePrimaryNumber,
        dataTableNameThree: clientDataTableName,
    
         deletext: deleteclient,
     
        );
    return Container(color: white, child: dataViewContainer);
  }

 
}
 void printCurrentPage(screenshotController) async {
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
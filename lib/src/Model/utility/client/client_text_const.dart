import 'package:flutter/material.dart';

import '../../Const/text_const.dart';


const clientName = 'Client Name';
const clientpersonalInfo = 'Client Personal Information';
const clientpage1 = 'Page 1 of 6';
const clientpage2 = 'Page 2 of 6';
const clientpage3 = 'Page 3 of 6';
const clientpage4 = 'Page 4 of 6';
const clientpage5 = 'Page 5 of 6';
const clientpage6 = 'Page 6 of 6';
const clientAddress = 'Client Office/Residential Address';
const createon='Created on';
const createby='Created By';
const viewClientDetailsText = "View Client Details";
const editClientDetailsText = "Edit Client Details";
const deleteClientText ='Deleted Clients';
//Client Form
const clientdetails = 'Enter the Client Details';
//Client DataTable
const clientDataTableName = 'Client Name';
const clientDataTablePrimaryNumber = 'Primary Contact';
BorderSide verticalInside = const BorderSide(color: Colors.black, width: 2.0);
const double fontSize16 = 16;
const double fontSize14 = 14;
const double fontSize12 = 12;
const datatableblack16 = TextStyle(
  fontFamily: fontFamily,
  fontSize: fontSize16,
  color: Colors.black,
);
const datatableblack14 = TextStyle(
  fontFamily: fontFamily,
  fontSize: fontSize14,
  color: Colors.black,
);
const datatableblack13 = TextStyle(
  fontFamily: fontFamily,
  fontSize: fontSize12,
  color: Colors.black,
);
const datatableHeaderblack16 = TextStyle(
  fontFamily: fontFamily,
  fontSize: fontSize16,
  fontWeight: fontWeight,
  color: Colors.black,
);

//DeleteClient
const deleteclient = 'Deleted Clients';
const deleteClientDetailsText='Deleted Client Details';

class controller{
  late final TextEditingController clientName = TextEditingController();
  late final TextEditingController addressline1 = TextEditingController();
  late final TextEditingController addressline2 = TextEditingController();
  late final TextEditingController city = TextEditingController();
  late final TextEditingController pincode = TextEditingController();
  late final TextEditingController state = TextEditingController();
  late final TextEditingController firstName = TextEditingController();
  late final TextEditingController lastName = TextEditingController();
  late final TextEditingController phoneNumber = TextEditingController();
  late final TextEditingController email = TextEditingController();
  late final TextEditingController whatsapp = TextEditingController();
  late final TextEditingController addressline1Controller = TextEditingController();
  late final TextEditingController addressline2Controller = TextEditingController();
  late final TextEditingController cityController = TextEditingController();
  late final TextEditingController pincodeController = TextEditingController();
  late final TextEditingController stateController = TextEditingController();
  late final TextEditingController primaryName = TextEditingController();
  late final TextEditingController primaryPhoneNumber = TextEditingController();
  late final TextEditingController primaryWhatsapp = TextEditingController();
  late final TextEditingController primaryEmail = TextEditingController();
  late final TextEditingController secondaryName = TextEditingController();
  late final TextEditingController secondaryPhoneNumber =
      TextEditingController();
  late final TextEditingController secondaryWhatsapp = TextEditingController();
  late final TextEditingController secondaryEmail = TextEditingController();
  late final TextEditingController gstNumber = TextEditingController();
  late final TextEditingController accountNumber = TextEditingController();
  late final TextEditingController ifscCode = TextEditingController();
  late final TextEditingController accountName = TextEditingController();
  late final TextEditingController accountType = TextEditingController();
  late final TextEditingController bankName = TextEditingController();
  late final TextEditingController bankLocation = TextEditingController();
  late final TextEditingController createBy = TextEditingController();
  late final TextEditingController createOn = TextEditingController();
}
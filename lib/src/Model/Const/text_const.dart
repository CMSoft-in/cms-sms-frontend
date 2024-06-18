import 'package:flutter/material.dart';
import 'color.dart';

//Title Names
const titleclients = 'Clients';
const titlesites = 'Sites';
const titlelabors = 'Labors ';
const titlesuppliers = 'Suppliers';
const titlecompanyUsers = 'Company Users';
const titlematerials = 'Materials';
const titlelaborCategory = 'Labor Category';
const titleworkCategory = 'Work Category';
const titlesupplierCategory = 'Supplier Category';
const titlemachines = 'Machines & Vechicles';
const titleMachines = 'Machines';
const titleVechicles = ' Vechicles';
const titlelaborOutturn = 'Labor Outturn';
const titleLabel="Label";
const submit = 'Submit';
const update= 'Update';

const attachments='Attachments';
const supplierCategoryText='Supplier Category';
const star = ' *';
const estar = ' ';
const doublestar='**';
const addressline1 = 'Address Line 1';
const addressline2 = 'Address Line 2';
const city = 'City / Town';
const pincode = 'Pincode';
const state = 'State';
const bloodGroup = 'Blood Group';
//above all owner Address also same..
const primaryContact = "Primary Contact";
const secondaryContact = "Secondary Contact";
const emergencyContact1='Emergency Contact 1';
const emergencyContact2='Emergency Contact 2';
const name = "Name";
const phoneNumber = "+91-";
const email = "Email";
const whatsapp = "Whatsapp";
const gstNo = "GST Number";
const bankAccountDetails = "Bank Account Details";
const accountNumber = "Account Number";
const accountName = "Account Name";
const accountType = "Account Type";
const ifscCode = "IFSC Code";
const bankName = "Bank Name";
const bankLocation = "Bank Location";
const uploadAadhar = "Upload Aadhar";
const uploadpan = "Upload PAN";
const aadharNumber = "Aadhar Number";
const panNumber = "PAN Number";
const backText = "Back";
const nextText = "Next";
const ownerDetails = "Owner Details";
const firstName = "First Name";
const lastName = "Last Name";
const OwnerAddress = "Owner Address";


//Text Style
const fontFamily = 'Poppins';
const double fontSize18 = 18;
const fontWeight = FontWeight.bold;
const double fontSize16 = 16;
const double fontSize20 = 20;

const textStyle20 = TextStyle(
  fontFamily: fontFamily,
  fontSize: fontSize20,
  fontWeight: fontWeight,
);
//AdminElevated
const textStyleBoldBlack18 = TextStyle(
  fontFamily: fontFamily,
  fontSize: fontSize18,
  fontWeight: fontWeight,
  color: Colors.black,
);
//AddButton
const textStyleWhite18 = TextStyle(
  fontFamily: fontFamily,
  fontSize: fontSize18,
  color: Colors.white,
);
//Form InputText
const textStyleGrey18 = TextStyle(
  fontFamily: fontFamily,
  fontSize: fontSize18,
  color: Color(0xffB0B0B0),
);
const textStyleBlack18 = TextStyle(
  fontFamily: fontFamily,
  fontSize: fontSize16,
  color: Colors.black,
);
//Form InputText*
const textStyleRedStar = TextStyle(
  fontFamily: fontFamily,
  fontSize: fontSize18,
  color: formButtonColor,
);
//inputformat
final number = RegExp(r'[0-9]');
final alphabats = RegExp(r'[a-zA-Z]+');
final alphabatsSpace = RegExp(r'[a-zA-Z ]+');
final alphabatsAndNumbers = RegExp(r'[a-zA-Z0-9 ,./]+');
final emailonly = RegExp(r'[a-z0-9_.@]+');
final pan = RegExp(r'[a-zA-Z0-9]+');
final bloodGroupp = RegExp(r'[a-zA-Z0-9 +-]+');
//inputtype
const keyboardTypeNumber = TextInputType.number;
const keyboardTypeNone = TextInputType.text;
const keyboardTypeEmail = TextInputType.emailAddress;
//Alart
const reasonforDeletion = 'Reason for Deletion';
const delete = 'Delete';
const conformDelete = 'Conform Delete';
//Update Text
const updateByHeaderText='Updated By';
const oldvlueHeaderText='Old Value';
const newvalueHeaderText='New Value';
//Delete
const deleteDate='Date';
const deletePerson='Person';
const deleteReason='Delete Reason';
//Print
const printText='Print';



final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController aadharNumberController = TextEditingController();
final TextEditingController aadharfilePathController = TextEditingController();
final TextEditingController panNumberController = TextEditingController();
final TextEditingController panfilePathController = TextEditingController();
final TextEditingController addressline1Controller = TextEditingController();
final TextEditingController addressline2Controller = TextEditingController();
final TextEditingController cityController = TextEditingController();
final TextEditingController pincodeController = TextEditingController();
final TextEditingController stateController = TextEditingController();
final TextEditingController primaryAddressline1Controller =
    TextEditingController();
final TextEditingController primaryAddressline2Controller =
    TextEditingController();
final TextEditingController primaryCityControllerName = TextEditingController();
final TextEditingController primaryPincodeControllerName =
    TextEditingController();
final TextEditingController primaryStateControllerName =
    TextEditingController();
  final TextEditingController createBy = TextEditingController();
  final TextEditingController createOn = TextEditingController();
final TextEditingController secondaryAddressline1Controller =
    TextEditingController();
final TextEditingController secondaryAddressline2Controller =
    TextEditingController();
final TextEditingController secondaryCityController = TextEditingController();
final TextEditingController secondaryPincodeController =
    TextEditingController();
final TextEditingController secondaryStateController = TextEditingController();
final TextEditingController bloodGroupController = TextEditingController();
   
final TextEditingController primaryNameController = TextEditingController();
final TextEditingController primaryPhoneNumberController =
    TextEditingController();
final TextEditingController primaryWhatsappController = TextEditingController();
final TextEditingController primaryEmailController = TextEditingController();
final TextEditingController secondaryNameController = TextEditingController();
final TextEditingController secondaryPhoneNumberController =
    TextEditingController();
    final TextEditingController secondaryEmailController = TextEditingController();
final TextEditingController secondaryWhatsappController =TextEditingController();
final TextEditingController gstNumberController = TextEditingController();
final TextEditingController EmailController = TextEditingController();
final TextEditingController whatsappController = TextEditingController();
final TextEditingController accountNameController = TextEditingController();
final TextEditingController accountNumberController = TextEditingController();
final TextEditingController accountTypeController = TextEditingController();
final TextEditingController bankLocationController = TextEditingController();
final TextEditingController bankNameController = TextEditingController();
final TextEditingController ifscCodeController = TextEditingController();
final TextEditingController supplierCategoryController =  TextEditingController();
final TextEditingController laborCategoryController = TextEditingController();
final TextEditingController rateModelController = TextEditingController();  
final TextEditingController laborRateController = TextEditingController();
final TextEditingController teamMemberController = TextEditingController();
final TextEditingController rateController = TextEditingController();
final TextEditingController gpayNumberController = TextEditingController();
final TextEditingController siteWorkedController = TextEditingController();
final TextEditingController currentSiteAllocationController =
    TextEditingController();
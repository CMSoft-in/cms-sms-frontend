import 'package:flutter/material.dart';

const sitepage1 = 'Page 1 of 8';
const sitepage2 = 'Page 2 of 8';
const sitepage3 = 'Page 3 of 8';
const sitepage4 = 'Page 4 of 8';
const sitepage5 = 'Page 5 of 8';
const sitepage6 = 'Page 6 of 8';
const sitepage7 = 'Page 7 of 8';
const sitepage8 = 'Page 8 of 8';

//Delete

const deleteSiteText = "Deleted Sites";
const siteInfo = 'Site Information';
const siteName = 'Site Name';
const siteAddress = 'Site Address';
const sitegps = 'Site GPS Location';
const projectDetails = 'Project Details';
const projectWorkName = 'Project Work Name';
const shortDescriptionofProjectWork = 'Short Description of Project Work';
const projectSize = 'Project Size';
const projectStartDate = 'Project Start Date';
const sitePrimaryContact = 'Site Primary Contact';
const siteSecondaryContact = 'Site Secondary Contact';
const siteAllocation = 'Site Allocation';
const siteDocumentation = 'Site Documentation';
const companySiteEngineersAllocated = 'Company Site Engineers Allocated';
const laborsAllocated = 'Labors Allocated';
const expectedCompletionDate = 'Expected Completion Date';
const clientLegalAgreementsDocuments = 'Client Legal Agreements / Documents';
const governmentApprovals = 'Government Approvals';
const siteProgressionImages = 'Site Progression Images';
const constructionTechnicalDocs = 'Construction Technical Documents';
const clientEngineer = 'Client Engineer';
const clientArchitect = 'Client Architect';
const siteEngineer = 'Client Site Engineer';
const clientPurchaseOfficer = 'Client Purchase Officer';
const clientQualityOfficer = 'Client Quality Officer';
const addClientEngineer = 'Add Client Engineer';
const addClientArchitect = 'Add Client Architect';
const addSiteEngineer = 'Add Client Site Engineer';
const addPurchaseOfficer = 'Add Purchase Officer';
const addclientQualityOfficer = 'Add Client Quality Officer';
const sitedetails = 'Enter the Site Details';
const viewSiteDetailsText = "View Site Details";
const editSiteDetailsText = "Edit Site Details";

//Site DataTable
const siteDataTableName = 'Site Name';
const siteDataTableProjectName = 'Project Name';

//DbName
const dbSiteName = 'co_site_name';
const dbSiteAddressOne = 'site_address_line1';
const dbSiteAddressTwo = 'site_address_line2';
const dbSitePincode = 'site_pincode';
const dbSiteTown = 'site_town';
const dbSiteState = 'site_state';
const dbSiteGpsLocation = 'site_gps_location';
const dbSiteProjectWorkName = 'project_work_name';
const dbSiteProjectSize = 'project_size';
const dbSiteProjectStartDate = 'project_start_date';
const dbSiteProjectCompletionDate = 'project_planned_completion_date';
const dbSiteProjectDesc = "project_short_desc";
const dbPrimaryEmail = 'primary_contact_email';
const dbPrimaryName = 'primary_contact_name';
const dbPrimaryNumber = 'primary_contact_no';
const dbSecondaryName = 'secondary_contact_name';
const dbSecondaryEmail = 'secondary_contact_email';
const dbSecondaryNumber = 'secondary_contact_no';
const dbPrimaryWhatsapp = 'primary_contact_whatsapp';
const dbSecondaryWhatsapp = 'secondary_contact_whatsapp';
final siteNameController = TextEditingController();
final sitegpsController = TextEditingController();
final formKey = GlobalKey<FormState>();
final expectedCompletionDateController = TextEditingController();
final projectSizeController = TextEditingController();
final projectStartDateController = TextEditingController();
final projectWorkDescriptionofController = TextEditingController();
final projectWorkNameController = TextEditingController();
final companySiteEngineersAllocatedController = TextEditingController();
final laborsAllocatedController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController nameController=TextEditingController();
final TextEditingController governmentApprovalsController =
    TextEditingController();
final TextEditingController clientArchitectEmailController =
    TextEditingController();
final TextEditingController clientArchitectNameController =
    TextEditingController();
final TextEditingController clientArchitectPhoneNumberController =
    TextEditingController();
final TextEditingController clientArchitectWhatsappController =
    TextEditingController();
final TextEditingController clientEngineerEmailController =
    TextEditingController();
final TextEditingController clientEngineerNameController =
    TextEditingController();
final TextEditingController clientEngineerPhoneNumberController =
    TextEditingController();
final TextEditingController clientEngineerWhatsappController =
    TextEditingController();
final TextEditingController siteEngineerEmailController =
    TextEditingController();
final TextEditingController siteEngineerNameController =
    TextEditingController();
final TextEditingController siteEngineerPhoneNumberController =
    TextEditingController();
final TextEditingController siteEngineerWhatsappController =
    TextEditingController();
final TextEditingController clientPurchaseOfficerEmailController =
    TextEditingController();
final TextEditingController clientPurchaseOfficerNameController =
    TextEditingController();
final TextEditingController clientPurchaseOfficerPhoneNumberController =
    TextEditingController();
final TextEditingController clientPurchaseOfficerWhatsappController =
    TextEditingController();
final TextEditingController clientQualityOfficerEmailController =
    TextEditingController();
final TextEditingController clientQualityOfficerNameController =
    TextEditingController();
final TextEditingController clientQualityOfficerPhoneNumberController =
    TextEditingController();
final TextEditingController clientQualityOfficerWhatsappController =
    TextEditingController();

class SitesTextEditingController {
  final  TextEditingController siteNameController = TextEditingController();
  final TextEditingController sitegpsController = TextEditingController();
  final  TextEditingController expectedCompletionDateController = TextEditingController();
  final TextEditingController  projectSizeController = TextEditingController();
  final TextEditingController  projectStartDateController = TextEditingController();
  final TextEditingController  projectWorkDescriptionofController = TextEditingController();
  final TextEditingController  projectWorkNameController = TextEditingController();
  final TextEditingController  companySiteEngineersAllocatedController = TextEditingController();
  final TextEditingController  laborsAllocatedController = TextEditingController();
  final   TextEditingController emailController = TextEditingController();
  final   TextEditingController governmentApprovalsController =
      TextEditingController();
  final TextEditingController addressline1Controller = TextEditingController();
  final TextEditingController addressline2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController primaryEmailController = TextEditingController();
  final TextEditingController primaryNameController = TextEditingController();
  final TextEditingController primaryPhoneNumberController =
      TextEditingController();
  final TextEditingController primaryWhatsappController =
      TextEditingController();
  final TextEditingController secondaryEmailController =
      TextEditingController();
  final TextEditingController secondaryNameController = TextEditingController();
  final TextEditingController secondaryPhoneNumberController =
      TextEditingController();
  final TextEditingController secondaryWhatsappController =
      TextEditingController();
  final TextEditingController clientArchitectEmailController =
      TextEditingController();
  final TextEditingController clientArchitectNameController =
      TextEditingController();
  final TextEditingController clientArchitectPhoneNumberController =
      TextEditingController();
  final TextEditingController clientArchitectWhatsappController =
      TextEditingController();
  final TextEditingController clientEngineerEmailController =
      TextEditingController();
  final TextEditingController clientEngineerNameController =
      TextEditingController();
  final TextEditingController clientEngineerPhoneNumberController =
      TextEditingController();
  final TextEditingController clientEngineerWhatsappController =
      TextEditingController();
  final TextEditingController siteEngineerEmailController =
      TextEditingController();
  final TextEditingController siteEngineerNameController =
      TextEditingController();
  final TextEditingController siteEngineerPhoneNumberController =
      TextEditingController();
  final TextEditingController siteEngineerWhatsappController =
      TextEditingController();
  final TextEditingController clientPurchaseOfficerEmailController =
      TextEditingController();
  final TextEditingController clientPurchaseOfficerNameController =
      TextEditingController();
  final TextEditingController clientPurchaseOfficerPhoneNumberController =
      TextEditingController();
  final TextEditingController clientPurchaseOfficerWhatsappController =
      TextEditingController();
  final TextEditingController clientQualityOfficerEmailController =
      TextEditingController();
  final TextEditingController clientQualityOfficerNameController =
      TextEditingController();
  final TextEditingController clientQualityOfficerPhoneNumberController =
      TextEditingController();
  final TextEditingController clientQualityOfficerWhatsappController =
      TextEditingController();
}

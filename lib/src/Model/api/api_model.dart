import 'package:cmssms/src/Model/api/local.dart';

class ApiEndpoints {
  static String domain = "Admin";
  // Base URL
  static String  baseUrl = '$ip$domain';

  // CoUser endpoints
  static String createCoUser = '$baseUrl/create-couser';
  static String getCoUser = '$baseUrl/couser';
  static String getAllCoUsers = '$baseUrl/all-cousers';
  static String updateCoUser = '$baseUrl/update-couser';
  static String deleteCoUser = '$baseUrl/delete-couser';
  static String getAllDeletedCoUsers = '$baseUrl/deleted-cousers';
  static String getCoUserUpdateHistory = '$baseUrl/updatehistory-couser';

  // Client endpoints
  static String createClient = '$baseUrl/create-client';
  static String getAllClients = '$baseUrl/all-clients';
  static String getClient = '$baseUrl/client';
  static String deleteClient = '$baseUrl/delete-client';
  static String updateClient = '$baseUrl/update-client';
  static String getAllDeletedClients = '$baseUrl/deleted-clients';
  static String getClientUpdateHistory = '$baseUrl/updatehistory-client';

  // Site endpoints
  static String createSite = '$baseUrl/create-site';
  static String getAllSites = '$baseUrl/all-sites';
  static String getSite = '$baseUrl/site';
  static String updateSite = '$baseUrl/update-site';
  static String deleteSite = '$baseUrl/delete-site';
  static String getAllDeletedSites = '$baseUrl/deleted-sites';
  static String getSiteUpdateHistory = '$baseUrl/updatehistory-site';

  // Labour Category endpoints
  static String createLabourCategory = '$baseUrl/create-labourcategory';
  static String getAllLabourCategories = '$baseUrl/all-labourcategories';
  static String getLabourCategory = '$baseUrl/labourcategory';
  static String getAllDeletedLabourCategories =
      '$baseUrl/deleted-labourcategories';
  static String updateLabourCategory = '$baseUrl/update-labourcategory';
  static String deleteLabourCategory = '$baseUrl/delete-labourcategory';

  // Labour endpoints
  static String createLabour = '$baseUrl/create-labour';
  static String getAllLabours = '$baseUrl/all-labours';
  static String getLabour = '$baseUrl/labour';
  static String getLabourUpdateHistory = '$baseUrl/updatehistory-labour';
  static String updateLabour = '$baseUrl/update-labour';
  static String deleteLabour = '$baseUrl/delete-labour';
  static String getAllDeletedLabours = '$baseUrl/deleted-labours';

  // Supplier Category endpoints
  static String createSupplierCategory = '$baseUrl/create-supplier-category';
  static String getAllSupplierCategories = '$baseUrl/all-supplier-categories';
  static String getSupplierCategory = '$baseUrl/supplier-category';
  static String deleteSupplierCategory = '$baseUrl/delete-supplier-category';
  static String updateSupplierCategory = '$baseUrl/update-supplier-category';
  static String getAllDeletedSupplierCategories =
      '$baseUrl/deleted-supplier-categories';

  // Material endpoints
  static String createMaterial = '$baseUrl/create-material';
  static String getAllMaterials = '$baseUrl/all-materials';
  static String getMaterial = '$baseUrl/material';
  static String deleteMaterial = '$baseUrl/delete-material';
  static String updateMaterial = '$baseUrl/update-material';
  static String getAllDeletedMaterials = '$baseUrl/deleted-materials';

  // Supplier endpoints
  static String createSupplier = '$baseUrl/create-supplier';
  static String getAllSuppliers = '$baseUrl/all-suppliers';
  static String getSupplier = '$baseUrl/supplier';
  static String deleteSupplier = '$baseUrl/delete-supplier';
  static String getSupplierUpdateHistory = '$baseUrl/updatehistory-supplier';
  static String updateSupplier = '$baseUrl/update-supplier';
  static String getAllDeletedSuppliers = '$baseUrl/deleted-suppliers';

  // Machine endpoints
  static String createMachine = '$baseUrl/create-machine';
  static String getAllMachines = '$baseUrl/all-machines';
  static String getMachine = '$baseUrl/machine';
  static String deleteMachine = '$baseUrl/delete-machine';
  static String updateMachine = '$baseUrl/update-machine';
  static String getAllDeletedMachines = '$baseUrl/deleted-machines';
  static String getMachineUpdateHistory = '$baseUrl/updatehistory-machine';

  // Vehicle endpoints
  static String createVehicle = '$baseUrl/create-vehicle';
  static String getAllVehicles = '$baseUrl/all-vehicles';
  static String getVehicle = '$baseUrl/vehicle';
  static String deleteVehicle = '$baseUrl/delete-vehicle';
  static String updateVehicle = '$baseUrl/update-vehicle';
  static String getAllDeletedVehicles = '$baseUrl/deleted-vehicles';
  static String getVehicleUpdateHistory = '$baseUrl/updatehistory-vehicle';

  // Work Category endpoints
  static String createWorkCategory = '$baseUrl/create-work-category';
  static String getAllWorkCategories = '$baseUrl/all-work-categories';
  static String getWorkCategory = '$baseUrl/work-category';
  static String updateWorkCategory = '$baseUrl/update-work-category';
  static String deleteWorkCategory = '$baseUrl/delete-work-category';
  static String getAllDeletedWorkCategories =
      '$baseUrl/deleted-work-categories';
}

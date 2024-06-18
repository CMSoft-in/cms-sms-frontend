// // ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

// import 'dart:convert';
// import 'package:cmssms/src/Model/api/api_model.dart';

// import '../../../../../../controler/GetDate/get_date.dart';
// import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_four.dart';
// import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_one.dart';
// import 'labor_view_details_five.dart';
// import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_two.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import '../../../../../../Model/Const/color.dart';
// import '../../../../../../Model/Const/height_width.dart';
// import '../../../../../../Model/Const/text_const.dart';
// import '../../../../../../Model/api/local.dart';
// import '../../../../../../controler/common_controller.dart';
// import '../../../../../widgets/AppBar/AppBar.dart';
// import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
// import '../../../../../widgets/Buttons/Long_SizeButton.dart';
// import '../../../../../widgets/CommonUsageForm/AlartBox/alart_popup.dart';
// import '../../../../../widgets/CommonUsageForm/Update/update_data_item.dart';
// import '../../../../../widgets/CommonUsageForm/Update/update_header.dart';
// import '../../../../../widgets/CommonUsageForm/createBy.dart';
// import '../../../../../widgets/CommonUsageForm/view_details_text.dart';
// import '../labor_text_const.dart';
// import '../labordataview/labor_data_view.dart';
// import 'labor_view_details_three.dart';

// class LaborViewDetailsMain extends StatefulWidget {
//   const LaborViewDetailsMain({Key? key, required this.id}) : super(key: key);
//   final id;

//   @override
//   State<LaborViewDetailsMain> createState() => _LaborViewDetailsMainState();
// }

// class _LaborViewDetailsMainState extends State<LaborViewDetailsMain> {
//   Map<String, dynamic>? data;
//   var updatedData;
//   int? coLabourCategoryId;
//   CommonController commonController = CommonController();
//   List<dynamic> coLabourCategoryIds = [];
//   int? coLabourCategoryIdsOne;
//   List<int> coSiteWorkedIds = [];
//  int? coCurrentSiteAllocationIds ;
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//     fetchUpdateData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final response = await http.get(
//         Uri.parse('${ApiEndpoints.getLabour}/${widget.id}'),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       );
//       if (response.statusCode == 200) {
//          if (mounted) {
//         setState(() {
//           data = jsonDecode(response.body);
//           print(data);
//           if (data != null) {
        
//               rateModelController.text = data!["co_labour_rate_model"] ?? "";
//               laborRateController.text = data!["co_labour_rate"].toString();
//               aadharNumberController.text = data!["aadhar_no"].toString();
//               phoneNumberController.text = data!["mobile_no"] ?? "";
//               firstNameController.text = data!["first_name"] ?? "";
//               lastNameController.text = data!["last_name"] ?? "";
//               addressline1Controller.text = data!["address_line1"] ?? "";
//               addressline2Controller.text = data!["address_line2"] ?? "";
//               cityController.text = data!["town"] ?? "";
//               stateController.text = data!["state"] ?? "";
//               pincodeController.text = data!["pincode"] ?? "";
//               gpayNumberController.text = data!["gpay_no"] ?? "";
//               accountNameController.text = data!["bank_acc_name"] ?? "";
//               accountNumberController.text = data!["bank_acc_no"] ?? "";
//               accountTypeController.text = data!["bank_acc_type"] ?? "";
//               bankNameController.text = data!["bank_name"] ?? "";
//               primaryNameController.text = data!["emergency_contact_name"] ?? "";
//               ifscCodeController.text = data!["bank_ifsc_code"] ?? "";
//               primaryEmailController.text = data!["email"] ?? "";
//               primaryWhatsappController.text = data!["whatsapp"] ?? "";
//               bloodGroupController.text = data!["bloodgroup"] ?? "";
//               primaryPhoneNumberController.text = data!["emergency_contact_no"] ?? "";
//               createBy.text = data!["created_by"] ?? "";
//               createOn.text = Date.getDate(data!["createdAt"]) ?? "";

//               laborCategoryController.text = data!["CoLabourCategory"]["co_labour_category_name"] ?? "";
//               currentSiteAllocationController.text = data!["co_current_sites_allocation_sites"].isNotEmpty ? data!["co_current_sites_allocation_sites"][0]["co_site_name"] : "";

//               if (data!["co_sites_worked_sites"] != null) {
//                 List<String> siteNames = [];
//                 for (var site in data!["co_sites_worked_sites"]) {
//                   siteNames.add(site["co_site_name"] ?? '');
//                 }
//                 siteWorkedController.text = siteNames.join(', ');
//               }
//           }
//         });}
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }

//   Future<void> fetchUpdateData() async {
//     try {
//       final response = await http.get(
//         Uri.parse('${ApiEndpoints.getLabourUpdateHistory}/${widget.id}'),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       );
//       if (response.statusCode == 200) {
//          if (mounted) {
//         setState(() {
//           var updateData = [];

//           var data = jsonDecode(response.body);

//           for (var eachData in data) {
//             if (eachData["co_labour_id"].toString() == widget.id) {
//               updateData.add(eachData);
//             }
//           }
//           updatedData = updateData;
//         });
//      } } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }

//   bool isEditing = false;
//   bool isEnabled = false;

//   void updateData(data) async {
//     try {
//       var response = await http.patch(
//         Uri.parse('${ApiEndpoints.updateLabour}/${widget.id}'),
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token",
//         },
//         body: jsonEncode(data),
//       );

//       print(response.body);
//       if (response.statusCode == 200) {
//         print(response.body);
//         Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) => const LaborDataView()));
//       } else {
//         print(response.body);
//       }
//     } catch (e) {
//       print("update failed $e");
//     }
//   }

//   void laborCheckUpdatingValue() {
//     var oldData = data;
//     if (oldData != null) {
//       Map<String, dynamic> updatedData = {};

//       var currentData = {
//         "first_name": firstNameController.text,
//         "last_name": lastNameController.text,
//         "address_line1": addressline1Controller.text,
//         "address_line2": addressline2Controller.text,
//         "town": cityController.text,
//         "state": stateController.text,
//         "pincode": pincodeController.text,
//         "emergency_contact_name": primaryNameController.text,
//         "emergency_contact_no": primaryPhoneNumberController.text,
//         "mobile_no": phoneNumberController.text,
//         "email": primaryEmailController.text,
//         "bloodgroup": bloodGroupController.text,
//         "gpay_no": gpayNumberController.text,
//         "bank_acc_name": accountNameController.text,
//         "bank_acc_no": accountNumberController.text,
//         "bank_acc_type": accountTypeController.text,
//         "bank_name": bankNameController.text,
//         "bank_ifsc_code": ifscCodeController.text,
//         "aadhar_no": aadharNumberController.text,
//         "co_labour_rate": laborRateController.text,
//         "co_labour_rate_model": rateModelController.text,
//       };

//       currentData.forEach((key, value) {
//         if (value.isNotEmpty && (oldData[key] ?? '') != value) {
//           updatedData[key] = value;
//           print(updatedData);
//         }
//       });
//       if (updatedData.isNotEmpty) {
//         print("Updated Data: $updatedData");
//         updateData(updatedData);
//       } else {
//         print("No changes detected.");
//       }
//     }
//   }
  
//   void changeLaValue(int? v) {
//     setState(() {
//       coLabourCategoryId = v;
//     });
//   }

//    void changeValue(List<String> v) {
//     setState(() {
//       coSiteWorkedIds = v.map((id) => int.parse(id)).toList();
//     });
//   }
  

//   // void changeValueOne(List<String> v) {
//   //   setState(() {
//   //     coCurrentSiteAllocationIds = v.map((id) => int.parse(id)).toList();
//   //   });
//   // }
//  void changeValueOne(int? v) {
//     setState(() {
//       coCurrentSiteAllocationIds = v;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     return Scaffold(
//       backgroundColor: white,
//       appBar: const BuildAppBar(),
//       body: SingleChildScrollView(
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               ViewDetailsText(
//                 viewClientDetailsTextt:
//                     isEditing ? editLaborDetailsText : viewLaborDetailsText,
//                 editOnPress: () {
//                   setState(() {
//                     isEditing = !isEditing;
//                     isEnabled = !isEnabled;
//                   });
//                 },
//                 deleteOnPress: AlartMessage(
//                   api: '${ApiEndpoints.deleteLabour}/${widget.id}',
//                   onPress: const LaborDataView(),
//                 ),
//               ),
//               LaborViewDetailsOne(
//                   firstNameController: firstNameController,
//                   lastNameController: lastNameController,
//                   phoneNumberController: phoneNumberController,
//                   addressline1Controller: addressline1Controller,
//                   addressline2Controller: addressline2Controller,
//                   cityController: cityController,
//                   pincodeController: pincodeController,
//                   stateController: stateController,
//                   enabled: isEnabled),
//               LaborViewDetailsTwo(
//                   changeValue: changeLaValue,
//                   coLabourCategoryId: coLabourCategoryId,
//                   bloodGroupController: bloodGroupController,
//                   laborCategoryController: laborCategoryController,
//                   rateModelController: rateModelController,
//                   laborRateController: laborRateController,
//                   isEditing: isEditing,
//                   enabled: isEnabled),
//                    LaborViewDetailsThree(
//                         currentSiteAllocationController: currentSiteAllocationController,
//                         siteWorkedController: siteWorkedController,
//                         coCurrentSiteAllocationIds: coCurrentSiteAllocationIds,
//                         changeValueOne: changeValueOne,
//                         changeValue: changeValue,
//                         coLabourCategoryId: coSiteWorkedIds.isNotEmpty ? coSiteWorkedIds.first : null,
//                         aadharController:aadharNumberController,
//                         isEditing: isEditing,
//                         enabled: isEditing,
//                       ),
// //              
//               LaborViewDetailsFour(
//                   primaryNameController: primaryNameController,
//                   primaryPhoneNumberController: primaryPhoneNumberController,
//                   primaryEmailController: primaryEmailController,
//                   primaryWhatsappController: primaryWhatsappController,
//                   secondaryNameController: secondaryNameController,
//                   secondaryPhoneNumberController:
//                       secondaryPhoneNumberController,
//                   secondaryEmailController: secondaryEmailController,
//                   secondaryWhatsappController: secondaryWhatsappController,
//                   enabled: isEnabled),
//               LaborViewDetailsFive(
//                   isEditing: isEditing,
//                   gpayNumber: gpayNumberController,
//                   accountNameController: accountNameController,
//                   accountNumberController: accountNumberController,
//                   accountTypeController: accountTypeController,
//                   bankLocationController: bankLocationController,
//                   bankNameController: bankNameController,
//                   ifscCodeController: ifscCodeController,
//                   enabled: isEnabled),
//               CreateByCreatedOn(
//                 createByController: createBy,
//                 createOnController: createOn,
//                 enabled: false,
//               ),
//               formSizebox15,
//               LongButton(
//                 formKey: formKey,
//                 text: update,
//                 onPressed: () {
//                   laborCheckUpdatingValue();
//                 },
//                 isEnabled: isEnabled,
//               ),
//               if (updatedData != null)
//                 if (updatedData.length != 0)
//                   Column(
//                     children: [
//                       const UpdateHeader(
//                         updatedByHeader: updateByHeaderText,
//                         newValueHeader: newvalueHeaderText,
//                         oldValueHeader: oldvlueHeaderText,
//                       ),
//                       ...updatedData.map((eachItem) {
//                         return updatedDataItem(
//                           eachItem["updated_old_value"],
//                           eachItem["updated_new_value"],
//                           eachItem["updated_by"].toString(),
//                         );
//                       }).toList(),
//                       bottomHeight,
//                     ],
//                   ),
//               bottomHeight,
//             ],
//           ),
//         ),
//       ),
//       bottomSheet: const BottomSheetLogo(),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../labordataview/labor_data_view.dart';
import '/src/Model/api/api_model.dart';
import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_four.dart';
import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_five.dart';
import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_one.dart';
import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_three.dart';
import '/src/View/screens/Home/Admin/labor/laborviewdetails/labor_view_details_two.dart';
import '/src/View/widgets/AppBar/AppBar.dart';
import '/src/View/widgets/BottomLogo/bottom_sheet_logo.dart';
import '/src/View/widgets/Buttons/Long_SizeButton.dart';
import '/src/View/widgets/CommonUsageForm/AlartBox/alart_popup.dart';
import '/src/View/widgets/CommonUsageForm/Update/update_data_item.dart';
import '/src/View/widgets/CommonUsageForm/Update/update_header.dart';
import '/src/View/widgets/CommonUsageForm/createBy.dart';
import '/src/View/widgets/CommonUsageForm/view_details_text.dart';
import '/src/controler/GetDate/get_date.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/height_width.dart';
import '/src/Model/Const/text_const.dart';
import '/src/Model/api/local.dart';
import '/src/View/screens/Home/Admin/labor/labor_text_const.dart';

class LaborViewDetailsMain extends StatefulWidget {
  const LaborViewDetailsMain({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<LaborViewDetailsMain> createState() => _LaborViewDetailsMainState();
}
class _LaborViewDetailsMainState extends State<LaborViewDetailsMain> {
  Map<String, dynamic>? data;
  List<dynamic>? updatedData;
  int? coLabourCategoryId;
  List<int> coSiteWorkedIds = [];
  int? coCurrentSiteAllocationIds;
  
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchUpdateData();
  }

  @override
  void dispose() {
    // Dispose of any controllers or resources here
    super.dispose();
  }

  bool isEditing = false;
  bool isEnabled = false;

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getLabour}/${widget.id}'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (mounted) {
          setState(() {
            if (jsonData != null && jsonData.isNotEmpty) {
              data = jsonData;
              _populateControllers();
            } else {
              print('Fetched data is null or empty');
            }
          });
        }
      } else {
        print('Failed to load data: ${response.body}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> fetchUpdateData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.getLabourUpdateHistory}/${widget.id}'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            updatedData = jsonDecode(response.body);
          });
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void _populateControllers() {
    if (data != null) {
      rateModelController.text = data!["co_labour_rate_model"] ?? "";
      laborRateController.text = data!["co_labour_rate"]?.toString() ?? "";
      aadharNumberController.text = data!["aadhar_no"]?.toString() ?? "";
      phoneNumberController.text = data!["mobile_no"] ?? "";
      firstNameController.text = data!["first_name"] ?? "";
      lastNameController.text = data!["last_name"] ?? "";
      addressline1Controller.text = data!["address_line1"] ?? "";
      addressline2Controller.text = data!["address_line2"] ?? "";
      cityController.text = data!["town"] ?? "";
      stateController.text = data!["state"] ?? "";
      pincodeController.text = data!["pincode"] ?? "";
      gpayNumberController.text = data!["gpay_no"] ?? "";
      accountNameController.text = data!["bank_acc_name"] ?? "";
      accountNumberController.text = data!["bank_acc_no"] ?? "";
      accountTypeController.text = data!["bank_acc_type"] ?? "";
      bankNameController.text = data!["bank_name"] ?? "";
      primaryNameController.text = data!["emergency_contact_name"] ?? "";
      ifscCodeController.text = data!["bank_ifsc_code"] ?? "";
      primaryEmailController.text = data!["email"] ?? "";
      primaryWhatsappController.text = data!["whatsapp"] ?? "";
      bloodGroupController.text = data!["bloodgroup"] ?? "";
      primaryPhoneNumberController.text = data!["emergency_contact_no"] ?? "";
      createBy.text = data!["created_by"] ?? "";
      createOn.text = Date.getDate(data!["createdAt"]) ?? "";

      laborCategoryController.text =
          data!["CoLabourCategory"]?["co_labour_category_name"] ?? "";
      currentSiteAllocationController.text =
          (data!["co_current_sites_allocation_sites"]?.isNotEmpty ?? false)
              ? data!["co_current_sites_allocation_sites"][0]["co_site_name"] ?? ""
              : "";

      if (data!["co_sites_worked_sites"] != null) {
        List<String> siteNames = [];
        for (var site in data!["co_sites_worked_sites"]) {
          siteNames.add(site["co_site_name"] ?? '');
        }
        siteWorkedController.text = siteNames.join(', ');
      }
    }
  }

  void _updateData(Map<String, dynamic> data) async {
    try {
      final response = await http.patch(
        Uri.parse('${ApiEndpoints.updateLabour}/${widget.id}'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LaborDataView()));
      } else {
        print(response.body);
      }
    } catch (e) {
      print("Update failed: $e");
    }
  }

  void _checkAndUpdateValues() {
    final oldData = data;
    if (oldData != null) {
      final updatedData = <String, dynamic>{};

      final currentData = {
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "address_line1": addressline1Controller.text,
        "address_line2": addressline2Controller.text,
        "town": cityController.text,
        "state": stateController.text,
        "pincode": pincodeController.text,
        "emergency_contact_name": primaryNameController.text,
        "emergency_contact_no": primaryPhoneNumberController.text,
        "mobile_no": phoneNumberController.text,
        "email": primaryEmailController.text,
        "bloodgroup": bloodGroupController.text,
        "gpay_no": gpayNumberController.text,
        "bank_acc_name": accountNameController.text,
        "bank_acc_no": accountNumberController.text,
        "bank_acc_type": accountTypeController.text,
        "bank_name": bankNameController.text,
        "bank_ifsc_code": ifscCodeController.text,
        "aadhar_no": aadharNumberController.text,
        "co_labour_rate": laborRateController.text,
        "co_labour_rate_model": rateModelController.text,
      };

      currentData.forEach((key, value) {
        if (value.isNotEmpty && (oldData[key] ?? '') != value) {
          updatedData[key] = value;
        }
      });
      if (updatedData.isNotEmpty) {
        _updateData(updatedData);
      } else {
        print("No changes detected.");
      }
    }
  }

  void _changeLaborCategory(int? value) {
    setState(() {
      coLabourCategoryId = value;
    });
  }

  void _changeCurrentSiteAllocation(int? value) {
    setState(() {
      coCurrentSiteAllocationIds = value;
    });
  }

  void _changeSiteWorked(List<String> value) {
    setState(() {
      coSiteWorkedIds = value.map((id) => int.parse(id)).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ViewDetailsText(
                viewClientDetailsTextt:
                    isEditing ? editLaborDetailsText : viewLaborDetailsText,
                editOnPress: () {
                  setState(() {
                    isEditing = !isEditing;
                    isEnabled = !isEnabled;
                  });
                },
                deleteOnPress: AlartMessage(
                  api: '${ApiEndpoints.deleteLabour}/${widget.id}',
                  onPress: const LaborDataView(),
                ),
              ),
              LaborViewDetailsOne(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  phoneNumberController: phoneNumberController,
                  addressline1Controller: addressline1Controller,
                  addressline2Controller: addressline2Controller,
                  cityController: cityController,
                  pincodeController: pincodeController,
                  stateController: stateController,
                  enabled: isEnabled),
              LaborViewDetailsTwo(
                  changeValue: _changeLaborCategory,
                  coLabourCategoryId: coLabourCategoryId,
                  bloodGroupController: bloodGroupController,
                  laborCategoryController: laborCategoryController,
                  rateModelController: rateModelController,
                  laborRateController: laborRateController,
                  isEditing: isEditing,
                  enabled: isEnabled),
              LaborViewDetailsThree(
                  currentSiteAllocationController:
                      currentSiteAllocationController,
                  siteWorkedController: siteWorkedController,
                  coCurrentSiteAllocationIds: coCurrentSiteAllocationIds,
                  changeValueOne: _changeCurrentSiteAllocation,
                  changeValue: _changeSiteWorked,
                  coLabourCategoryId: coSiteWorkedIds.isNotEmpty
                      ? coSiteWorkedIds.first
                      : null,
                  aadharController: aadharNumberController,
                  isEditing: isEditing,
                  enabled: isEditing),
              LaborViewDetailsFour(
                  primaryNameController: primaryNameController,
                  primaryPhoneNumberController: primaryPhoneNumberController,
                  primaryEmailController: primaryEmailController,
                  primaryWhatsappController: primaryWhatsappController,
                  secondaryNameController: secondaryNameController,
                  secondaryPhoneNumberController: secondaryPhoneNumberController,
                  secondaryEmailController: secondaryEmailController,
                  secondaryWhatsappController: secondaryWhatsappController,
                  enabled: isEnabled),
              LaborViewDetailsFive(
                  isEditing: isEditing,
                  gpayNumber: gpayNumberController,
                  accountNameController: accountNameController,
                  accountNumberController: accountNumberController,
                  accountTypeController: accountTypeController,
                  bankLocationController: bankLocationController,
                  bankNameController: bankNameController,
                  ifscCodeController: ifscCodeController,
                  enabled: isEnabled),
              CreateByCreatedOn(
                createByController: createBy,
                createOnController: createOn,
                enabled: false,
              ),
              formSizebox15,
              LongButton(
                formKey: formKey,
                text: update,
                onPressed: () {
                  _checkAndUpdateValues();
                },
                isEnabled: isEnabled,
              ),
              if (updatedData != null && updatedData!.isNotEmpty)
                Column(
                  children: [
                    const UpdateHeader(
                      updatedByHeader: updateByHeaderText,
                      newValueHeader: newvalueHeaderText,
                      oldValueHeader: oldvlueHeaderText,
                    ),
                    ...updatedData!.map((eachItem) {
                      return updatedDataItem(
                        eachItem["updated_old_value"],
                        eachItem["updated_new_value"],
                        eachItem["updated_by"].toString(),
                      );
                    }).toList(),
                    bottomHeight,
                  ],
                ),
              bottomHeight,
            ],
          ),
        ),
      ),
      bottomSheet: const BottomSheetLogo(),
    );
  }
}

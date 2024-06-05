import '/src/View/widgets/AppBar/AppBar.dart';
import '/src/View/widgets/CommonUsageForm/DetailsText.dart';
import '/src/Model/Const/color.dart';
import '/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_one.dart';
import '/src/View/widgets/MyDrawer/my_drawer.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import 'site_form_two.dart';

class SiteFormPageOne extends StatefulWidget {
  const SiteFormPageOne({
    super.key,
  });

  @override
  State<SiteFormPageOne> createState() => _SiteFormPageOneState();
}

class _SiteFormPageOneState extends State<SiteFormPageOne> {
  final formKey = GlobalKey<FormState>();
  SitesTextEditingController sitesTextEditingController=SitesTextEditingController();
    
    

    void navigateToPageTwo(BuildContext context) {
      var data = {
        dbSiteName: sitesTextEditingController.siteNameController.text.isEmpty ? null :sitesTextEditingController.siteNameController.text.trim(),
        dbSiteAddressOne: sitesTextEditingController.addressline1Controller.text.isEmpty ? null :sitesTextEditingController.addressline1Controller.text.trim(),
        dbSiteAddressTwo: sitesTextEditingController.addressline2Controller.text.isEmpty ? null :sitesTextEditingController.addressline2Controller.text.trim(),
        dbSitePincode:sitesTextEditingController. pincodeController.text.isEmpty ? null :int.parse(sitesTextEditingController. pincodeController.text.trim()),
        dbSiteTown:sitesTextEditingController. cityController.text.isEmpty ? null :sitesTextEditingController. cityController.text.trim(),
        dbSiteState: sitesTextEditingController.stateController.text.isEmpty ? null :sitesTextEditingController.stateController.text.trim(),
        dbSiteGpsLocation: sitegpsController.text.isEmpty ? "Loction" :sitegpsController.text.trim()
      };
print(data);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SiteFormPageTwo(data: data),
        ),
      );
    }


  @override
  Widget build(BuildContext context) {

  

    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      drawer: MyDrawer(
        context: context,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              formSizebox8,
              const DetailsText(enterDetails: sitedetails),
              formSizebox15,
              const StackText(
                stacktext: sitepage1,
                color: red,
              ),
              SiteViewDetailsOne(
                  // ontap:_getLocation,
                  enabled: true,
                  isEditing: true,
                  addressline1Controller:sitesTextEditingController. addressline1Controller,
                  addressline2Controller:sitesTextEditingController. addressline2Controller,
                  cityControllerName:sitesTextEditingController. cityController,
                  pincodeControllerName:sitesTextEditingController. pincodeController,
                  siteNameController: sitesTextEditingController.siteNameController,
                  stateControllerName:sitesTextEditingController. stateController,
                  sitegpsController: sitesTextEditingController.sitegpsController),
              formSizebox15,
              bottomHeight,
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
          formKey: formKey,
          isEnabled: false,
          onPress: () => navigateToPageTwo(context)),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

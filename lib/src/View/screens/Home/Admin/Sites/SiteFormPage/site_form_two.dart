import '/src/View/widgets/AppBar/AppBar.dart';
import '/src/View/widgets/CommonUsageForm/HintText.dart';
import '/src/Model/Const/color.dart';
import '/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_two.dart';
import '/src/Model/utility/sites/site_text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../../Model/Const/height_width.dart';
import 'site_form_three.dart';

class SiteFormPageTwo extends StatelessWidget {
  const SiteFormPageTwo({super.key, required this.data});
 final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    var oldData = data;
    SitesTextEditingController sitesTextEditingController=SitesTextEditingController();

    void navigateToPageThree(BuildContext context) {
  
      var data = {
        ...oldData,
        dbSiteProjectWorkName:sitesTextEditingController.projectWorkNameController.text.isEmpty ? null :sitesTextEditingController.projectWorkNameController.text.trim(),
        dbSiteProjectSize:sitesTextEditingController.projectSizeController.text.isEmpty ? null :int.parse(sitesTextEditingController.projectSizeController.text.trim()),
        dbSiteProjectStartDate:sitesTextEditingController.projectStartDateController.text.isEmpty ? null :sitesTextEditingController.projectStartDateController.text.trim(),
        dbSiteProjectCompletionDate:sitesTextEditingController.expectedCompletionDateController.text.isEmpty ? null :sitesTextEditingController.expectedCompletionDateController.text.trim(),
        dbSiteProjectDesc:sitesTextEditingController.projectWorkDescriptionofController.text.isEmpty ? null :sitesTextEditingController.projectWorkDescriptionofController.text.trim(),
      };
          print(data);
       Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SiteFormPageThree(data: data),
        ),
      );
        
    }

    

    return Scaffold(
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              formSizebox8,
              const StackText(stacktext: sitepage2, color: red),
              formSizebox15,
              SiteViewDetailsTwo(
                  enabled: true,
                  isEditing: true,
                  expectedCompletionDateController:
                     sitesTextEditingController. expectedCompletionDateController,
                  projectSizeController: sitesTextEditingController.projectSizeController,
                  projectStartDateController: sitesTextEditingController.projectStartDateController,
                  projectWorkDescriptionofController:
                      sitesTextEditingController.projectWorkDescriptionofController,
                  projectWorkNameController: sitesTextEditingController.projectWorkNameController),
              formSizebox10,
              bottomHeight,
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
          formKey: formKey,
          isEnabled: true,
          onPress: () => navigateToPageThree(context)),
      bottomNavigationBar: BottomSheetLogo(),
    );
  }
}

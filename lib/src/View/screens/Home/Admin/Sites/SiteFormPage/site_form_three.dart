import '/src/View/widgets/AppBar/AppBar.dart';
import '/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_four.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import 'site_form_four.dart';

class SiteFormPageThree extends StatefulWidget {
  const SiteFormPageThree({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<SiteFormPageThree> createState() => _SiteFormPageThreeState();
}

class _SiteFormPageThreeState extends State<SiteFormPageThree> {
   

    final formKey = GlobalKey<FormState>();

    SitesTextEditingController sitesTextEditingController =
        SitesTextEditingController();

    navigateToPageFive(BuildContext context) {
      var oldData = widget.data;

    print(oldData);
      var data = {
        ...oldData,
        // dbPrimaryEmail:
        //     sitesTextEditingController.primaryEmailController.text.trim(),
        // dbPrimaryName:
        //     sitesTextEditingController.primaryNameController.text.trim(),
        // dbPrimaryNumber:
        //     sitesTextEditingController.primaryPhoneNumberController.text.trim(),
        // dbPrimaryWhatsapp:
        //     sitesTextEditingController.primaryWhatsappController.text.trim(),
        // dbSecondaryEmail:
        //     sitesTextEditingController.secondaryEmailController.text.trim(),
        // dbSecondaryName:
        //     sitesTextEditingController.secondaryNameController.text.trim(),
        // dbSecondaryNumber: sitesTextEditingController
        //     .secondaryPhoneNumberController.text
        //     .trim(),
        // dbSecondaryWhatsapp:
        //     sitesTextEditingController.secondaryWhatsappController.text.trim(),
        dbPrimaryEmail: sitesTextEditingController.primaryEmailController.text.isEmpty ? null :sitesTextEditingController.primaryEmailController.text.trim(),
        dbPrimaryName: sitesTextEditingController.primaryNameController.text.isEmpty ? null :sitesTextEditingController.primaryNameController.text.trim(),
        dbPrimaryNumber: sitesTextEditingController.primaryPhoneNumberController.text.isEmpty ? null :int.parse(sitesTextEditingController.primaryPhoneNumberController.text.trim()),
        dbPrimaryWhatsapp:
            sitesTextEditingController.primaryWhatsappController.text.isEmpty ? null :int.parse( sitesTextEditingController.primaryWhatsappController.text..trim()),
        dbSecondaryEmail:sitesTextEditingController. secondaryEmailController.text.isEmpty ? null :sitesTextEditingController. secondaryEmailController.text.trim(),
        dbSecondaryName:sitesTextEditingController. secondaryNameController.text.isEmpty ? null :sitesTextEditingController. secondaryNameController.text.trim(),
        dbSecondaryNumber: sitesTextEditingController.secondaryPhoneNumberController.text.isEmpty ? null :int.parse(sitesTextEditingController.secondaryPhoneNumberController.text.trim()),
        dbSecondaryWhatsapp: sitesTextEditingController.secondaryWhatsappController.text.isEmpty ? null :int.parse(sitesTextEditingController.secondaryWhatsappController.text.trim()),
      };
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SiteFormPageFour(data: data),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      backgroundColor: white,
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                formSizebox8,
                const StackText(stacktext: sitepage3, color: red),
                formSizebox15,
                SiteViewDetailsFour(
                    enabled: true,
                    emailController:
                        sitesTextEditingController.primaryEmailController,
                    nameController:
                        sitesTextEditingController.primaryNameController,
                    phoneNumberController:
                        sitesTextEditingController.primaryPhoneNumberController,
                    secondaryEmailController:
                        sitesTextEditingController.secondaryEmailController,
                    secondaryNameController:
                        sitesTextEditingController.secondaryNameController,
                    secondaryPhoneNumberController: sitesTextEditingController
                        .secondaryPhoneNumberController,
                    secondaryWhatsappController:
                        sitesTextEditingController.secondaryWhatsappController,
                    whatsappController:
                        sitesTextEditingController.primaryWhatsappController),
                formSizebox10,
                bottomHeight,
              ],
            )),
      ),
      bottomSheet: BackNextButton(
          formKey: formKey,
          isEnabled: true,
          onPress: () => navigateToPageFive(context)),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

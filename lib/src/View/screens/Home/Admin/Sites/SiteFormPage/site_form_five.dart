import 'package:flutter/material.dart';
import 'site_form_six.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import '../../../../../widgets/CommonUsageForm/HintText.dart';
import '../../../../../../Model/Const/color.dart';
import '../../../../../../Model/Const/height_width.dart';
import '../../../../../../Model/utility/sites/site_text_const.dart';
import '/src/View/widgets/AppBar/AppBar.dart';
import '/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_five.dart';

class SiteFormPageFive extends StatefulWidget {
  const SiteFormPageFive({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<SiteFormPageFive> createState() => _SiteFormPageFiveState();
}

class _SiteFormPageFiveState extends State<SiteFormPageFive> {
 
    final formKey = GlobalKey<FormState>();

    SitesTextEditingController sitesTextEditingController = SitesTextEditingController();

    void navigateToPageSix(BuildContext context) {
      var oldData = widget.data;

    print(oldData);

      var data = {
        ...oldData,
        // dbPrimaryEmail: sitesTextEditingController.governmentApprovalsController.text.trim(),
      };

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SiteFormPageSix(data: data),
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
              const StackText(stacktext: sitepage5, color: red),
              formSizebox15,
              SiteViewDetailsFive(
                enabled: true,
                governmentApprovalsController: sitesTextEditingController.governmentApprovalsController,
              ),
              formSizebox10,
              bottomHeight,
            ],
          ),
        ),
      ),
      bottomSheet: BackNextButton(
        formKey: formKey,
        isEnabled: true,
        onPress: () => navigateToPageSix(context),
      ),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

import '/src/View/widgets/AppBar/AppBar.dart';
import '/src/View/widgets/CommonUsageForm/HintText.dart';
import '/src/Model/Const/color.dart';
import '/src/Model/Const/height_width.dart';
import '/src/View/screens/Home/Admin/Sites/SiteViewDetails/site_view_details_three.dart';
import '/src/Model/utility/sites/site_text_const.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/BottomLogo/bottom_sheet_logo.dart';
import '../../../../../widgets/Buttons/next_back_button.dart';
import 'site_form_four.dart';

class SiteFormPage extends StatefulWidget {
  const SiteFormPage({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<SiteFormPage> createState() => _SiteFormPageState();
}

class _SiteFormPageState extends State<SiteFormPage> {
  

    List<int> labourAllocated = [];

    final formKey = GlobalKey<FormState>();

    SitesTextEditingController sitesTextEditingController =
        SitesTextEditingController();

    void navigateToPageThree(BuildContext context) {
       var oldData = widget.data;
      var data = {
        ...oldData,
        '': sitesTextEditingController
            .companySiteEngineersAllocatedController.text
            .trim(),
        'labours_allocated': labourAllocated
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
      appBar: const BuildAppBar(),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                formSizebox8,
                const StackText(stacktext: sitepage3, color: red),
                formSizebox15,
                SiteViewDetailsThree(
                    enabled: true,
                    companySiteEngineersAllocatedController:
                        sitesTextEditingController
                            .companySiteEngineersAllocatedController,
                    laborsAllocatedController:
                        sitesTextEditingController.laborsAllocatedController),
                formSizebox15,
                bottomHeight
              ],
            )),
      ),
      bottomSheet: BackNextButton(
          formKey: formKey,
          isEnabled: true,
          onPress: () => navigateToPageThree(context)),
      bottomNavigationBar: const BottomSheetLogo(),
    );
  }
}

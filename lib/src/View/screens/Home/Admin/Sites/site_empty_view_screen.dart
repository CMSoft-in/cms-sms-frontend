import 'package:flutter/material.dart';
import '../../../../../Model/Const/image_const.dart';
import '../../../../../Model/Const/text_const.dart';
import '../../../../../Model/EmptyDataScreenView/empty_data_screen_view.dart';
import 'SiteFormPage/site_form_one.dart';

class SiteEmptyViewScreen extends StatelessWidget {
  const SiteEmptyViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyDataScreenView(
      iconImage: sites,
      text: titlesites,
      page: SiteFormPageOne(),
      image: siteEmptyDataImage,
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../../Model/Const/image_const.dart';
import '../../../../../../Model/Const/text_const.dart';
import '../../../../../../Model/EmptyDataScreenView/empty_data_screen_view.dart';
import 'client_form_page_one.dart';

class ClientEmptyViewScreen extends StatelessWidget {
  const ClientEmptyViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmptyDataScreenView(
      image: clientEmptyDataImage,
      iconImage: clients,
      text: titleclients,
      page: ClientFormPageOne(),
    );
  }
}

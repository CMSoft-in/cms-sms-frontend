import '/src/View/widgets/CommonUsageForm/textformfeild/text_form_field.dart';
import '/src/Model/Const/text_const.dart';
import'package:flutter/material.dart';

import '../../../Model/Const/height_width.dart';
import '../../../Model/utility/client/client_text_const.dart';


class CreateByCreatedOn extends StatelessWidget {
  const CreateByCreatedOn({super.key,this.createByController,this.enabled,this.createOnController});
  final createByController;
  final enabled;
  final createOnController;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      formSizebox10,
    TextformField(controller: createByController, text: createby, limitLength: 18, optionalisEmpty: false, inputformat: alphabatsSpace, star: estar, inputtype:keyboardTypeNone , enabled: enabled),
    formSizebox10,
    TextformField(controller: createOnController, text: createon, limitLength: 10, optionalisEmpty: false, inputformat: alphabatsSpace, star: estar, inputtype:keyboardTypeNone , enabled: enabled)
    ],);
  }
}
 
import 'package:flutter/material.dart';
import '../../../Model/Const/color.dart';
import '../../../Model/Const/height_width.dart';
import '../../../Model/Const/text_const.dart';

class ValidateButton extends StatelessWidget {
  const ValidateButton({
    Key? key,
    required this.text,
    required this.formKey,
    required this.onPressed,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: formButtonColor,
        minimumSize: const Size(nextButtonWidth, nextButtonHeight),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          Widget nextPage = onPressed();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => nextPage));
         } 
        //else  {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text('Please fill out all mandatory fields.'),
        //       duration: Duration(seconds: 2),
        //     ),
        //   );
        // }
      },
      child: Text(text, style: textStyleWhite18),
    );
  }
}

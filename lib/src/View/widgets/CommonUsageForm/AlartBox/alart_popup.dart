import '/src/Model/Const/color.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../Model/api/local.dart';
import '../../../../Model/Const/height_width.dart';
import '../../../../Model/Const/text_const.dart';

class AlartMessage extends StatelessWidget {
  const AlartMessage({Key? key, this.id, this.onPress, required this.api})
      : super(key: key);
  final id;
  final onPress;
  final api;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final deleteReasonController = TextEditingController();

    void deleteData() async {
      try {
        print("button");
        var body = jsonEncode({"deletion_reason": deleteReasonController.text});
        final response = await http.delete(Uri.parse("$ip/$api/$id"),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
            body: body);
        if (response.statusCode == 200) {
          print(json.decode(response.body));
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => onPress));
        } else {
          print(response.body);
        }
      } catch (e) {
        print("getting error while delete $e");
      }
    }

    return AlertDialog(
      title: Row(
        children: [
          const Text(
            conformDelete,
            style: textStyle20,
          ),
          const Spacer(),
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.cancel)),
        ],
      ),
      content: Form(
        key: formKey,
        child: SizedBox(
          height: alartBoxHeight,
          width: double.infinity,
          child: TextFormField(
            controller: deleteReasonController,
            maxLines: 4,
            minLines: 4,
            decoration: InputDecoration(
              label: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: reasonforDeletion,
                    style: textStyleGrey18,
                  ),
                  TextSpan(text: star, style: textStyleRedStar)
                ]),
              ),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Please provide a reason for deletion';
              }
              return null;
            },
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: formButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              deleteData();
            }
          },
          child: const Text(
            delete,
            style: textStyleWhite18,
          ),
        ),
      ],
    );
  }
}
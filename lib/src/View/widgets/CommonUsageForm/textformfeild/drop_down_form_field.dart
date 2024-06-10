
import 'package:cmssms/src/Model/Const/color.dart';
import 'package:flutter/material.dart';
import '../../../../Model/Const/height_width.dart';
import '../../../../Model/Const/text_const.dart';

class DropDownForm extends StatefulWidget {
  final List<String> dropdownItems;
  final String dropDownName;
  final bool optionalisEmpty;
  final String star;
  final  TextEditingController controller;
  const DropDownForm(
      {super.key,
      required this.dropdownItems,
      required this.dropDownName,
      required this.star,
      required this.optionalisEmpty,
      required this.controller});

  @override
  DropDownFormState createState() => DropDownFormState();
}

class DropDownFormState extends State<DropDownForm> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: primaryWidth,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                fillColor: white,
                label: RichText(
                  text: TextSpan(
                  children: [
                    TextSpan(
                     text: widget.dropDownName,
                      style: textStyleGrey18,
                    ),
                    TextSpan(
                     text: widget.star,
                      style: textStyleRedStar,
                    )
                  ],)
                ),
                errorStyle: const TextStyle(color: Colors.red),
                border: const OutlineInputBorder(),
              ),
              validator: validMethod,
               style:textStyleBlack18,
              value: selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  print(newValue);
                  selectedItem = newValue;
                  widget.controller.text = selectedItem!;
                });
              },
              items: widget.dropdownItems.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              
            ),
          ),
        ],
      ),
    );
  }

  String? validMethod(value) {
    if (widget.optionalisEmpty == true) {
      if (value == null || value.isEmpty) {
        return "Please enter ${widget.dropDownName}";
      }
      return null;
    }
    return null;
  }
}



// import 'package:cmssms/src/Model/Const/color.dart';
// import 'package:flutter/material.dart';

// import '../../../../Model/Const/height_width.dart';
// import '../../../../Model/Const/text_const.dart';


// class DropDownForm extends StatefulWidget {
//   final List<String> dropdownItems;
//   final String dropDownName;
//   final bool optionalisEmpty;
//   final String star;
//   final TextEditingController controller;

//   const DropDownForm({
//     super.key,
//     required this.dropdownItems,
//     required this.dropDownName,
//     required this.star,
//     required this.optionalisEmpty,
//     required this.controller,
//   });

//   @override
//   DropDownFormState createState() => DropDownFormState();
// }

// class DropDownFormState extends State<DropDownForm> {
//   String? selectedItem;
//   final TextEditingController dropdownController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: primaryWidth,
//       child: Container(
//         width: primaryWidth,
//         height: primaryHeight,
//         child: DropdownMenu<String>(
//           controller: dropdownController,
//           enableFilter: true,
//           requestFocusOnTap: true,
        
//           // leadingIcon: const Icon(Icons.search),
//           label: RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: widget.dropDownName,
//                   style: textStyleGrey18,
//                 ),
//                 TextSpan(
//                   text: widget.star,
//                   style: textStyleRedStar,
//                 ),
//               ],
//             ),
//           ),
          
//            initialSelection:widget.controller.text ,
//           inputDecorationTheme: const InputDecorationTheme(
//             filled: true,
//             fillColor: white,
          
//             contentPadding: EdgeInsets.symmetric(vertical: 10.0),
//             border: OutlineInputBorder()
//           ),
//           onSelected: (String? value) {
//             setState(() {
//               selectedItem = value;
//               widget.controller.text = selectedItem!;
//             });
//           },
//           dropdownMenuEntries: widget.dropdownItems.map<DropdownMenuEntry<String>>((String item) {
//             return DropdownMenuEntry<String>(
//               value: item,
               
//               label: item,
              
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   String? validMethod(String? value) {
//     if (widget.optionalisEmpty) {
//       if (value == null || value.isEmpty) {
//         return "Please enter ${widget.dropDownName}";
//       }
//       return null;
//     }
//     return null;
//   }
// }

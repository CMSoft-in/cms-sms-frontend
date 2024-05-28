import '../../../../Model/utility/client/client_text_const.dart';
import 'package:flutter/material.dart';

Widget updatedDataItem(String oldValue, String newValue, String updatedBy) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      color: Colors.white,
    ),
    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              oldValue,
              style: datatableblack16,
            ),
          ),
        ),
        Expanded(
          child: Text(
            newValue,
            style: datatableblack16,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Center(
              child: Text(
                updatedBy,
                style: datatableblack16,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

      


 

  // @override
  // Widget build(BuildContext context) {
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   
  // }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: grey),
//         color: white,
//       ),
//       width: double.infinity,
//       height: 50,
//       child: Row(children: [
//         SizedBox(
//           width: screenWidth / 2.50,
//           child: Text(
//             oldValue,
//             style: datatableblack16,
//           ),
//         ),
//         SizedBox(
//           width: screenWidth / 2.50,
//           child: Text(
//             newValue,
//             style: datatableblack16,
//           ),
//         ),
//         SizedBox(
//           width: screenWidth / 2.50,
//           child: Center(
//             child: Text(
//               updatedBy,
//               style: datatableblack16,
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }


// class UpdatedDataItem extends StatelessWidget {
//   const UpdatedDataItem(
//       {Key? key,
//       required this.oldValue,
//       required this.newValue,
//       required this.updatedBy})
//       : super(key: key);

//   final oldValue;
//   final newValue;
//   final updatedBy;
//   // @override
//   // Widget build(BuildContext context) {
//   //   double screenWidth = MediaQuery.of(context).size.width;
//   //   return Container(
//   //     decoration: BoxDecoration(
//   //       border: Border.all(color: grey),
//   //       color: white,
//   //     ),
//   //     width: double.infinity,
//   //     height: 50,
//   //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   //      Padding(
//   //         padding:left10,
//   //           child: Text(
//   //             oldValue,
//   //             style: datatableblack16,
//   //           ),
//   //         ),
//   //        Text(
//   //           newValue,
//   //           style: datatableblack16,

//   //       ),
//   //       Padding(
//   //         padding:right10,
//   //         child: Text(
//   //           updatedBy,
//   //           style: datatableblack16,
//   //         ),
//   //       )
//   //     ]),

//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: grey),
//         color: white,
//       ),
//       width: double.infinity,
//       height: 50,
//       child: Row(children: [
//         SizedBox(
//           width: screenWidth / 2.50,
//           child: Text(
//             oldValue,
//             style: datatableblack16,
//           ),
//         ),
//         SizedBox(
//           width: screenWidth / 2.50,
//           child: Text(
//             newValue,
//             style: datatableblack16,
//           ),
//         ),
//         SizedBox(
//           width: screenWidth / 2.50,
//           child: Center(
//             child: Text(
//               updatedBy,
//               style: datatableblack16,
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }

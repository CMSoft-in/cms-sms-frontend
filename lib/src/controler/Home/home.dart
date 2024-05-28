import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/api/local.dart';
import '../../View/screens/Home/Admin/AdminScreen/admin_landing_page.dart';

class LoginHome {
 static void login(context) async {
    String apiUrl = '$ip/Admin/login-Couser';

    Map<String, dynamic> data = {

 "email": "srika@cmss",
  "password":"pass"
};
//    Map<String, dynamic> data = {

//  "email": "",
//   "password":"password"
// };
    String jsonData = json.encode(data);
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        String token = responseData['token']['signature'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AdminlandingPage()));
      } else {
        print("Login failed: ${response.statusCode}");
      }
    } catch (error) {
      print("Error during login: $error");
    }
  }
}

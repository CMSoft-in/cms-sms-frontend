import 'dart:convert';
import 'package:http/http.dart' as http;

Future <List?> getData(pincode) async {
  var apiURL = Uri.parse('https://api.postalpincode.in/pincode/$pincode');
  var response = await http.get(apiURL);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  }
  return null;
}

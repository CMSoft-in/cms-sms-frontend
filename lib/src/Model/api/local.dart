import 'package:shared_preferences/shared_preferences.dart';

// var ip = 'http://192.168.68.102:4000';
var ip = 'http://localhost:4000';

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZW5hbnRfaWQiOjEsImNvX3VzZXJpZCI6MSwiY29fdXNlcl9uYW1lIjoiT3duZXIgTmFtZSIsInN1YnNjcmlwdGlvbiI6Mywicm9sZSI6WzFdLCJpYXQiOjE3MTY3ODQ3NjAsImV4cCI6MTcyNDU2MDc2MH0.xRA7PNLVWQCpbfiLhThJwb2mwhJhjHbu88sDdFqt9aQ";

void getToken() async {
  var pref = await SharedPreferences.getInstance();
  token = pref.getString("token")!;
}


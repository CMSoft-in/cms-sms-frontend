import 'package:flutter/material.dart';
import 'src/View/screens/Home/Admin/Sites/SiteDataView/site_data_view_main.dart';
import 'src/View/screens/Home/Admin/Sites/SiteFormPage/site_form_six.dart';
import 'src/View/screens/Home/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Site Management Software',
        theme: ThemeData(
          fontFamily: "Poppins",
        ),
          home: const Home(),
          debugShowCheckedModeBanner: false,
        );
  }
}

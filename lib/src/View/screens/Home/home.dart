// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Model/Const/text_const.dart';
import '../../../Model/Const/image_const.dart';
import '../../../Model/Home/home.dart';
import '../../../controler/Home/home.dart';

class TextWithLabel extends StatelessWidget {
  const TextWithLabel({
    Key? key,
    required this.context,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  final String imagePath;
  final String label;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffDE0C0C),
        fixedSize: const Size(180, 128),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Color(0xffFFABAB),
            width: 8,
          ),
        ),
      ),
      onPressed: () {
        LoginHome.login(context);
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              width: 47,
              height: 47,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  fontFamily: fontFamily,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              smsLogo,
              height: 62,
              width: 154,
            ),
            TextWithLabel(
              context: context,
              imagePath: HomeModel.adminImagePath,
              label: "ADMIN",
            ),
            TextWithLabel(
              context: context,
              imagePath: HomeModel.siteManagerImagePath,
              label: "SITE MANAGER",
            ),
            TextWithLabel(
              context: context,
              imagePath: HomeModel.siteSupervisorImagePath,
              label: "SITE SUPERVISOR",
            ),
          ],
        ),
      ),
    );
  }
}


  
   
              
            
  
                
    
             
      
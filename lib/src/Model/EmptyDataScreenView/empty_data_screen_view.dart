import 'package:flutter/material.dart';
import '../../View/widgets/AppBar/AppBar.dart';
import '../../View/widgets/BottomLogo/bottomLogo.dart';
import 'empty_header.dart';
import 'empty_image.dart';
import '../../View/widgets/MyDrawer/my_drawer.dart';
// import 'package:newproject/View/Admin/AdminLandingPage/Clients/empty_view_screen.dart';

class EmptyDataScreenView extends StatelessWidget {
  const EmptyDataScreenView(
      {Key? key,
      required this.page,
      required this.text,
      required this.image,
      required this.iconImage})
      : super(key: key);
  final image;
  final iconImage;
  final text;
  final page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      drawer: MyDrawer(context: context),
      body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              EmptyViewHeaderBar(
                image: iconImage,
                text: text,
                onpress: page,
              ),
              EmptyDataImage(image: image),
              const BottomLogo()
            ],
          )),
    );
  }
}

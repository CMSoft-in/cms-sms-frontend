import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyDataImage extends StatelessWidget {
  const EmptyDataImage({Key? key, required this.image}) : super(key: key);
  final image;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: SvgPicture.asset(image),
      ),
    ]);
  }
}

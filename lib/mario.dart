import 'package:flutter/material.dart';

class MarioImage extends StatelessWidget {
  MarioImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  late String image = image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 90,
      child: Image.asset(image),
    );
  }
}

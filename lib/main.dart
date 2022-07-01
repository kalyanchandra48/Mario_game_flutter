import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mario_game/home_page.dart';

void main() {
  runApp(const MarioGame());
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
}

class MarioGame extends StatelessWidget {
  const MarioGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

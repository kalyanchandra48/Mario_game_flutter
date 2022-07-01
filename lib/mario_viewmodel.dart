import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarioViewModel extends ChangeNotifier {
  static MarioViewModel of(BuildContext context) =>
      context.read<MarioViewModel>();

  ValueNotifier<double> move = ValueNotifier<double>(-1);
  ValueNotifier<double> jump = ValueNotifier<double>(1);
  ValueNotifier<int> timer = ValueNotifier(9999);
  ValueNotifier<String> changeImage = ValueNotifier('assets/mario_right.png');

  movetheBackwardMario() {
    move.value -= 0.3;
  }

  movetheForwardMario() {
    move.value += 0.3;
  }

  jumpthemario() async {
    jump.value = 0;
    changeImage.value = 'assets/mario_jump1.png';

    Future.delayed(const Duration(milliseconds: 700), () {
      jump.value = 1;
      changeImage.value = 'assets/mario_right.png';
    });
  }
}

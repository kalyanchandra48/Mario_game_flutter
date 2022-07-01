import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mario_game/mario_viewmodel.dart';

class BottomBar extends StatelessWidget {
  late ScrollController scrollScreen;
  BottomBar({
    Key? key,
    required this.scrollScreen,
  }) : super(key: key);

  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mario_brick.png'),
            fit: BoxFit.fill,
          ),
          color: Color(0xffD36A1F)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
          iconSize: 35,
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            MarioViewModel.of(context).movetheBackwardMario();
          },
        ),
        IconButton(
          iconSize: 35,
          color: Colors.white,
          icon: const Icon(Icons.arrow_upward),
          onPressed: () async {
            player.play(AssetSource('mario_jump.mp3'));
            MarioViewModel.of(context).jumpthemario();
          },
        ),
        IconButton(
          iconSize: 35,
          color: Colors.white,
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            MarioViewModel.of(context).movetheForwardMario();
          },
        ),
      ]),
    );
  }
}

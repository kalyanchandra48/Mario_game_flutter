import 'package:flutter/material.dart';
import 'package:mario_game/home_page_body.dart';
import 'package:mario_game/mario_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => MarioViewModel(),
        builder: (context, _) => const HomePageBody());
  }
}

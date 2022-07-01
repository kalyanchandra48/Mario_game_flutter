import 'package:flutter/material.dart';
import 'package:mario_game/bottom_bar.dart';
import 'package:mario_game/mario.dart';
import 'package:mario_game/mario_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MarioViewModel(),
      builder: (context, _) => DataWidget(),
    );
  }
}

class DataWidget extends StatelessWidget {
  DataWidget({
    Key? key,
  }) : super(key: key);

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => MarioViewModel(),
        builder: (context, _) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                elevation: 0.0,
                backgroundColor: Colors.blue,
                toolbarHeight: 50,
                leading: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('World'), Text('1-1')],
                )),
                title: Column(
                  children: const [
                    Text('Mario'),
                  ],
                ),
                actions: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Time'),
                        Text(MarioViewModel.of(context).timer.value.toString())
                      ],
                    ),
                  ),
                ],
              ),
              body: Column(children: [
                Expanded(
                    flex: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/mario_background.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ValueListenableBuilder<double>(
                          valueListenable: MarioViewModel.of(context).jump,
                          builder: (context, jump, child) {
                            return ValueListenableBuilder<double>(
                                valueListenable:
                                    MarioViewModel.of(context).move,
                                builder: (context, move, _) {
                                  dynamic value = move;
                                  double jumpv = jump;
                                  return AnimatedContainer(
                                    alignment: Alignment(value, jumpv),
                                    duration: const Duration(milliseconds: 800),
                                    child: ValueListenableBuilder<String>(
                                      valueListenable:
                                          MarioViewModel.of(context)
                                              .changeImage,
                                      builder: (context, imagechange, _) =>
                                          MarioImage(image: imagechange),
                                    ),
                                  );
                                });
                          }),
                    )),
                Expanded(
                  child: BottomBar(scrollScreen: _controller),
                )
              ]),
            ));
  }
}

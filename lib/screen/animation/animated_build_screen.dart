import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AniBuilderScreen extends StatefulWidget {
  const AniBuilderScreen({super.key});

  @override
  State<AniBuilderScreen> createState() => _AniBuilderScreenState();
}

class _AniBuilderScreenState extends State<AniBuilderScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      reverseDuration: Duration(seconds: 5),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              final value = animationController.value;
              return Transform.rotate(
                angle: pi * value / 2,
                child: Text(
                  "hello",
                  style: TextStyle(color: Colors.green, fontSize: 50),
                ),
              );
            })
      ]),
    );
  }
}

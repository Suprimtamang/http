import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatelessWidget {
  const LottieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Flexible(
        child: Column(children: [
          Lottie.asset("assets/animation/apple.json", height: 30, width: 30),
          Lottie.asset("assets/animation/apple.json"),
          // Lottie.asset(
          //   "assets/animation/apple.gif",
          //   height: 100,
          // )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:freshstart/page_transition/vertical_transition.dart';
import 'package:freshstart/screen/animation/animated_build_screen.dart';
import 'package:freshstart/screen/animation/custom_ani.dart';
import 'package:freshstart/screen/animation/hero1.dart';
import 'package:freshstart/screen/animation/hero2..dart';
import 'package:freshstart/screen/animation/lottie_ani.dart';
import 'package:freshstart/screen/animation/transform_screen.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  List screens = [
    {"title": "Hero animation", "widget": Hero1()},
    {"title": "Lottie animation", "widget": LottieScreen()},
    {"title": "Custom animation", "widget": AnimContainerScreen()},
    {"title": "Transform  widget", "widget": TransformScreen()},
    {"title": "Animated Builder ", "widget": AniBuilderScreen()},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: screens.length,
          itemBuilder: (context, index) {
            final page = screens[index];
            return MaterialButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => page['widget']));
                Navigator.push(context, BottomToUp(page['widget']));
              },
              child: Text(page['title']),
            );
          }),
    );
  }
}

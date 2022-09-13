import 'package:flutter/material.dart';
import 'package:freshstart/screen/custom_ani.dart';
import 'package:freshstart/screen/hero1.dart';
import 'package:freshstart/screen/hero2..dart';
import 'package:freshstart/screen/lottie_ani.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  List screens = [
    {"title": "Hero animation", "widget": Hero1()},
    {"title": "Lottie animation", "widget": LottieScreen()},
    {"title": "Custom animation", "widget": AnimContainerScreen()},
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => page['widget']));
              },
              child: Text(page['title']),
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:freshstart/login_page.dart';

class Hero2 extends StatelessWidget {
  const Hero2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Hero(tag: "suprim", child: Image.network(imgsrc))),
    );
  }
}

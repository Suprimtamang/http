import 'package:flutter/material.dart';
import 'package:freshstart/login_page.dart';
import 'package:freshstart/screen/animation/hero2..dart';

class Hero1 extends StatelessWidget {
  const Hero1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Hero2()));
        },
        child: Hero(tag: "suprim", child: Image.network(imgsrc)),
      ),
    );
  }
}

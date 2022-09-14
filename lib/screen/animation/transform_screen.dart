import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransformScreen extends StatefulWidget {
  const TransformScreen({super.key});

  @override
  State<TransformScreen> createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Transform.rotate(
          angle: pi / 4,
          child: Text(
            'TITLE',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Transform.translate(
          offset: Offset(100, -15),
          child: Container(
            height: 50,
            width: 60,
            color: Colors.amber,
          ),
        )
      ]),
    );
  }
}

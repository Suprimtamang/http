import 'package:flutter/material.dart';
import 'package:freshstart/model/custom_nav.dart';
import 'package:freshstart/screen/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigatorScreen(),
      onGenerateRoute: ourRouteGenerator,
    );
  }
}

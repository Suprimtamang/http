import 'package:flutter/material.dart';
import 'package:freshstart/login_page.dart';
import 'package:freshstart/model/custom_nav.dart';
import 'package:freshstart/screen/navigation.dart';
import 'package:freshstart/stopwatch.dart';
import 'package:freshstart/tiktok_homepage.dart';
import 'screen/instagram_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigatorScreen(),
      onGenerateRoute: ourRouteGenerator,
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:freshstart/login_page.dart';
import 'package:freshstart/model/routes.dart';
import 'package:freshstart/screen/instagram_page.dart';
import 'package:freshstart/stopwatch.dart';
import 'package:freshstart/tiktok_homepage.dart';

class NavigatorScreen extends StatelessWidget {
  NavigatorScreen({Key? key}) : super(key: key);

  final List screensList = [
    {
      "name": 'LoginPage ',
      "widget": const FormScreen(),
      "route": Routes.LoginPage
    },
    {"name": 'Tiktok ', "widget": const TiktokPage(), "route": Routes.Tiktok},
    {
      "name": 'Instagram ',
      "widget": Instagrampage(),
      "route": Routes.Instagram
    },
    {
      "name": 'Stopwatch ',
      "widget": const StopWatch(),
      "route": Routes.Stopwatch
    },
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("back button disabled");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Navigation")),
        body: ListView.builder(
          itemCount: screensList.length,
          itemBuilder: (context, index) {
            final screen = screensList[index];
            return MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, screen["route"]);
              },
              color: Color.fromRGBO(Random().nextInt(255),
                  Random().nextInt(255), Random().nextInt(255), 0.8),
              child: Text(
                screen['name'],
                // style: TextStyle(color: Colors.amber),
              ),
            );
          },
        ),
      ),
    );
  }
}

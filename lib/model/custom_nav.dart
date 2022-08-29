import 'package:flutter/material.dart';
import 'package:freshstart/login_page.dart';
import 'package:freshstart/model/routes.dart';
import 'package:freshstart/screen/instagram_page.dart';
import 'package:freshstart/stopwatch.dart';
import 'package:freshstart/tiktok_homepage.dart';

MaterialPageRoute ourRouteGenerator(RouteSettings settings) {
  switch (settings.name) {
    case Routes.LoginPage:
      return MaterialPageRoute(builder: (_) => FormScreen());
    case Routes.Tiktok:
      return MaterialPageRoute(builder: (_) => TiktokPage());
    case Routes.Instagram:
      return MaterialPageRoute(builder: (_) => Instagrampage());
    case Routes.Stopwatch:
      return MaterialPageRoute(builder: (_) => StopWatch());

    default:
      return MaterialPageRoute(builder: (_) => FormScreen());
  }
}

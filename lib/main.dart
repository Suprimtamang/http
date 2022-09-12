import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshstart/homepage.dart';
import 'package:freshstart/model/custom_nav.dart';
import 'package:freshstart/screen/navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freshstart/service/custom_theme.dart';
import 'package:freshstart/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<ThemeCubit>(create: (context) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.DarkTheme,
            themeMode: state,
            debugShowCheckedModeBanner: false,
            home: Homepage(),
            onGenerateRoute: ourRouteGenerator,
          );
        },
      ),
    );
  }
}

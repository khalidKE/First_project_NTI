
import 'package:first_app/core/screens/result_screen.dart';
import 'package:first_app/core/screens/static_login_screen.dart';
import 'package:flutter/material.dart';
import 'core/screens/intro_screen.dart';

void main() {
  runApp(FirstApp());
}

/// we use context to access the widget tree
/// and to get the current state of the widget
class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (ctx) => IntroScreen(),
        StaticLoginScreen.screenRoute: (context) => StaticLoginScreen(),
        ResultScreen.screenRoute:(context)=> ResultScreen(),
      },
    );
  }
}

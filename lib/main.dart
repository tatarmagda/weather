import 'package:flutter/material.dart';
import 'package:pogoda/permission_screen.dart';

import 'package:pogoda/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PermissionScreen(),
    );
  }
}

class Strings {
  static const String appTitle = "Clean Air";
}

import 'package:flutter/material.dart';
import 'package:pogoda/air_screen.dart';
import 'package:pogoda/weather_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;
  final screens = [
    AirScreen(),
    WeatherScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.air), label: "powietrze"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny_rounded), label: "pogoda"),
        ],
      ),
    );
  }
}

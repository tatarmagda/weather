import 'package:flutter/material.dart';

import 'package:pogoda/air_screen.dart';
import 'package:pogoda/splash_screen.dart';
import 'package:pogoda/weather_screen.dart';
import 'package:weather/weather.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.weather, this.air);
  final Weather weather;
  final AirQuality air;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;
  var screens;

  @override
  void initState() {
    screens = [
      AirScreen(air: widget.air),
      WeatherScreen(weather: widget.weather),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30.0,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("icons/house.png"),
            label: "powietrze",
            activeIcon: Image.asset("icons/house-checked.png"),
          ),
          BottomNavigationBarItem(
              icon: Image.asset("icons/cloud.png"),
              label: "pogoda",
              activeIcon: Image.asset("icons/cloud-checked.png")),
        ],
      ),
    );
  }
}

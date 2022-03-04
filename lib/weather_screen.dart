// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pogoda/main.dart';
import 'package:pogoda/my_home_page.dart';
import 'package:pogoda/permission_screen.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: new Color(0xffffffff),
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color.fromARGB(255, 173, 197, 233),
                    Color.fromARGB(255, 47, 108, 187),
                  ]),
            ),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 45.0)),
                Image(
                  image: AssetImage("build/icons/weather-sunny.png"),
                ),
                Padding(padding: EdgeInsets.only(top: 41.0)),
                Text(
                  "data",
                ),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Text("14*C"),
                Text("odczuwalna 14*C"),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("ciśnienie"),
                            Padding(
                              padding: EdgeInsets.only(top: 2.0),
                            ),
                            Text("10013 hPa"),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        width: 48.0,
                        thickness: 1.0,
                      ),
                      Container(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("wiatr"),
                            Padding(
                              padding: EdgeInsets.only(top: 2.0),
                            ),
                            Text("16 km/h"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0),
                ),
                Text("opady: 0,1 mm/h"),
                Padding(
                  padding: EdgeInsets.only(top: 68.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

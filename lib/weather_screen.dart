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
                    Color.fromARGB(255, 158, 166, 233),
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
                  "Poniedziałek, 04.03.2022 ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 16),
                      height: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Text(
                  "14*C",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 64),
                      height: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "odczuwalna 14*C",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: 20.0),
                        height: 1.2,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "ciśnienie",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 16.0),
                                    height: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.0),
                              ),
                              Text(
                                "10013 hPa",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 20.0),
                                    height: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      VerticalDivider(
                        width: 48.0,
                        thickness: 1.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "wiatr",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 16.0),
                                    height: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.0),
                              ),
                              Text(
                                "16 km/h",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 20.0),
                                    height: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 48.0),
                ),
                Text(
                  "opady: 0,1 mm/h",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 16.0),
                      height: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
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

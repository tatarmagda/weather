// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pogoda/main.dart';

import 'splash_screen.dart';

class AirScreen extends StatefulWidget {
  final AirQuality air;

  AirScreen({required this.air});

  @override
  State<AirScreen> createState() => _AirScreenState();
}

class _AirScreenState extends State<AirScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              gradient: getGradientByMood(widget.air),
            ),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Jakość powietrza",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 14.0),
                      height: 1.2,
                      color: getBackgroundTextCOlor(widget.air),
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2),
                ),
                Text(
                  widget.air.quality,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 28.0),
                      height: 1.2,
                      color: getBackgroundTextCOlor(widget.air),
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 92,
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (widget.air.aqi / 200 * 100).floor().toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize: 45.0),
                                height: 1.2,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "CAQI ⓘ",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize: 14.0),
                                height: 1.2,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
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
                                "PM 2,5",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 16.0),
                                    height: 1.2,
                                    color: getBackgroundTextCOlor(widget.air),
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.0),
                              ),
                              Text(
                                widget.air.pm25.toString() + "%",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 20.0),
                                    height: 1.2,
                                    color: getBackgroundTextCOlor(widget.air),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      VerticalDivider(
                        width: 0.0,
                        thickness: 1.0,
                        color: getBackgroundTextCOlor(widget.air),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "PM 10",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 16.0),
                                    height: 1.2,
                                    color: getBackgroundTextCOlor(widget.air),
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.0),
                              ),
                              Text(
                                widget.air.pm10.toString() + "%",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 20.0),
                                    height: 1.2,
                                    color: getBackgroundTextCOlor(widget.air),
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
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Stacja pomiarowa",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: 14.0),
                        height: 1.2,
                        color: getBackgroundTextCOlor(widget.air),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0),
                ),
                Text(
                  widget.air.station,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 18.0),
                      height: 1.2,
                      color: getBackgroundTextCOlor(widget.air),
                      fontWeight: FontWeight.w900),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
              ],
            ),
          ),
          Positioned(
            left: 8,
            right: 0,
            bottom: 0,
            top: 0,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Stack(
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      heightFactor: 1 - widget.air.aqi / 200.floor(),
                      child: getDangeValueBottom(widget.air),
                    ),
                  ),
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      heightFactor: 1 - 0.4,
                      child: getDangeValueTop(widget.air),
                      // Image.asset(
                      //   "icons/danger-value.png",
                      //   scale: 0.9,
                      // ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24,
                      right: 10,
                      left: 10,
                    ),
                    child: Divider(
                      height: 40,
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      bottom: 24,
                      left: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        height: 38,
                        child: IntrinsicHeight(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              alignment: Alignment.center,
                              image: AssetImage("icons/happy.png"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                            ),
                            Text(
                              widget.air.advice,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool havePermission() {
    return true;
  }

  LinearGradient getGradientByMood(AirQuality air) {
    if (air.isgood) {
      return LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.centerLeft,
        colors: [
          Color.fromARGB(255, 83, 177, 113),
          Color.fromARGB(255, 33, 114, 60),
        ],
      );
    } else if (air.isBad) {
      return LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.center,
        colors: [
          Color.fromARGB(255, 177, 89, 83),
          Color.fromARGB(255, 114, 45, 33),
        ],
      );
    } else {
      return LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.center,
        colors: [
          Color.fromARGB(255, 233, 192, 158),
          Color.fromARGB(255, 214, 137, 73),
        ],
      );
    }
  }

  getBackgroundTextCOlor(AirQuality air) {
    if (air.isBad || air.isgood) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  getDangeValueBottom(AirQuality air) {
    if (air.isgood) {
      return Image.asset(
        "icons/danger-value-negative.png",
        scale: 0.9,
      );
    } else {
      return Image.asset(
        "icons/danger-value.png",
        scale: 0.9,
      );
    }
  }

  getDangeValueTop(AirQuality air) {
    if (air.isgood) {
      return Image.asset(
        "icons/danger-value-negative.png",
        color: Color.fromARGB(255, 33, 114, 60),
        scale: 0.9,
      );
    } else if (air.isBad) {
      return Image.asset("icons/danger-value-negative.png",
          color: Color.fromARGB(255, 114, 45, 33), scale: 0.9);
    } else {
      Image.asset("icons/danger-value-negative.png",
          color: Color.fromARGB(255, 214, 137, 73), scale: 0.9);
    }
  }
}

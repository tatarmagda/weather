// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pogoda/main.dart';

class AirScreen extends StatefulWidget {
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
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color.fromRGBO(161, 233, 158, 1),
                    Color.fromARGB(255, 47, 187, 77),
                  ]),
            ),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Jakość powietrza"),
                Padding(
                  padding: EdgeInsets.only(top: 2),
                ),
                Text("Bardzo dobra"),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                ),
                CircleAvatar(
                  radius: 92,
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "45",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 44),
                          ),
                          Text(
                            "CAQI ⓘ",
                            textAlign: TextAlign.center,
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.0),
                              ),
                              Text(
                                "10%",
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
                                "PM 10",
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
                                "12%",
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
                Text(
                  "Stacja pomiarowa",
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0),
                ),
                Text(
                  "Warszawa",
                  textAlign: TextAlign.center,
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
                      heightFactor: 1,
                      child: Image.asset(
                        "icons/danger-value-negative.png",
                        scale: 0.9,
                      ),
                    ),
                  ),
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      heightFactor: 1 - 0.4,
                      child: Image.asset(
                        "icons/danger-value.png",
                        scale: 0.9,
                      ),
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
                      height: 10,
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
                          child: Text("heeeelo"),
                        ),
                      )),
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
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pogoda/main.dart';

class PermissionScreen extends StatefulWidget {
  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
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
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 255, 238, 81),
                    Color.fromARGB(255, 47, 108, 187),
                  ]),
            ),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("build/icons/hand-wave.png"),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(
                  "Smacznej kawusi!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 30.0),
                    color: Color.fromARGB(255, 24, 56, 105),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Text(
                  " ${Strings.appTitle} potrzebuje przyblizonej \n lokalizacji urządzenia",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 15,
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 40, right: 40.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        "Ustaw przybliżoną lokalizacje",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 24, 56, 105),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 168, 185, 241)),
                      onPressed: () {},
                    ),
                  ))),
        ],
      ),
    );
  }
}

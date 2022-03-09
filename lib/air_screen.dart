import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pogoda/main.dart';
import 'package:pogoda/my_home_page.dart';
import 'package:pogoda/permission_screen.dart';

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
              color: new Color(0xffffffff),
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
                Image(
                  image: AssetImage("build/icons/cloud-sun.png"),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(
                  Strings.appTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 30.0),
                    color: Color.fromARGB(255, 24, 56, 105),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Text(
                  "jakosc powietrza",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 50,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Ladowanie danych....",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 15.0),
                    color: Color.fromARGB(255, 24, 56, 105),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  bool havePermission() {
    return true;
  }
}

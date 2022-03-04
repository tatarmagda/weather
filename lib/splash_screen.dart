import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
                  image: AssetImage("build/icons/cloud-sun.png"),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 30.0),
                    color: Color.fromARGB(255, 24, 56, 105),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Text(
                  "Aplikacja do monitorowania \n powietrza",
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
}

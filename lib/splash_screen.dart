import 'package:flutter/material.dart';

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
                    Color.fromARGB(255, 235, 201, 201),
                    Color.fromARGB(255, 162, 203, 255),
                  ]),
            ),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.air,
                  color: Color.fromARGB(255, 84, 104, 221),
                  size: 100,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(widget.title),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Text("Aplikacja do monitorowania \n powietrza"),
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 50,
              child: Container(
                alignment: Alignment.center,
                child: Text("Ladowanie danych...."),
              )),
        ],
      ),
    );
  }
}

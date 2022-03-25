import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pogoda/main.dart';
import 'package:pogoda/my_home_page.dart';
import 'package:pogoda/permission_screen.dart';
import 'package:weather/weather.dart';

class SplashScreen extends StatefulWidget {
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
                  image: AssetImage("icons/cloud-sun.png"),
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

  @override
  void initState() {
    super.initState();

    if (permissionDenied()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PermissionScreen()));
    } else {
      SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        executedOnceAfterBuild();
      });
    }
  }

  bool permissionDenied() {
    return false;
  }

  void executedOnceAfterBuild() async {
    WeatherFactory wf = new WeatherFactory("32a8b80c5dc1aa8453402fbb2f2dfde5",
        language: Language.POLISH);
    Weather w = await wf.currentWeatherByCityName("Gdynia");
// sprawdzenie czy działa odpowiedz z serwera
    log(w.toJson().toString());

// aby skorzystać z danych o informacji o powietrzu należy również w pubspec.yaml dodać paczkę http
    var lat = 54.538317;
    var lng = 18.470920;
    var keyword = "geo:$lat;$lng";
    String _endpoint = "https://api.waqi.info/feed/";
    var key = "58b73628df9c89797e1391bb18505b675a0f253c";
    String url = "$_endpoint/$keyword/?token=$key";

    // należy przekształcić url na URI, żeby dostać wymaganą odpowiedź z serwera
    http.Response response = await http.get(Uri.parse(url));

    // dane są w Jsonie dlatego robimy mapę stringów
    Map<String, dynamic> jsonBody = json.decode(response.body);
    AirQuality aq = new AirQuality(jsonBody);

    // sprawdzenie czy działa odpowiedz z serwera
    log(response.body.toString());

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage(w, aq)));
  }
}

class AirQuality {
  bool isgood = false;
  bool isBad = false;
  String quality = "";
  String advice = "";
  int aqi = 0;
  int pn25 = 0;
  int pn10 = 0;
  String station = "";

  AirQuality(Map<String, dynamic> jsonBody) {
    aqi = int.tryParse(jsonBody["data"]["aqi"].toString()) ?? -1;
    pn25 =
        int.tryParse(jsonBody["data"]["iaqi"]["pm25"]["71"].toString()) ?? -1;
    pn10 =
        int.tryParse(jsonBody["data"]["iaqi"]["pm10"]["71"].toString()) ?? -1;
    station = jsonBody["data"]["city"]["name"].toString();

    setUpLevel(aqi);
  }

  void setUpLevel(int aqi) {
    if (aqi <= 180) {
      quality = "Bardzo dobra";
      advice = "Skorzystaj z dobrego powietrza!";
    } else if (aqi <= 150) {
      quality = "Średnio";
      advice = "Jeśli możesz zostań z domu";
    } else {
      quality = "Bardzo źle";
      advice = "Zostań w domu!";
    }
  }
}

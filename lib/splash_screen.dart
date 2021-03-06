import 'dart:convert';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';
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
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    (checkPermission());
  }

  checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PermissionScreen()));
    } else {
      SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        executeOnceAfterBuild();
      });
    }
  }

  // pobieranie aktualnej lokalizacji, parametr desiredAccuracy: LocationAccuracy.best m??wi o dok????dno??ci lokalizacji,
  // forceAndroidLocationManager: false - zawsze bedzie na androidzie dzia??ac
  void executeOnceAfterBuild() async {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.lowest,
            forceAndroidLocationManager: true,
            timeLimit: Duration(seconds: 5))
        .then((value) => {loadLocationData(value)})
        .onError((error, stackTrace) => {
              Geolocator.getLastKnownPosition(forceAndroidLocationManager: true)
                  .then((value) => {loadLocationData(value)})
            });
  }

  loadLocationData(Position? value) async {
    var lat = value?.latitude;
    var lng = value?.longitude;
    log(lat.toString() + "x" + lng.toString());

    WeatherFactory wf = new WeatherFactory("32a8b80c5dc1aa8453402fbb2f2dfde5",
        language: Language.POLISH);
    Weather w = await wf.currentWeatherByLocation(lat!, lng!);
// sprawdzenie czy dzia??a odpowiedz z serwera
    log(w.toJson().toString());

// aby skorzysta?? z danych o informacji o powietrzu nale??y r??wnie?? w pubspec.yaml doda?? paczk?? http

    var keyword = "geo:$lat;$lng";
    String _endpoint = "https://api.waqi.info/feed/";
    var key = "58b73628df9c89797e1391bb18505b675a0f253c";
    String url = "$_endpoint/$keyword/?token=$key";

    // nale??y przekszta??ci?? url na URI, ??eby dosta?? wymagan?? odpowied?? z serwera
    http.Response response = await http.get(Uri.parse(url));

    // dane s?? w Jsonie dlatego robimy map?? string??w
    Map<String, dynamic> jsonBody = json.decode(response.body);
    AirQuality aq = new AirQuality(jsonBody);

    // sprawdzenie czy dzia??a odpowiedz z serwera
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
  int pm25 = 0;
  int pm10 = 0;
  String station = "";

  AirQuality(Map<String, dynamic> jsonBody) {
    aqi = int.tryParse(jsonBody["data"]["aqi"].toString()) ?? -1;
    pm25 = int.tryParse(jsonBody["data"]["iaqi"]["pm25"]["v"].toString()) ?? -1;
    pm10 = int.tryParse(jsonBody["data"]["iaqi"]["pm10"]["v"].toString()) ?? -1;
    station = jsonBody["data"]["city"]["name"].toString();

    setUpLevel(aqi);
  }

  void setUpLevel(int aqi) {
    if (aqi <= 100) {
      quality = "Bardzo dobra";
      advice = "Skorzystaj z dobrego powietrza!";
      isgood = true;
    } else if (aqi <= 150) {
      quality = "??rednio";
      advice = "Je??li mo??esz zosta?? z domu";
      isBad = true;
    } else {
      quality = "Bardzo ??le";
      advice = "Zosta?? w domu!";
    }
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pogoda/main.dart';

import 'package:weather/weather.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({required this.weather});
  final Weather weather;
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
                gradient: getGradientByMood(widget.weather)),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 45.0)),
                Image(
                  image:
                      AssetImage("icons/${getIconByMood(widget.weather)}.png"),
                ),
                Padding(padding: EdgeInsets.only(top: 41.0)),
                Text(
                  "${DateFormat.MMMMEEEEd("pl").format(DateTime.now())}, ${widget.weather.weatherDescription} ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 16),
                      height: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Text(
                  "${widget.weather.temperature?.celsius!.floor().toString()}°C",
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
                    "Odczuwalna ${widget.weather.tempFeelsLike?.celsius!.floor().toString()}°C",
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
                                "${widget.weather.pressure?.floor().toString()}°C hPa",
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
                                "${widget.weather.windSpeed}°C m/s",
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
                if (widget.weather.rainLastHour != null)
                  Text(
                    "opady: ${widget.weather.rainLastHour} mm/1h",
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

  String getIconByMood(Weather weather) {
    var main = weather.weatherMain;

    if (main == "Clouds" || main == "Drizzle" || main == "Snow") {
      return "weather-rain";
    } else if (main == "Thunderstorm") {
      return "weather-lightning";
    } else if (isNight(weather)) {
      return 'weather-moonny';
    } else {
      return "weather-sunny";
    }
  }

  bool isNight(Weather weather) {
    return DateTime.now().isAfter(weather.sunset as DateTime) ||
        DateTime.now().isBefore(weather.sunrise as DateTime);
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  LinearGradient getGradientByMood(Weather weather) {
    if (main == "Clouds" || main == "Drizzle" || main == "Snow") {
      return LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color.fromARGB(255, 158, 166, 233),
          Color.fromARGB(255, 49, 47, 187),
        ],
      );
    } else if (main == "Thunderstorm") {
      return LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 187, 173, 47),
        ],
      );
    } else if (isNight(weather)) {
      return LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color.fromARGB(255, 54, 52, 52),
          Color.fromARGB(255, 0, 0, 0),
        ],
      );
    } else {
      return LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color.fromARGB(255, 8, 87, 190),
          Color.fromARGB(255, 223, 207, 32),
        ],
      );
    }
  }
}

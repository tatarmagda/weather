// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'splash_screen.dart';

class AirScreen extends StatefulWidget {
  final AirQuality air;

  AirScreen({required this.air});

  @override
  State<AirScreen> createState() => _AirScreenState();
}

class _AirScreenState extends State<AirScreen> {
  PanelController _pc = new PanelController();

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
                          RichText(
                            text: TextSpan(
                              text: "CAQI ⓘ",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //to do open panel
                                  _pc.open();
                                },
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(fontSize: 14.0),
                                  height: 1.2,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
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
          ),
          SlidingUpPanel(
            controller: _pc,
            minHeight: 0,
            maxHeight: 300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            panel: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 32),
                      ),
                      Text(
                        "Indeks CAQI",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 14.0,
                                height: 1.2,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Text(
                        "Indeks CAQI (ang. Common Air Quality Index) pozwala przedstawić sytuację w Europiie w porównywalny i łatwy do zrozumienia sposób. Wartość indeksu jest prezentowana w postaci jednej liczby. Skala ma rozpietość od 0 do wartości powyżej 100 i powyżej bardzo zanieczyszone. Im wyższa wartość wskażnika, tym większe ryzyko złego wpływu na zdrowie i sampoczucie.",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0,
                                height: 1.2,
                                color: Colors.black,
                                fontWeight: FontWeight.w300)),
                      ),
                      Padding(padding: EdgeInsets.only(top: 14.0)),
                      Text(
                        " Pył zawieszony PM2,5 i PM10",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 14.0,
                                height: 1.2,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Text(
                        "Pyły zawieszone to mieszanina bardzo małych cząstek. PM10 to wszystkie pyły mniejsze niz 10μm, natomiast w przypadku  PM2,5 nie większe niż 2,5μm. Zanieczyszczenia pyłowe mają zdolność do adsorpcji swojej powierzchni innych, bardzo szkodliwych związków chemicznych: dioksyn, furanów, metali ciężkich, czy benzo(a)pirenu - najbardziej toksycznego składnika smogu.",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0,
                                height: 1.2,
                                color: Colors.black,
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          _pc.close();
                        },
                        child: Icon(Icons.close, color: Colors.black),
                      ),
                    ))
              ],
            ),
          ),
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

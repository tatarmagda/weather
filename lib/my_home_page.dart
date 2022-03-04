import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("home"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.air), label: "powietrze"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny_rounded), label: "pogoda"),
        ],
      ),
    );
  }
}

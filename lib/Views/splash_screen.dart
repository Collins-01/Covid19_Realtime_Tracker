import 'dart:async';

import 'package:covid19_virus_tracker/Views/home_logic.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomeLogic()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
          color: Colors.white,
          height: 250,
          margin: EdgeInsets.all(20),
          child: Image.asset("assets/conslt.jpg"),
        )),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';
import 'login.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyhomePage(),
    //MyhomePage(),
  ));
}

class MyhomePage extends StatefulWidget {
  HomePage createState() => HomePage();
}

class HomePage extends State<MyhomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Myapp(),
          ),
        );
      },
    );
  }
  @override
  Future navigateToTuriolhome(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Myapp()));
  }
//  @override
//  Future navigateToLogin(context) async =>
//      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));

  TextStyle style = TextStyle(fontFamily: 'Montserrat');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Image.asset("assets/images/LogoMakr_42xAgW.png"),
                color: Colors.white,
                iconSize: 200.0,
                tooltip: "Navigation menu",
                onPressed: () {
                  navigateToTuriolhome(context);
                },
              ),
            ]),
      ),
    );
  }
}

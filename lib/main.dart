import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';
import 'login.dart';

void main() {
  runApp(MaterialApp(
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
      Duration(seconds: 3),
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
  @override
  Future navigateToLogin(context) async =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));

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
              Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: RaisedButton(
                    onPressed: () {
                      navigateToTuriolhome(context);
                    },
                    child: Text('Trang chủ',style:style),
                    textColor: Colors.white,
                    color: Colors.deepOrangeAccent,

                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: RaisedButton(
                    onPressed: () {
                      navigateToLogin(context);
                    },
                    child: Text('Đăng nhập',style: style,),
                    textColor: Colors.white,
                    color: Colors.deepOrangeAccent,

                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),

                  )),
            ]),
      ),
    );
  }
}

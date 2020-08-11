import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';
void main(){
  runApp(MaterialApp(
    home:MyhomePage(),
    //MyhomePage(),
  ));
}
class MyhomePage extends StatefulWidget{
  HomePage createState() => HomePage();
}

class HomePage extends State<MyhomePage>{
  @override
  void initState(){
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
          (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Myapp(),
          ),
        );
      },
    );
  }
  Future navigateToTuriolhome(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  Myapp()));
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage("assets/images/image5.jpg"),
//            fit: BoxFit.cover,
//          ),
//        ),
        child: Center(
          child: IconButton(
            icon: Image.asset("assets/images/LogoMakr_42xAgW.png"),
            color: Colors.white,
            iconSize: 200.0,
            tooltip: "Navigation menu",
            onPressed: (){
              navigateToTuriolhome(context);
            },
          ),
        ),
      ),
    );
  }

}

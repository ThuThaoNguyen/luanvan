import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_example/help_infor.dart';
import 'marketrate.dart';
import 'weatherforecast.dart';

class market_rate extends StatelessWidget {
//  @override
//  Future navigateToHome(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => TutorialHome()));
//  }
//
//  Future navigateToWeatherForecast(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => weather_forecast()));
//  }
  @override
  BoxDecoration myboxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1, //
        color:Colors.green[600], //                  <--- border width here
      ),
    );
  }
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     body: Center(

     ),
   );


  }
}

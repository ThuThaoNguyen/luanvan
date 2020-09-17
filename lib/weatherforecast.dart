import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_example/home_page.dart';
import 'marketrate.dart';
import 'weatherforecast.dart';
import 'help_infor.dart';

class weather_forecast extends StatelessWidget {
  BoxDecoration myboxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1, //
        color: Colors.green[600], //                  <--- border width here
      ),
    );
  }

//  @override
//  Future navigateToMarketRate(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => market_rate()));
//  }
//
//  Future navigateToHome(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => TutorialHome()));
//  }
//
//  @override
//  Future navigateToHelpInfor(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => help_infor()));
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(
////          leading: IconButton(
////            icon: Icon(Icons.arrow_back),
////            tooltip: "Navigation menu",
////            onPressed: () {
////              Navigator.pop(context);
////            },
////          ),
//          backgroundColor: Colors.green[600], //lightGreen[600],
//          title: Container(
//            padding: EdgeInsets.fromLTRB(50, 0, 40, 0),
//            child: Text(
//              "DỰ BÁO THỜI TIẾT",
//              style: new TextStyle(
//                color: Colors.white,
//                fontSize: 20.0,
//                fontStyle: FontStyle.italic,
//                fontFamily: "Merriweather",
//              ),
//            ),
//          )),
//      floatingActionButton: FloatingActionButton(
//        backgroundColor: Colors.lightGreen,
//        child: (IconButton(
//            icon: Icon(
//              Icons.camera_alt,
//              color: Colors.white,
//              size: 30.0,
//            ))),
//        tooltip: "Add",
//        onPressed: null,
//      ),


//      bottomNavigationBar: Container(
//        decoration: myboxDecoration(),
//        child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              IconButton(
//                  icon: Icon(
//                    Icons.home,
//                    color: Colors.grey,
//                  ),
//                  color: Colors.green[600],
//                  tooltip: "home",
//                  iconSize: 40.0,
//                  onPressed: () {
//                    navigateToHome(context);
//                  }),
//              IconButton(
//                  icon: Icon(
//                    Icons.show_chart,
//                    color: Colors.grey,
//                  ),
//                  color: Colors.green[600],
//                  tooltip: "Market Rate",
//                  iconSize: 40.0,
//                  onPressed: () {
//                    navigateToMarketRate(context);
//                  }),
//              IconButton(
//                  icon: Icon(
//                    Icons.wb_sunny,
//                    color: Colors.green[600],
//                  ),
//                  color: Colors.green[600],
//                  tooltip: "Weather Forecast",
//                  iconSize: 40.0,
//                  onPressed: () {
//                    navigateToWeatherForecast(context);
//                  }),
//              IconButton(
//                icon: Icon(
//                  Icons.info,
//                  color: Colors.grey,
//                ),
//                tooltip: "Infor",
//                iconSize: 40.0,
//                onPressed: () {
//                  navigateToHelpInfor(context);
//                },
//              )
//            ]),
//      ),
    );
  }
}

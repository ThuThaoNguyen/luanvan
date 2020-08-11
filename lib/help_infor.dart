import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_example/home_page.dart';
import 'marketrate.dart';
import 'weatherforecast.dart';

class help_infor extends StatelessWidget {
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
//  @override
//  Future navigateToWeatherForecast(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => weather_forecast()));
//  }
//
//  @override
//  Future navigateToHome(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => TutorialHome()));
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(children: <Widget>[
        new Image.asset(
          "assets/images/anhbanner.jpg",
          fit: BoxFit.cover,
          width: 420.0,
          height: 250.0,
        ),
       //  Expanded(child: Text(null)),
         Center(
            // padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
            child: Text("OnRice phiên bản 1.0",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight:  FontWeight.bold,
                ))),
        Center(
          // padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
            child: Text("Ngày phát hành: 08/08/2020.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,

                ))),
        Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Text("Ứng dụng là sản phẩm được phát triển trong đồ án luận văn. Ứng dụng giúp nông dân nhận diện 4 loại bệnh hại chính: bệnh vàng lá, bệnh đạo ôn, bệnh đốm nâu, bệnh cháy bìa lá thông qua biểu hiện trên lá lúa. Ngoài ra, n còn hỗ trợ thêm chức năng xem giá thị trường và dự báo thời tiết tại địa phương.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,

                ))),
        Container(
            padding: EdgeInsets.fromLTRB(15, 10, 250, 0),
            child: Text("Thông tin liên hệ:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,

                ))),
        Container(
            padding: EdgeInsets.fromLTRB(15, 10, 140, 0),
            child: Text("thaob1605307@student.ctu.edu.vn",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,

                ))),
      ]),

//      bottomNavigationBar: Container(
//        decoration: myboxDecoration(),
//        child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
////
//              IconButton(
//                  icon: Icon(
//                    Icons.home,
//                    color: Colors.grey,
//                  ),
//                  color: Colors.green[600],
//                  tooltip: "home",
//                  iconSize: 30.0,
//                  onPressed: () {
//                    navigateToHome(context);
//                  },),
//
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
//                    color: Colors.grey,
//                  ),
//                  color: Colors.green[600],
//                  tooltip: "Weather Forecast",
//                  iconSize: 40.0,
//                  onPressed: () {
//                    navigateToWeatherForecast(context);
//                  }),
//              IconButton(
//                  icon: Icon(
//                    Icons.info,
//                    color: Colors.green[600],
//                  ),
//                  tooltip: "Infor",
//                  iconSize: 40.0,
//                  onPressed: null)
//            ]),
//      ),
    );
  }
}

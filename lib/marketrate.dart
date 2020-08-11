import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_example/home_page.dart';
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
      appBar: AppBar(
//          leading: IconButton(
//            icon: Icon(Icons.arrow_back),
//            tooltip: "Navigation menu",
//            onPressed: () {
//              Navigator.pop(context);
//            },
//          ),
          backgroundColor: Colors.green[600], //lightGreen[600],
          title: Container(
            padding: EdgeInsets.fromLTRB(50, 0, 40, 0),
            child: Text(
              "GIÁ THỊ TRƯỜNG",
              style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontFamily: "Merriweather",
              ),
            ),
          )),
      body: Column(children: <Widget>[
//        new Image.asset(
//          "assets/images/anhbanner.jpg",
//          fit: BoxFit.fill,
//          width: 380.0,
//          height: 200.0,
//        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Row(children: <Widget>[
                Icon(Icons.add_location, color: Colors.green, size: 20.0),
                Text(
                  "Chợ Xuân Khánh, Cần Thơ",
                  style: new TextStyle(color: Colors.black, fontSize: 14.0),
                )
              ]),
              new Row(children: <Widget>[
                Icon(Icons.today, color: Colors.green, size: 20.0),
                Text(
                  "Ngày 03/08/2020",
                  style: new TextStyle(color: Colors.black, fontSize: 14.0),
                )
              ]),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: 230,
                height: 38.0,
                constraints: BoxConstraints(minWidth: 230.0, minHeight: 20.0),
                child: TextField(
                  // obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nhập tên'),
                ),
              ),
              const RaisedButton(
                onPressed: null,
                child: Text('Tìm',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ],
          ),
        ),
        DataTable(
          columns: [
            DataColumn(label: Text("STT")),
            DataColumn(label: Text("Tên Nông Sản")),
            DataColumn(label: Text("Giá (Đồng/ 1kg)")),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Lúa 504')),
              DataCell(Text('4000')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Khổ qua')),
              DataCell(Text('4000')),
            ]),
          ],
        ),
      ]),
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
//
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
//                  onPressed: (){
//                    navigateToHome(context);
//                  }),
//              IconButton(
//                  icon: Icon(
//                    Icons.show_chart,
//                    color: Colors.green[600],
//                  ),
//                  color: Colors.green[600],
//                  tooltip: "Market Rate",
//                  iconSize: 40.0,
//                  onPressed: null),
//              IconButton(
//                  icon: Icon(
//                    Icons.wb_sunny,
//                    color: Colors.grey,
//                  ),
//                  color: Colors.green[600],
//                  tooltip: "Weather Forecast",
//                  iconSize: 40.0,
//                  onPressed: (){
//                    navigateToWeatherForecast(context);
//                  }),
//              IconButton(
//                  icon: Icon(
//                    Icons.info,
//                    color: Colors.grey,
//                  ),
//                  tooltip: "Infor",
//                  iconSize: 40.0,
//                  onPressed: (){
//                    navigateToHelpInfor(context);
//                  },)
//            ]),
//      ),
    );
  }
}

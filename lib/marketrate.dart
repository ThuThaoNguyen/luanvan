import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_example/home_page.dart';
import 'marketrate.dart';
import 'weatherforecast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:intl/intl.dart';

final FirebaseApp app = initializeApp(
    options: FirebaseOptions(
        googleAppID: "1:673866928334:android:448337214e83c7c60d409f",
        apiKey: 'AIzaSyBPbOP8LrXQoQ3PkIEr06wmcAk_aW4Pyqc',
        databaseURL: 'https://onrice-aac04.firebaseio.com'));

FirebaseApp initializeApp({FirebaseOptions options}) {}

class MarketRate {
  String key;
//  String Id;
  String Ma_admin;
  String Ten_NS;
  String Gia;
//  String date;
//  String location;
  MarketRate(
//      this.Id,
      this.Ma_admin,
      this.Ten_NS,
      this.Gia,
//      this.date,
//      this.location,
      );
  MarketRate.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
//        Id = snapshot.value['Id'],
        Ma_admin = snapshot.value['Ma_admin'],
        Ten_NS = snapshot.value['Ten_NS'],
        Gia = snapshot.value['Gia'];
//        date = snapshot.value['date'],
//        location = snapshot.value['location'];
  toJson() {
    return {
//      "Id": Id,
      "Ma_admin": Ma_admin,
      "Ten_NS": Ten_NS,
      "Gia": Gia,
//      "date": date,
//      "location": location,
    };
  }
}

class market_rate extends StatefulWidget {
  @override
  marketHome createState() => marketHome();
//  Future navigateToHome(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => TutorialHome()));
//  }
//
//  Future navigateToWeatherForecast(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => weather_forecast()));
//  }
}

class marketHome extends State<market_rate> {
  List<MarketRate> market_rate = List();
  MarketRate rate;
  DatabaseReference rateRef;

  DatabaseReference label;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var date = DateTime.now();

  @override
  void initState() {
    super.initState();

    rate = MarketRate("", "", "");
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    rateRef = database.reference().child("Gia_NS");
    label = null;

//    print(date);
  }

  @override
  BoxDecoration myboxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1, //
        color: Colors.green[600], //                  <--- border width here
      ),
    );
  }
  void dispose(){
    super.dispose();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Column(children: <Widget>[

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
                  "Ngày "+ date.day.toString()+'/'+date.month.toString()+'/'+date.year.toString(),
                  style: new TextStyle(color: Colors.black, fontSize: 14.0),
                )
              ]),
            ],
          ),
        ),
//        Container(
//          padding: EdgeInsets.fromLTRB(45, 0, 35, 20),
//          child: Row(
//            children: <Widget>[
//              Container(
//                color: Colors.white,
//                width: 160,
//                height: 38.0,
//                constraints: BoxConstraints(minWidth: 180.0, minHeight: 20.0),
//                child: TextField(
//                  // obscureText: true,
//                  decoration: InputDecoration(
//                      border: OutlineInputBorder(), labelText: 'Nhập tên'),
//                ),
//              ),
//              const RaisedButton(
//                onPressed:null ,
//                child: Text('Tìm',
//                    style: TextStyle(fontSize: 20, color: Colors.white)),
//              ),
//            ],
//          ),
//        ),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container (
                padding: EdgeInsets.fromLTRB(50, 5, 0, 5),
                child: Text("Tên nông sản", style: TextStyle(color: Colors.grey ))),
            Container(
                padding: EdgeInsets.fromLTRB(0, 5, 40, 5),
                child:Text("Đồng/1kg",style: TextStyle(color: Colors.grey )))
          ],
        ),
        Flexible(
            child: FirebaseAnimatedList(
            query: rateRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return Column(
              children: <Widget>[
                Padding(
                  padding:EdgeInsets.symmetric(horizontal:10.0),
                  child:Container(
                    height:1.0,
                    width:325.0,
                    color:Colors.grey,),),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                     Container (
                         padding: EdgeInsets.fromLTRB(50, 10, 0, 10),
                         child: Text(snapshot.value["Ten_NS"].toString())),
                     Container(
                         padding: EdgeInsets.fromLTRB(0, 10, 40, 10),
                         child:Text(snapshot.value["Gia"].toString()))
                  ],
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,

            );

          },
        ))
      ]),
    );
  }
}

//Container(
//padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//child: DataTable(
//columns: [
//DataColumn(label: Text("Tên Nông Sản")),
//DataColumn(label: Text("Giá (Đồng/ 1kg)")),
//],
//rows: [
//DataRow(cells: [DataCell(Text("")), DataCell(Text(""))]),
//],
//),
//),
//Flexible (
//child: FirebaseAnimatedList(
//query: rateRef,
//itemBuilder: (BuildContext context, DataSnapshot snapshot,
//Animation<double> animation, int index) {
//return
////            new ListTile(
////              leading: Icon(Icons.message),
////              title: Text(snapshot.value["name"].toString()),   // market_rate[index].name
////              subtitle: Text(snapshot.value["price"].toString()),
////            );
//DataTable(
//columns: [
////  DataColumn(label: Text("STT")),
//DataColumn(label: Text("")),
//DataColumn(label: Text("")),
//],
//rows: [
//DataRow(cells: [
//DataCell(Text(snapshot.value["name"].toString())),
//DataCell(Text(snapshot.value["price"].toString())),
//]),
//],
//);

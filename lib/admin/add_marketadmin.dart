//import 'dart:html';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'marketrate_admin.dart';
import 'package:hexcolor/hexcolor.dart';

//final FirebaseApp app = initializeApp(
//    options: FirebaseOptions(
//        googleAppID: "1:673866928334:android:448337214e83c7c60d409f",
//        apiKey: 'AIzaSyBPbOP8LrXQoQ3PkIEr06wmcAk_aW4Pyqc',
//        databaseURL: 'https://onrice-aac04.firebaseio.com'));
//
//FirebaseApp initializeApp({FirebaseOptions options}) {}

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

class MyAddMarketAdmin extends StatefulWidget {
  @override
  dynamicWidget createState() => new dynamicWidget();
}
class dynamicWidget extends State<MyAddMarketAdmin> {
  TextEditingController Product = new TextEditingController();
  TextEditingController Price = new TextEditingController();
  List<MarketRate> market_rate = List();
  MarketRate rate;
  DatabaseReference rateRef;
  String product;
  String price;
  String error ='';
  @override
  void initState() {
    super.initState();
    rate = MarketRate("", "", "");
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    rateRef = database.reference().child("Gia_NS");
    rateRef.once().then((DataSnapshot snapshot) {
      print(snapshot.value);
    });
//    print(date);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "Navigation menu",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Hexcolor('#313437'),//lightGreen[600],
        title: Container(
            child: Text('OnRice',
              style: new TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontFamily: "Montserrat",
              ),
            )
        ),
        centerTitle:true ,
      ),
      body: new Container(
        child:
        Column(children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: EdgeInsets.fromLTRB(5, 30, 5, 0),
                child: new TextFormField(
                  controller: Product,
                  decoration: const InputDecoration(
                      labelText: 'Tên sản phẩm', border: OutlineInputBorder()),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.fromLTRB(5, 30, 5, 0),
                child: new TextFormField(
                  controller: Price,
                  decoration: const InputDecoration(
                      labelText: 'Giá', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
         Container(
           padding: EdgeInsets.all(10.0),
           child: Text(error,style: TextStyle(
             color: Colors.red,
           ),),
         ) ,
          Padding (
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: RaisedButton(
              color: Colors.green[600],
              onPressed:(){
                if(Product.text.toString() != '' && Price.text.toString() != ''){
                  rateRef.push().set(<String,String>{
                    "Ma_admin": '1',
                    "Ten_NS": Product.text.toString(),
                    "Gia": Price.text.toString(),
                  });
                  Navigator.pop(context);
                }
                else {

                  error = 'Phải nhập đầy đủ giá trị.';
                  print(error);}
              },
              child: Text('Lưu',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
//                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ),

        ]),
      ),
    );
  }
}

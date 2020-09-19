import 'dart:typed_data';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:hexcolor/hexcolor.dart';
import 'marketrate.dart';
import 'home_page.dart';
import 'package:firebase_core/firebase_core.dart';
//final FirebaseApp app = initializeApp(
//    options: FirebaseOptions(
//        googleAppID: "1:673866928334:android:448337214e83c7c60d409f",
//        apiKey: 'AIzaSyBPbOP8LrXQoQ3PkIEr06wmcAk_aW4Pyqc',
//        databaseURL: 'https://onrice-aac04.firebaseio.com'));
//
//FirebaseApp initializeApp({FirebaseOptions options}) {}

class MydiseaseInfor extends StatefulWidget {
  @override
  disease_infor createState() => disease_infor();
}

class DiseaseInfor {
  String key;
  String Id_DI;
  String Id_user;
  String expression;
  String image;
  String medicine;
  String name;
  String reason;
  String treatment;
  DiseaseInfor(this.Id_DI, this.Id_user, this.expression, this.image,
      this.medicine, this.name, this.reason, this.treatment);
  DiseaseInfor.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        Id_DI = snapshot.value['Id_DI'],
        Id_user = snapshot.value['Id_user'],
        expression = snapshot.value['expression'],
        image = snapshot.value['image'],
        medicine = snapshot.value['medicine'],
        name = snapshot.value['name'],
        reason = snapshot.value['reason'],
        treatment = snapshot.value['treatment'];
  toJson() {
    return {
      "Id_DI": Id_DI,
      "Id_user": Id_user,
      "expression": expression,
      "image": image,
      "medicine": medicine,
      "name": name,
      "reason": reason,
      "treatment": treatment
    };
  }
}

@override
class disease_infor extends State<MydiseaseInfor> {
  List<DiseaseInfor> diseaseinfor = List();
  DiseaseInfor infor;
  DatabaseReference dbRef;
  @override
  void initState() {
    super.initState();
    infor = DiseaseInfor("", "", "", "", "", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    dbRef = database.reference().child("diseaseInfor");
  }

  @override
  Future navigateToHomePage(context) async =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => Myapp()));
//  List lists = List();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: "Navigation menu",
            onPressed: () {
              navigateToHomePage(context);
              color = Colors.white;
            },
          ),
          backgroundColor: Colors.green[600], //lightGreen[600],
          title: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 40, 0),
            child: Text(
              kq.toString().toUpperCase(),
              style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                // fontStyle: FontStyle.italic,
                fontFamily: "Merriweather",
              ),
            ),
          )),
      body: Column(children: <Widget>[
        Flexible(
            child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return snapshot.value["name"] == kq
                      ? Column(children: <Widget>[
                          new Image.asset(
                            "assets/images/" + snapshot.value["image"],
                            fit: BoxFit.fill,
                            width: 380.0,
                            height: 160.0,
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "BIỂU HIỆN BỆNH",
                                  style: new TextStyle(
                                      color: Hexcolor("#FF9900"),
                                      fontSize: 18.0,
                                      fontFamily: "Merriweather",
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                                child: Text(snapshot.value["expression"].toString()
                                    .replaceAll(".", ".\n"),
                                    style: new TextStyle(
                                      color: Hexcolor("#000000"),
                                      fontSize: 18.0,
                                      fontFamily: "Merriweather",
                                    ))),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "NGUYÊN NHÂN",
                                  style: new TextStyle(
                                      color: Hexcolor("#FF0000"),
                                      fontSize: 18.0,
                                      fontFamily: "Merriweather",
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                                child: Text(
                                  snapshot.value["reason"].toString()
                                      .replaceAll(".", ".\n"),
                                  style: new TextStyle(
                                    color: Hexcolor("#000000"),
                                    fontSize: 18.0,
                                    fontFamily: "Merriweather",
                                  ),
                                )),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  "CÁCH PHÒNG TRỊ",
                                  style: new TextStyle(
                                      color: Hexcolor("#006600"),
                                      fontSize: 18.0,
                                      fontFamily: "Merriweather",
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                                child: Text(
                                  snapshot.value["treatment"].toString()
                                      .replaceAll(".", ".\n"),
                                  style: new TextStyle(
                                    color: Hexcolor("#000000"),
                                    fontSize: 18.0,
                                    fontFamily: "Merriweather",
                                  ),
                                )),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                                child: Text("Thuốc: "+
                                  snapshot.value["medicine"].toString()
                                      .replaceAll(".", ".\n"),
                                  style: new TextStyle(
                                    color: Hexcolor("#000000"),
                                    fontSize: 18.0,
                                    fontFamily: "Merriweather",
                                  ),
                                )),
                          ),
                        ])
                      : Text("");
                }))
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: (IconButton(
            icon: Icon(
          Icons.control_point,
          color: Colors.white,
          size: 30.0,
        ))),
        tooltip: "Add",
        onPressed: () {
          navigateToHomePage(context);
          color = Colors.white;
        },
      ),
    );
  }
}

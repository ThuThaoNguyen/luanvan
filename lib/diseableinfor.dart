import 'dart:typed_data';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:hexcolor/hexcolor.dart';
@override
class MydiseaseInfor extends StatefulWidget{
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
  DiseaseInfor(
      this.Id_DI,
      this.Id_user,
      this.expression,
      this.image,
      this.medicine,
      this.name,
      this.reason,
      this.treatment

      );
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
         "expression":expression,
         "image":image,
         "medicine":medicine,
         "name":name,
         "reason":reason,
         "treatment":treatment

    };
  }
}
@override
class disease_infor extends State<MydiseaseInfor> {
  final dbRef = FirebaseDatabase.instance.reference().child("diseaseInfor");
  List lists = List();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: "Navigation menu",
            onPressed: null,
          ),
          backgroundColor: Colors.green[600], //lightGreen[600],
          title: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 40, 0),
            child: Text(
              "BỆNH VÀNG LÁ LÚA",
              style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                // fontStyle: FontStyle.italic,
                fontFamily: "Merriweather",
              ),
            ),
          )),
      body:FutureBuilder(
          future: dbRef.once(),
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
//            if (snapshot.hasData) {
////              lists.clear();
//              Map<dynamic, dynamic> values = snapshot.data.value;
//              values.forEach((key, values) {
//                lists.add(values);
//              });

              return new ListView.builder(
                  shrinkWrap: true,
                  itemCount: lists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
//                          Text("Name: " + snapshot.data.value("name").toString()),
//                          Text("Age: "+ lists[index]["medicine"]),
//                          Text("Type: " +lists[index]["reason"]),
                        ],
                      ),
                    );
                  });
//            }
            return CircularProgressIndicator();
          }),
//      Column(children: <Widget>[
//        new Image.asset(
//          "assets/images/anhbanner.jpg",
//          fit: BoxFit.fill,
//          width: 380.0,
//          height: 160.0,
//        ),
//        Center(
//          child: Container(
//              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
//              child: Text(
//                "BIỂU HIỆN BỆNH",
//                style: new TextStyle(
//                    color: Hexcolor("#FF9900"),
//                    fontSize: 18.0,
//                    fontFamily: "Merriweather",
//                    fontWeight: FontWeight.bold),
//              )),
//        ),
//        Center(
//          child: Container(
//              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
//              child: Text(
//                "Lúa bệnh lá cháy 2 bên ....................",
//                style: new TextStyle(
//                  color: Hexcolor("#000000"),
//                  fontSize: 18.0,
//                  fontFamily: "Merriweather",
//                ),
//              )),
//        ),
//        Center(
//          child: Container(
//              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
//              child: Text(
//                "NGUYÊN NHÂN",
//                style: new TextStyle(
//                    color: Hexcolor("#FF0000"),
//                    fontSize: 18.0,
//                    fontFamily: "Merriweather",
//                    fontWeight: FontWeight.bold),
//              )),
//        ),
//        Center(
//          child: Container(
//              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
//              child: Text(
//                "Lúa bị thiếu dinh dưỡng ....................",
//                style: new TextStyle(
//                  color: Hexcolor("#000000"),
//                  fontSize: 18.0,
//                  fontFamily: "Merriweather",
//                ),
//              )),
//        ),
//        Center(
//          child: Container(
//              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
//              child: Text(
//                "CÁCH PHÒNG TRỊ",
//                style: new TextStyle(
//                    color: Hexcolor("#006600"),
//                    fontSize: 18.0,
//                    fontFamily: "Merriweather",
//                    fontWeight: FontWeight.bold),
//              )),
//        ),
//        Center(
//          child: Container(
//              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
//              child: Text(
//                "Sử dụng thuốc ....................",
//                style: new TextStyle(
//                  color: Hexcolor("#000000"),
//                  fontSize: 18.0,
//                  fontFamily: "Merriweather",
//                ),
//              )),
//        ),
//      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: (IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 30.0,
            ))),
        tooltip: "Add",
        onPressed: null,
      ),
    );
  }
}

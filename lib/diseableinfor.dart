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
import 'finddinfor.dart';
import 'package:tflite_example/widgets/recognition.dart';
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
  String Ma_benh;
  String Ma_admin;
  String Bieu_hien;
  String Hinhanh;
  String Thuoc;
  String Ten_benh;
  String Nguyen_nhan;
  String Chua_tri;
  DiseaseInfor(this.Ma_benh, this.Ma_admin, this.Bieu_hien, this.Hinhanh,
      this.Thuoc, this.Ten_benh, this.Nguyen_nhan, this.Chua_tri);
  DiseaseInfor.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        Ma_benh = snapshot.value['Ma_benh'],
        Ma_admin = snapshot.value['Ma_admin'],
        Bieu_hien = snapshot.value['Bieu_hien'],
        Hinhanh = snapshot.value['Hinhanh'],
        Thuoc = snapshot.value['Thuoc'],
        Ten_benh = snapshot.value['Ten_benh'],
        Nguyen_nhan= snapshot.value['Nguyen_nhan'],
        Chua_tri = snapshot.value['Chua_tri'];
  toJson() {
    return {
      "Ma_benh": Ma_benh,
      "Ma_admin": Ma_admin,
      "Bieu_hien": Bieu_hien,
      "Hinhanh": Hinhanh,
      "Thuoc": Thuoc,
      "Ten_benh": Ten_benh,
      "Nguyen_nhan": Nguyen_nhan,
      "Chua_tri": Chua_tri
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
    dbRef = database.reference().child("Benh");
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
              kq = null;
              kq1 = null;
            },
          ),
          backgroundColor: Colors.green[600], //lightGreen[600],
          title: Container(
//            padding: EdgeInsets.fromLTRB(30, 0, 40, 0),
            child: nametitle != null
              ?Text(
              nametitle.toString().toUpperCase(),
              style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                // fontStyle: FontStyle.italic,
                fontFamily: "Merriweather",
              ),
            )
            :(kq1 != null
              ?Text(
              kq1.toString().toUpperCase(),
              style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                // fontStyle: FontStyle.italic,
                fontFamily: "Merriweather",
              ),
            )
                :(nametitleonline != null
                ?Text(
                     nametitleonline.toString().toUpperCase(),
                     style: new TextStyle(
                     color: Colors.white,
                      fontSize: 20.0,
                // fontStyle: FontStyle.italic,
                      fontFamily: "Merriweather",
                  ),
                   )
            :Text("Không tìm thấy thông tin",
              style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                // fontStyle: FontStyle.italic,
                fontFamily: "Merriweather",
              ),
            )
            )
            )

          ),
          centerTitle:true ,
      ),
      body: Column(children: <Widget>[

        Flexible(
            child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return snapshot.value["Ma_benh"] == kq || snapshot.value["Ten_benh"] == kq1 || snapshot.value["Ma_benh"] == nametitleonline
                      ? Column(children: <Widget>[
                          new Image.asset(
                            "assets/images/" + snapshot.value["Hinhanh"],
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                            height: 250.0,
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
                                child: Text(snapshot.value["Bieu_hien"].toString()
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
                                  snapshot.value["Nguyen_nhan"].toString()
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
                                  snapshot.value["Chua_tri"].toString()
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
                                  snapshot.value["Thuoc"].toString()
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
          kq = null;
          kq1 = null;
        },
      ),
    );
  }
  void dispose(){
    super.dispose();
  }
}

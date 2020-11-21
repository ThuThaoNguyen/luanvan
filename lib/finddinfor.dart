import 'dart:math';
import 'package:flutter/material.dart';
import 'marketrate.dart';
import 'dart:io';
import 'diseableinfor.dart';
import 'home_page.dart';
import 'dart:typed_data';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tflite_example/help_infor.dart';

List name = [];

class FindInfor extends StatefulWidget {
  @override
  finddesease createState() => finddesease();
}
String kq1;
var key;


@override
class finddesease extends State<FindInfor> {
  List<DiseaseInfor> diseaseinfor = List();
  DiseaseInfor infor;
  DatabaseReference dbRef;
  int havevalue = 0;
  @override
  void initState() {
    super.initState();
    infor = DiseaseInfor("", "", "", "", "", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    dbRef = database.reference().child("diseaseInfor");
  }

  @override
  Future navigateToDiseableInfor(context) async => Navigator.push(
      context, MaterialPageRoute(builder: (context) => MydiseaseInfor()));

  @override
  Future TranResult(String kq) async {
    setState(() {
      kq1 = kq;
    });
  }

  Future findconsin(String e, String f) async {
    double consin;
    int a = 0;
    int b = 0;
    int c = 0;
    double daicau1;
    double daicau2;
    List item = [];
    List _list = [];
    List cau1 = [];
    setState(() {
//      name.add(e);

      key = e.toLowerCase().split(" ");

      int valuecau1;
//    int valueitem;
      _list = f.toLowerCase().split(" ");
      key.forEach((value) {
        valuecau1 = 0;
        _list.forEach((st) {
          if (value == st) valuecau1 = 1 + valuecau1;
        });
        cau1.add(valuecau1);
      });
      key.forEach((st) {
        item.add(1);
      });
      for (int i = 0; i < cau1.length; i++) {
        a = cau1[i] + a;
        b = pow(cau1[i], 2) + b;
      }
      ;
      for (int j = 0; j < item.length; j++) {
        c = pow(item[j], 2) + c;
      }
      ;
      daicau1 = sqrt(b);
      daicau2 = sqrt(c);
      consin = a / (daicau1 * daicau2);
      if (consin >= 0.5 && name.contains(f) == false) {
        name.add(f);
      }
      ;
      return name;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
//          Text(havevalue.toString()),
          Flexible(
              child: FirebaseAnimatedList(
                  query: dbRef,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    findconsin(tukhoa, snapshot.value["name"]);
                    if (name.length != 0) {
                      havevalue = 1;
                    };
                    return name.length != 0 &&
                            name.contains(snapshot.value["name"])
                        ? Center(
                            child: SingleChildScrollView(
                                child: Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: RaisedButton(
                              textColor: Colors.black87,
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              color: Colors.white,
                              onPressed: () => {
                                TranResult(snapshot.value["name"]),
                                navigateToDiseableInfor(context)
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: new Image.asset(
                                        "assets/images/" +
                                            snapshot.value["image"],
                                        fit: BoxFit.cover,
                                        width: 70.0,
                                        height: 70.0,
                                      )),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                      child: SizedBox(
                                        width: 200.0,
                                        child: Text(
                                            snapshot.value["name"],
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            style: TextStyle(
                                                fontFamily: 'Merriweather',
                                                fontSize: 18.0)),
                                      )),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.green[600])),
                            ),
                          )))
                        : Text("");
                  })),
//      havevalue == 0
//              ? Center(
//              child: Container(
//                  padding: EdgeInsets.fromLTRB(0, 10, 0, 300),
//                  child: Text("Không tìm thấy"+havevalue.toString())))
//              : Text("")
        ]));
  }
}

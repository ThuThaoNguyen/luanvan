import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:hexcolor/hexcolor.dart';
class diseable_infor extends StatelessWidget {
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
      body: Column(children: <Widget>[
        new Image.asset(
          "assets/images/anhbanner.jpg",
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
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                "Lúa bệnh lá cháy 2 bên ....................",
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
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                "Lúa bị thiếu dinh dưỡng ....................",
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
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                "Sử dụng thuốc ....................",
                style: new TextStyle(
                  color: Hexcolor("#000000"),
                  fontSize: 18.0,
                  fontFamily: "Merriweather",
                ),
              )),
        ),
      ]),
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

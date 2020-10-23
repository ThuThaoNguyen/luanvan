import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_example/help_infor.dart';
import 'package:hexcolor/hexcolor.dart';
class MyDiseaseInforAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(child: DiseaseInforAdmin()))); // MyImagePicker()
  }
}
class DiseaseInforAdmin extends StatefulWidget{
  @override

  DiseaseInfor createState() => new DiseaseInfor();
}
class DiseaseInfor extends State<DiseaseInforAdmin>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Text('diseaseinfor'),

    );
  }
}
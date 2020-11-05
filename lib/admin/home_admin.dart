import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_example/help_infor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'marketrate_admin.dart';
import 'user_admin.dart';
import 'diseaseinfor_admin.dart';

class Myadmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: MyadminDemo()))); // MyImagePicker()
  }
}

class MyadminDemo extends StatefulWidget {
  @override
  _MyadminState createState() => new _MyadminState();
}

class _MyadminState extends State<MyadminDemo> {
  int _pageIndex = 0;
  PageController _pageController;
  List<Widget> tabPages = [
    MyhomeAdmin(),
    MyUserAdmin(),
    MyMarketRateAdmin(),
    MyDiseaseInforAdmin()
  ];

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#313437'),
        leading: Container(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Image.asset(
            "assets/images/LogoMakr_9MOIQ9_-_Copy-removebg-preview.png",
          ),
        ),
        title: Center(
          child: Text(
            'OnRice',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: "Montserrat",
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        //backgroundColor: Colors.green[600],
        iconSize: 20.0,
        selectedItemColor: Colors.green[600],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle:
            TextStyle(color: Colors.green[600], fontFamily: "Montserrat"),
        unselectedLabelStyle:
            TextStyle(color: Colors.grey, fontFamily: "Montserrat"),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("Trang chủ")),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              title: Text("Người dùng")),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), title: Text("Giá thị trường")),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_drive_file),
              title: Text("Thông tin bệnh")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.person), title: Text("Đăng nhập")),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}

class MyhomeAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: HomeAdmin()))); // MyImagePicker()
  }
}

class HomeAdmin extends StatefulWidget {
  @override
  Home createState() => new Home();
}
final FirebaseStorage storageReference = FirebaseStorage.instance;

class Home extends State<HomeAdmin> {
  BoxDecoration myboxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 2, //
        color: Colors.green[600], //                  <--- border width here
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body:
        Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                 Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: RaisedButton(
                    textColor: Colors.black87,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    color: Colors.white,
                    onPressed: () => {

                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child:Text('bogai ', style: TextStyle(fontFamily: 'Merriweather', fontSize: 20.0))),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child:  Text('(2 ảnh)',
                              style: TextStyle(
                                  fontFamily: 'Merriweather',
                                  fontSize: 18.0)),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green[600])),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: RaisedButton(
                    textColor: Colors.black87,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    color: Colors.white,
                    onPressed: () => {

                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child:Text('daoon ', style: TextStyle(fontFamily: 'Merriweather', fontSize: 20.0))),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child:  Text('(2 ảnh)',
                              style: TextStyle(
                                  fontFamily: 'Merriweather',
                                  fontSize: 18.0)),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green[600])),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: RaisedButton(
                    textColor: Colors.black87,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    color: Colors.white,
                    onPressed: () => {

                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child:Text('chaybiala ', style: TextStyle(fontFamily: 'Merriweather', fontSize: 20.0))),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child:  Text('(2 ảnh)',
                              style: TextStyle(
                                  fontFamily: 'Merriweather',
                                  fontSize: 18.0)),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green[600])),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: RaisedButton(
                    textColor: Colors.black87,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    color: Colors.white,
                    onPressed: () => {

                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child:Text('domnau ', style: TextStyle(fontFamily: 'Merriweather', fontSize: 20.0))),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child:  Text('(2 ảnh)',
                              style: TextStyle(
                                  fontFamily: 'Merriweather',
                                  fontSize: 18.0)),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green[600])),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: RaisedButton(
                    textColor: Colors.black87,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    color: Colors.white,
                    onPressed: () => {

                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child:Text('vangla ', style: TextStyle(fontFamily: 'Merriweather', fontSize: 20.0))),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child:  Text('(2 ảnh)',
                              style: TextStyle(
                                  fontFamily: 'Merriweather',
                                  fontSize: 18.0)),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green[600])),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: RaisedButton(
                    textColor: Colors.black87,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    color: Colors.white,
                    onPressed: () => {

                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child:Text('khongbenh ', style: TextStyle(fontFamily: 'Merriweather', fontSize: 20.0))),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child:  Text('(2 ảnh)',
                              style: TextStyle(
                                  fontFamily: 'Merriweather',
                                  fontSize: 18.0)),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green[600])),
                  ),
                )
              ],
            )


          )
        )
    );
//          Container(
//              padding: EdgeInsets.fromLTRB(10, 10, 10,10),
//          child: SingleChildScrollView(
//              child: Column(
//                children: <Widget>[
//                  Container(
////               margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
//                    decoration:myboxDecoration(),
//                    child: RaisedButton(
//                        textColor: Colors.black87,
////                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
//                        color: Colors.white,
//                        onPressed: () => {
//                        },
//                        child: Container(
//                          padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
//                          child:Column(
////                    padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
//                            children: <Widget>[
//                              Text('bogai',style: TextStyle (fontSize: 30.0),),
////                       Expanded(child: Text(''),),
//                              Text('2 ảnh',style: TextStyle (color: Colors.blueGrey, fontSize: 20.0,fontStyle: FontStyle.italic)),
//                            ],
//                          ),
//                        )
//
//                    ) ,
//                  ),
//                  Container(
////               margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
//                    decoration:myboxDecoration(),
//                    child: RaisedButton(
//                        textColor: Colors.black87,
////                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
//                        color: Colors.white,
//                        onPressed: () => {
//                        },
//                        child: Container(
//
//                          padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
//                          child:Column(
////                    padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
//                            children: <Widget>[
//                              Text('chaybiala',style: TextStyle (fontSize: 30.0),),
////                       Expanded(child: Text(''),),
//                              Text('2 ảnh',style: TextStyle (color: Colors.blueGrey, fontSize: 20.0,fontStyle: FontStyle.italic)),
//                            ],
//                          ),
//                        )
//
//                    ) ,
//                  )
//                ],
//              )
//
//    )));
//        Center(
//            child: SingleChildScrollView(
//                child: Column(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        Container(
//          margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//          decoration: BoxDecoration(
//              color: Colors.green[600],
//              border: Border.all(color: Colors.green, width: 1.0)),
//          height: 100.0,
//          width: 100.0,
//          child: Column(
//            children: <Widget>[
//              Center(
//                child: Text('30'),
//              ),
//              Center(
//                child: Text('User'),
//              )
//            ],
//          ),
//        ),
//        Container(
//          margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//          decoration: BoxDecoration(
//              color: Colors.green[600],
//              border: Border.all(color: Colors.green, width: 1.0)),
//          height: 100.0,
//          width: 100.0,
//        )
//      ],
//    ))));
  }
}

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_example/help_infor.dart';

class Myadmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(child: MyadminDemo()))); // MyImagePicker()
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
        backgroundColor: Colors.green[600],
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: "Navigation menu",
          onPressed: null,
        ),
//        title: TextField(
//          cursorColor: Colors.white,
//          decoration: InputDecoration(
//              border: InputBorder.none, hintText: 'Nhập tên bệnh hại'),
//          style: new TextStyle(
//            color: Colors.white,
//            fontSize: 20.0,
//            fontStyle: FontStyle.italic,
//            fontFamily: "Montserrat",
//          ),
//        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.person, size: 30.0,color: Colors.white,),
//            onPressed: null,
//
//          ),
//        ],
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _pageIndex,
//        onTap: onTabTapped,
//        //backgroundColor: Colors.green[600],
//        iconSize: 20.0,
//        selectedItemColor: Colors.green[600],
//        unselectedItemColor: Colors.grey,
//        showUnselectedLabels: true,
//        selectedLabelStyle:
//        TextStyle(color: Colors.green[600], fontFamily: "Montserrat"),
//        unselectedLabelStyle:
//        TextStyle(color: Colors.grey, fontFamily: "Montserrat"),
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//              icon: Icon(Icons.home), title: Text("Trang chủ")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.show_chart), title: Text("Giá")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.cloud_queue), title: Text("Thời tiết")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.info_outline), title: Text("Thông tin")),
////          BottomNavigationBarItem(
////              icon: Icon(Icons.person), title: Text("Đăng nhập")),
//        ],
//      ),
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

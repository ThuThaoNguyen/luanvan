import 'dart:typed_data';
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
        ), ),
        title:Center(child:Text('OnRice',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Montserrat",
          ),
        ),),
        actions: <Widget>[
         IconButton(
           icon: Icon(
             Icons.person,
             size: 30.0,
             color: Colors.white,
           ),
           onPressed: () {

           },
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
              icon: Icon(Icons.supervised_user_circle), title: Text("Người dùng")),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), title: Text("Giá thị trường")),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_drive_file), title: Text("Thông tin bệnh")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.person), title: Text("Đăng nhập")),
        ],
      ),
      body:
      PageView(
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
        home: Scaffold(
            body: Center(child: HomeAdmin()))); // MyImagePicker()
  }
}
class HomeAdmin extends StatefulWidget{
  @override

  Home createState() => new Home();
}
class Home extends State<HomeAdmin>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

    );
  }



}


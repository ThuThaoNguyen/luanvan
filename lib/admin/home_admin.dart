import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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
import 'show_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tflite_example/home_page.dart';
import 'package:tflite_example/login.dart';
//final FirebaseApp app = initializeApp(
//    options: FirebaseOptions(
//        googleAppID: "1:673866928334:android:448337214e83c7c60d409f",
//        apiKey: 'AIzaSyBPbOP8LrXQoQ3PkIEr06wmcAk_aW4Pyqc',
//        databaseURL: 'https://onrice-aac04.firebaseio.com'));
//
//FirebaseApp initializeApp({FirebaseOptions options}) {}


class Myadmin extends StatefulWidget {
  @override
  _MyadminState createState() => new _MyadminState();
}

class _MyadminState extends State<Myadmin> {
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
  Future navigateToHomePage(context) async =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => Myapp()));
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
            onPressed: () {navigateToHomePage(context);},
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

//class MyhomeAdmin extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        debugShowCheckedModeBanner: false,
//        home: Scaffold(body: Center(child: HomeAdmin()))); // MyImagePicker()
//  }
//}

class MyhomeAdmin extends StatefulWidget {
  @override
  Home createState() => new Home();
}


final FirebaseStorage storageReference = FirebaseStorage.instance;
String label;
class Home extends State<MyhomeAdmin> {

  @override
  Future navigateToShowImage(context) async =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => ShowImage()));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: SingleChildScrollView(
       child: Column (
//          mainAxisAlignment: MainAxisAlignment.s,
          children: <Widget>[
                      Container(
//                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          height: 60.0,
                          child: RaisedButton(
                              textColor: Colors.black87,
//                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              color: Colors.white,
                              onPressed: () =>
                              {

                                label = 'bogai',
                                navigateToShowImage(context)
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('  bogai', style: TextStyle(
                                        fontSize: 16),),
//            if (_canEdit(model))
                                    new Row(
                                      children: [
                                        Container(
                                          decoration: new BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: new BorderRadius.circular(
                                                20.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 12),
                                            child: Text(countbogai.toString() +' ảnh', style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,),
                                            ),
                                          ),
                                        ),
                                        const Icon(Icons.navigate_next),
                                      ],
                                    ),
                                  ])
                          )
                      ),
                        Container(
//                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          height: 60.0,
                          child: RaisedButton(
                              textColor: Colors.black87,
//                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              color: Colors.white,

                              onPressed: () => {
                                label = 'chaybiala',
                                navigateToShowImage(context)

                              },
                              child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('  chaybiala',style: TextStyle(
                                        fontSize: 16),),
//            if (_canEdit(model))
                                    new Row(
                                      children: [
                                        Container(
                                          decoration: new BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: new BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 12),
                                            child: Text(countchaybiala.toString() +' ảnh', style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,),
                                            ),
                                          ),
                                        ),
                                        const Icon(Icons.navigate_next),
                                      ],
                                    ),
                                  ]))
                      ),
                         Container(
//                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                           height: 60.0,
                           child: RaisedButton(
                               textColor: Colors.black87,
//                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                               color: Colors.white,

                               onPressed: () => {
                                 label = 'vangla',
                                 navigateToShowImage(context)

                               },
                               child:Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: <Widget>[
                                     new Text('  vangla',style: TextStyle(
                                         fontSize: 16),),
//            if (_canEdit(model))
                                     new Row(
                                       children: [
                                         Container(
                                           decoration: new BoxDecoration(
                                             color: Colors.grey.shade300,
                                             borderRadius: new BorderRadius.circular(20.0),
                                           ),
                                           child: Padding(
                                             padding: EdgeInsets.symmetric(
                                                 vertical: 4, horizontal: 12),
                                             child: Text(countvangla.toString() +' ảnh', style: TextStyle(
                                               fontSize: 14,
                                               fontWeight: FontWeight.bold,),
                                             ),
                                           ),
                                         ),
                                         const Icon(Icons.navigate_next),
                                       ],
                                     ),
                                   ]))),

                           Container(
//                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                             height: 60.0,
                             child: RaisedButton(
                                 textColor: Colors.black87,
//                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                 color: Colors.white,

                                 onPressed: () => {
                                   label = 'daoon',
                                   navigateToShowImage(context)
                                 },
                                 child:Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: <Widget>[
                                       new Text('  daoon',style: TextStyle(
                                           fontSize: 16),),
//            if (_canEdit(model))
                                       new Row(
                                         children: [
                                           Container(
                                             decoration: new BoxDecoration(
                                               color: Colors.grey.shade300,
                                               borderRadius: new BorderRadius.circular(20.0),
                                             ),
                                             child: Padding(
                                               padding: EdgeInsets.symmetric(
                                                   vertical: 4, horizontal: 12),
                                               child: Text(countdaoon.toString() +' ảnh', style: TextStyle(
                                                 fontSize: 14,
                                                 fontWeight: FontWeight.bold,),
                                               ),
                                             ),
                                           ),
                                           const Icon(Icons.navigate_next),
                                         ],
                                       ),
                                     ]))),
                             Container(
//                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                               height: 60.0,
                               child: RaisedButton(
                                   textColor: Colors.black87,
//                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                   color: Colors.white,

                                   onPressed: () => {
                                     label = 'domnau',
                                     navigateToShowImage(context)

                                   },
                                   child:Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: <Widget>[
                                         new Text('  domnau',style: TextStyle(
                                             fontSize: 16),),
//            if (_canEdit(model))
                                         new Row(
                                           children: [
                                             Container(
                                               decoration: new BoxDecoration(
                                                 color: Colors.grey.shade300,
                                                 borderRadius: new BorderRadius.circular(20.0),
                                               ),
                                               child: Padding(
                                                 padding: EdgeInsets.symmetric(
                                                     vertical: 4, horizontal: 12),
                                                 child: Text(countdomnau.toString() +' ảnh', style: TextStyle(
                                                   fontSize: 14,
                                                   fontWeight: FontWeight.bold,),
                                                 ),
                                               ),
                                             ),
                                             const Icon(Icons.navigate_next),
                                           ],
                                         ),
                                       ]))),
                             Container(
//                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                               height: 60.0,
                               child: RaisedButton(
                                   textColor: Colors.black87,
//                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                   color: Colors.white,

                                   onPressed: () => {
                                     label = 'khongbenh',
                                     navigateToShowImage(context)
                                   },
                                   child:Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: <Widget>[
                                         new Text('  khongbenh',style: TextStyle(
                                             fontSize: 16),),
//            if (_canEdit(model))
                                         new Row(
                                           children: [
                                             Container(
                                               decoration: new BoxDecoration(
                                                 color: Colors.grey.shade300,
                                                 borderRadius: new BorderRadius.circular(20.0),
                                               ),
                                               child: Padding(
                                                 padding: EdgeInsets.symmetric(
                                                     vertical: 4, horizontal: 12),
                                                 child: Text(countkhongbenh.toString() +' ảnh', style: TextStyle(
                                                   fontSize: 14,
                                                   fontWeight: FontWeight.bold,),
                                                 ),
                                               ),
                                             ),
                                             const Icon(Icons.navigate_next),
                                           ],
                                         ),
                                       ]))),
          ]))
    );

  }
}

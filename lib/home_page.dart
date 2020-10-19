import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_example/help_infor.dart';
import 'marketrate.dart';
import 'weatherforecast.dart';
import 'login.dart';
import 'diseableinfor.dart';
import 'finddinfor.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
//void main() => runApp(MyApp());

//class TutorialHome extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        debugShowCheckedModeBanner: false,
//        home: MyImagePicker()); // MyImagePicker()
//  }
//}
var kq;
var tukhoa;
Color color = Colors.white;
@override
class MyImagePicker extends StatefulWidget {

  MyImagePickerState createState() => MyImagePickerState();
}

@override
class MyImagePickerState extends State<MyImagePicker> {
  TextStyle style =
      TextStyle(fontFamily: 'Montserrat', fontSize: 18.0,color: Colors.black);

  File imageURI;
  String result;
  String path;

  bool bogai = false;
  bool chaybiala = false;
  bool daoon = false;
  bool domnau = false;
  bool khongbenh = false;
  bool vangla = false;
  Future toreturn() async {
    setState(() {
      imageURI = null;
      color = Colors.white;
    });
}
  Future changeColor() async {
    setState(() {
      color = Colors.black87;
    });
  }
  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      imageURI = image;
      path = image.path;
      if( imageURI != null){
        changeColor();
      }
      classifyImage();
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURI = image;
      path = image.path;
      if( imageURI != null){
        changeColor();
      }
      classifyImage();
    });
  }

  Future classifyImage() async {
    await Tflite.loadModel(
        model: "assets/model.tflite",
        labels: "assets/labels.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false);
    var output = await Tflite.runModelOnImage(
        path: path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 1,
        threshold: 0.2,
        asynch: true);
    setState(() {
      result = output
          .toString()
          .replaceAll(", ", "\n")
          .replaceAll("[{", "")
          .replaceAll("}]", "");
       bogai = result.contains("bogai");
       chaybiala = result.contains("chaybiala");
       daoon = result.contains("daoon");
       domnau = result.contains("domnau");
       khongbenh = result.contains("khongbenh");
       vangla = result.contains("vangla");
       if (bogai){
         kq = "Bọ gai";
       }
       else if (chaybiala){
         kq = "Bệnh cháy bìa lá";
       }
       else if(daoon){
         kq = "Bệnh đạo ôn";
       }
       else if(domnau){
         kq = "Bệnh đốm nâu";
       }
       else {
         kq = "Bệnh vàng lá";
       }
    });
    Tflite.close();
  }

  BoxDecoration myboxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1, //
        color: Colors.green[600], //                  <--- border width here
      ),
    );
  }

  @override
  Future navigateToDiseableInfor(context) async => Navigator.push(
      context, MaterialPageRoute(builder: (context) => MydiseaseInfor()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // TODO: implement build
//      resizeToAvoidBottomInset: false,imageURI == null
        backgroundColor: color,
        body: Center(
            child: imageURI == null
                ? SingleChildScrollView(
                    child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                            child: RaisedButton(
                              onPressed: () => getImageFromCamera(),
                              child: Icon(Icons.camera_enhance,
                                  color: Colors.white, size: 50.0),
//                    textColor: Colors.white,
                              color: Colors.green[600],
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: RaisedButton(
                              onPressed: () => getImageFromGallery(),
                              child: Icon(Icons.collections,
                                  color: Colors.white, size: 50.0),
//                    textColor: Colors.white,
                              color: Colors.green[600],
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            )),
                      ])
            )
                : Container(
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                          Image.file(imageURI,
                              width: 300, height: 200, fit: BoxFit.cover),
                          result == null
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                                  child: Text('Kết quả', style: style),
                                  color: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                )
                              : Container(
                                  margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                                  child: Text(result, style: style),
                                  color: Colors.grey,
                                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                ),
                          khongbenh == false
                            ? Container(
                              margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                              child: RaisedButton(
                                onPressed: () {
                                  navigateToDiseableInfor(context);
                                },
                                child: Text(
                                  'XEM THÔNG TIN VỀ BỆNH',
                                  style:TextStyle(fontFamily: 'Montserrat', fontSize: 18.0)
                                ),
                                textColor: Colors.white,
                                color: Colors.green[600],
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),

                                ),
                              ))
                              :Text("")
                        ]),
                      )
            ),
                    ),
        floatingActionButton: imageURI != null
            ? FloatingActionButton(
                backgroundColor: Colors.lightGreen,
                child: (IconButton(
                    icon: Icon(
                  Icons.control_point,
                  color: Colors.white,
                  size: 30.0,
                ))),
                tooltip: "Add",
                onPressed: (){
                  toreturn();
                }
              )
            : Text(""));
  }
}
//@override
//Future navigateToLogin(context) async => Navigator.push(
//    context, MaterialPageRoute(builder: (context) => login()));

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(child: MyBottomBarDemo()))); // MyImagePicker()
  }
}

class MyBottomBarDemo extends StatefulWidget {
  @override
  _MyBottomBarDemoState createState() => new _MyBottomBarDemoState();
}

class _MyBottomBarDemoState extends State<MyBottomBarDemo> {
  int _pageIndex = 0;
  PageController _pageController;
  List<DiseaseInfor> diseaseinfor = List();
  DiseaseInfor infor;
  DatabaseReference dbRef;


  List<Widget> tabPages1 = [
    MyImagePicker(),
    market_rate(),
    weather_forecast(),
    help_infor(),

  ];
  List<Widget> tabPages2 = [
    FindInfor(),
    FindInfor(),
    FindInfor(),
    FindInfor(),

  ];
  List<Widget> tabPages;
  final keyword = TextEditingController();
  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _pageIndex);
    tabPages = tabPages1;

  }

  @override
  void dispose() {
    _pageController.dispose();
    keyword.dispose();
    super.dispose();
  }

  @override
  Future navigateToLogin(context) async =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));

  @override
  Future navigateTofindInfor(){
    setState(() {
      tabPages = tabPages2;
  });
  }
  Future returnfromfindInfor(){
    setState(() {
      tabPages = tabPages1;
    });
  }

//  Future tapsearch(){
//    setState(() {
//      name = [];
//    });
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        leading: IconButton(
          icon: Icon(Icons.search),
          tooltip: "Navigation menu",
          onPressed: null,
        ),
        title: TextField(
          cursorColor: Colors.white,
          controller: keyword,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Nhập tên bệnh hại'),
          style: new TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: "Montserrat",
          ),
            onTap: ()=> {
            keyword.text = "",
              returnfromfindInfor()
            },
             onSubmitted: (String st){
             name = [];
             tukhoa = st;
             navigateTofindInfor();
            }
            ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () {
              navigateToLogin(context);
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
              icon: Icon(Icons.show_chart), title: Text("Giá")),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud_queue), title: Text("Thời tiết")),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), title: Text("Thông tin")),
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
      returnfromfindInfor();
      this._pageIndex = page;

    });
  }

  void onTabTapped(int index) {
    returnfromfindInfor();
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);

  }
}

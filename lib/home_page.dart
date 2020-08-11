import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_example/help_infor.dart';
import 'marketrate.dart';
import 'weatherforecast.dart';
//void main() => runApp(MyApp());

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: MyImagePicker())));    // MyImagePicker()
  }
}

class MyImagePicker extends StatefulWidget {
  @override
  MyImagePickerState createState() => MyImagePickerState();
}
//@override
//  Future navigateToMarketRate(context) async {
//  Navigator.push(
//      context, MaterialPageRoute(builder: (context) => market_rate()));
//}
//@override
//  Future navigateToWeatherForecast(context) async {
//  Navigator.push(
//      context, MaterialPageRoute(builder: (context) => weather_forecast()));
//}
//@override
//Future navigateToHelpInfor(context) async {
//  Navigator.push(
//      context, MaterialPageRoute(builder: (context) => help_infor()));
//}
@override
class MyImagePickerState extends State<MyImagePicker> {
  File imageURI;
  String result;
  String path;

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      imageURI = image;
      path = image.path;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURI = image;
      path = image.path;
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
      result = output.toString();
    });
    Tflite.close();
  }

  BoxDecoration myboxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1, //
        color:Colors.green[600], //                  <--- border width here
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.search),
          tooltip: "Navigation menu",
          onPressed: null,
        ),
        actions: <Widget>[
             IconButton(
                 icon: Icon(Icons.person, size: 30.0,color: Colors.white,),
                 onPressed: null,

          ),
        ],
        backgroundColor: Colors.green[600], //lightGreen[600],
//        leading: Container(
////        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
//            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
//            child: Image.asset("assets/images/Logo2.png")),

        title: TextField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Nhập tên bệnh hại'),
          style: new TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: "Merriweather",
          ),
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              imageURI == null
                  ? Text('Không có hình ảnh.')
                  : Image.file(imageURI,
                      width: 300, height: 200, fit: BoxFit.cover),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: RaisedButton(
                    onPressed: () => getImageFromCamera(),
                    child: Text('Chọn hình ảnh từ camera.'),
                    textColor: Colors.white,
                    color: Colors.green[600],
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: RaisedButton(
                    onPressed: () => getImageFromGallery(),
                    child: Text('Chọn hình ảnh từ bộ sưu tập.'),
                    textColor: Colors.white,
                    color: Colors.green[600],
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: RaisedButton(
                    onPressed: () {
                      classifyImage();
                    },
                    child: Text('NHẬN DIỆN'),
                    textColor: Colors.white,
                    color: Colors.green[600],
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  )),
              result == null ? Text('Kết quả') : Text(result)
            ]),
      ),
//      bottomNavigationBar: Container(
//          decoration: myboxDecoration(),
//          child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//
//                    IconButton(
//                        icon: Icon(
//                          Icons.home,
//                          color: Colors.green[600],
//                        ),
//                        color: Colors.green[600],
//                        tooltip: "home",
//                        iconSize: 40.0,
//                        onPressed: null),
//
//
//
//                IconButton(
//                    icon: Icon(
//                      Icons.show_chart,
//                      color: Colors.grey,
//                    ),
//                  //  color: Colors.green[600],
//                    tooltip: "Market Rate",
//                    iconSize: 40.0,
//                    onPressed: (){
//                      navigateToMarketRate(context);
//                    }),
//                IconButton(
//                    icon: Icon(
//                      Icons.wb_sunny,
//                      color: Colors.grey,
//                    ),
//                    color: Colors.green[600],
//                    tooltip: "Weather Forecast",
//                    iconSize: 40.0,
//                    onPressed: (){
//                      navigateToWeatherForecast(context);
//                    }),
//                IconButton(
//                    icon: Icon(
//                      Icons.info,
//                      color: Colors.grey,
//                    ),
//                    tooltip: "Infor",
//                    iconSize: 40.0,
//                    onPressed: (){
//                      navigateToHelpInfor(context);
//                    })
//      ]),
//
//        ),

    );

  }
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: MyBottomBarDemo())));    // MyImagePicker()
  }
}

class MyBottomBarDemo extends StatefulWidget {
  @override
  _MyBottomBarDemoState createState() => new _MyBottomBarDemoState();
}

class _MyBottomBarDemoState extends State<MyBottomBarDemo> {

  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    TutorialHome(),
    market_rate(),
    weather_forecast(),
    help_infor(),
  ];
  @override
  void initState(){
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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        //backgroundColor: Colors.green[600],
        iconSize: 25.0,
        selectedItemColor: Colors.green[600],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle (color: Colors.green[600]),
        unselectedLabelStyle: TextStyle (color: Colors.grey),
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem( icon: Icon(Icons.home), title: Text("Trang chủ")),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), title: Text("Giá")),
          BottomNavigationBarItem(icon: Icon(Icons.cloud_queue), title: Text("Thời tiết")),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), title: Text("Thông tin")),
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
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}



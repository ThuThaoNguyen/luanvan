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
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'admin/home_admin.dart';
class bogai {
  String key;
  String url;
  bogai(
      this.key,
      this.url,
      );
  bogai.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        url = snapshot.value['url'];

  toJson() {
    return {
      "url": url,
    };
  }
}
class chaybiala {
  String key;
  String url;
  chaybiala(
      this.key,
      this.url,
      );
  chaybiala.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        url = snapshot.value['url'];

  toJson() {
    return {
      "url": url,
    };
  }
}
class vangla {
  String key;
  String url;
  vangla(
      this.key,
      this.url,
      );
  vangla.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        url = snapshot.value['url'];

  toJson() {
    return {
      "url": url,
    };
  }
}
class daoon {
  String key;
  String url;
  daoon(
      this.key,
      this.url,
      );
  daoon.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        url = snapshot.value['url'];

  toJson() {
    return {
      "url": url,
    };
  }
}
class domnau {
  String key;
  String url;
  domnau(
      this.key,
      this.url,
      );
  domnau.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        url = snapshot.value['url'];

  toJson() {
    return {
      "url": url,
    };
  }
}
class khongbenh {
  String key;
  String url;
  khongbenh(
      this.key,
      this.url,
      );
  khongbenh.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        url = snapshot.value['url'];

  toJson() {
    return {
      "url": url,
    };
  }
}
List<bogai> bogai1 = List();
bogai anhbogai;
List<chaybiala> chaybiala1 = List();
chaybiala anhchaybiala;
List<daoon> daoon1 = List();
daoon anhdaoon;
List<vangla> vangla1 = List();
vangla anhvangla;
List<domnau> domanu1 = List();
domnau anhdomnau;
List<khongbenh> khongbenh1 = List();
khongbenh anhkhongbenh;
DatabaseReference bogaiRef;
DatabaseReference chaybialaRef;
DatabaseReference domnauRef;
DatabaseReference daoonRef;
DatabaseReference vanglaRef;
DatabaseReference khongbenhRef;
int countbogai ;
int countchaybiala ;
int countvangla  ;
int countdaoon ;
int countdomnau ;
int countkhongbenh;


class login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter login UI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class User{
  String key;
  String Ma_admin;

  String Email;
  String Mat_khau;
  String Ten_DN;
  User(this.Ma_admin, this.Email, this.Mat_khau, this.Ten_DN);
  User.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        Ma_admin = snapshot.value['Ma_admin'],

        Email = snapshot.value['Email'],
        Mat_khau = snapshot.value['Mat_khau'],
        Ten_DN = snapshot.value['Ten_DN'];
   toJson(){
      return {
      "Ma_admin": Ma_admin,

      "Email": Email,
      "Mat_khau": Mat_khau,
      "Ten_DN": Ten_DN
    };
  }
}
class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String username ;
  String password ;
  String error =" ";

  List<String> username_ar = List();
  List<String> password_ar = List();
  List<User> user = List();
  User infor;
  DatabaseReference dbRef;
  @override
  Future navigateToTuriolhomeAdmin(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Myadmin()));
  }

  @override
  void initState() {
    super.initState();
    infor = User( "", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    dbRef = database.reference().child("Admin");
    countbogai = 0;
    countchaybiala = 0;
    countvangla = 0;
    countdaoon = 0;
    countdomnau = 0 ;
    countkhongbenh = 0;
//    final FirebaseDatabase database = FirebaseDatabase(app: app);
    bogaiRef = database.reference().child("Hinh_anh").child('bogai');
    bogaiRef.once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((key, value) {
        countbogai = countbogai + 1;
      });
//      print(countbogai);
    });
    chaybialaRef = database.reference().child("Hinh_anh").child('chaybiala');
    chaybialaRef.once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((key, value) {
        countchaybiala = countchaybiala + 1;
      });
//      print(countchaybiala);
    });
    domnauRef = database.reference().child("Hinh_anh").child('domnau');
    domnauRef.once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((key, value) {
        countdomnau =  countdomnau + 1;
      });
//      print( countdomnau);
    });
    daoonRef = database.reference().child("Hinh_anh").child('daoon');
    daoonRef.once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((key, value) {
        countdaoon = countdaoon + 1;
      });
//      print(countdaoon);
    });
//    vanglaRef = database.reference().child("image").child("vangla");
//    vanglaRef.once().then((DataSnapshot snapshot) {
//      snapshot.value.forEach((key, value) {
//        countvangla = countvangla + 1;
//      });
//      print(countvangla);
//    });
    khongbenhRef = database.reference().child("Hinh_anh").child('khongbenh');
    khongbenhRef.once().then((DataSnapshot snapshot) {
//      print(snapshot.value);
      snapshot.value.forEach((key,value){
        countkhongbenh = countkhongbenh +1;
      });
//      print(countkhongbenh);
    });

    }

  void login(){
    setState(() {
      for (int i=0;i<username_ar.length;i++){
        if(username_ar[i]==username&&password_ar[i]==password){
          navigateToTuriolhomeAdmin(context);
//          tinh();
        }
        else error ="Tên đăng nhập hoặc mật khẩu không đúng" ;
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    final userField = TextField(
      obscureText: false,
      onTap: (){error = " ";},
      onChanged: (str){
        username = str;
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Tên đăng nhập",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      onTap: (){error = " ";},
      onChanged: (str){
        password = str;
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mật khẩu",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          login();
        },
        child: Text("Đăng nhập",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white,fontFamily: 'Montserrat')),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 60.0,
                  child: Image.asset(
                    "assets/images/LogoMakr_42xAgW.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                userField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
//                Text(error),
                Flexible(
                    child: FirebaseAnimatedList(
                        query: dbRef,
                        itemBuilder: (BuildContext context, DataSnapshot snapshot,
                            Animation<double> animation, int index) {
                          username_ar.add(snapshot.value['Ten_DN']);
                          password_ar.add(snapshot.value['Mat_khau']);
                          return Center(child: Text(error,style: TextStyle(color: Colors.red),));
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


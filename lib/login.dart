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
  String Id;
  String Id_type;
  String email;
  String password;
  String username;
  User(this.Id, this.Id_type, this.email, this.password, this.username);
  User.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        Id = snapshot.value['Id'],
        Id_type = snapshot.value['Id_type'],
        email = snapshot.value['email'],
        password = snapshot.value['password'],
        username = snapshot.value['username'];
   toJson(){
      return {
      "Id": Id,
      "Id_type": Id_type,
      "email": email,
      "password": password,
      "username": username
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
    infor = User("", "", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    dbRef = database.reference().child("user");
  }
  void login(){
    setState(() {
      for (int i=0;i<username_ar.length;i++){
        if(username_ar[i]==username&&password_ar[i]==password){
          navigateToTuriolhomeAdmin(context);
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
          hintText: "Username",
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
          hintText: "Password",
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
                color: Colors.white, fontWeight: FontWeight.bold)),
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
                          username_ar.add(snapshot.value['username']);
                          password_ar.add(snapshot.value['password']);
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


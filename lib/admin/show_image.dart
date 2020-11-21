import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tflite_example/admin/home_admin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

final FirebaseApp app = initializeApp(
    options: FirebaseOptions(
        googleAppID: "1:673866928334:android:448337214e83c7c60d409f",
        apiKey: 'AIzaSyBPbOP8LrXQoQ3PkIEr06wmcAk_aW4Pyqc',
        databaseURL: 'https://onrice-aac04.firebaseio.com'));

FirebaseApp initializeApp({FirebaseOptions options}) {}

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

class ShowImage extends StatefulWidget {
  @override
  Myshowimage createState() => new Myshowimage();
}

class Myshowimage extends State<ShowImage> {
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
  DatabaseReference Ref;
  bool havedata;
  void initState() {
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    Ref = database.reference().child("image").child(label);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//   final children = <Widget>[];
//   for(var i = 0; i< image.length; i++){
//     children.add(new Image.network(image[i],fit: BoxFit.cover));
//   }
//    var img = image.length != null
//        ? Image.network('',fit: BoxFit.cover)
//        :Text(error != null ? error :'Loading...');
    @override
    Future navigateToHomePage(context) async => Navigator.push(
        context, MaterialPageRoute(builder: (context) => Myadmin()));
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: "Navigation menu",
            onPressed: () {
              navigateToHomePage(context);
            },
          ),
          backgroundColor: Colors.green[600], //lightGreen[600],
          title: Container(
//            padding: EdgeInsets.fromLTRB(30, 0, 40, 0),
              child: label != null
                  ? Text(
                      label.toUpperCase(),
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        // fontStyle: FontStyle.italic,
                        fontFamily: "Merriweather",
                      ),
                    )
                  : Text(
                      "Không tìm thấy thông tin",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        // fontStyle: FontStyle.italic,
                        fontFamily: "Merriweather",
                      ),
                    )),

          centerTitle: true,
        ),
        body: Row(
                children: <Widget>[
                  Flexible(
                      child: FirebaseAnimatedList(
                          query: Ref,
                          itemBuilder: (BuildContext context,
                              DataSnapshot snapshot,
                              Animation<double> animation,
                              int index) {
                            return  Container(
                                child: Image.network(snapshot.value['url']),
                                height: 60.0,
                                width: 60.0);

                          }))
                ],
              )

           );
  }
}

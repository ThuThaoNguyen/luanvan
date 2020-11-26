import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'show_infordisease.dart';
import 'package:hexcolor/hexcolor.dart';
final FirebaseApp app = initializeApp(
    options: FirebaseOptions(
        googleAppID: "1:673866928334:android:448337214e83c7c60d409f",
        apiKey: 'AIzaSyBPbOP8LrXQoQ3PkIEr06wmcAk_aW4Pyqc',
        databaseURL: 'https://onrice-aac04.firebaseio.com'));

FirebaseApp initializeApp({FirebaseOptions options}) {}
class Disease {
  String key;
  String Id_DI;
  String Id_user;
  String expression;
  String image;
  String medicine;
  String name;
  String reason;
  String treatment;
  Disease(this.Id_DI, this.Id_user, this.expression, this.image,
      this.medicine, this.name, this.reason, this.treatment);
  Disease.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        Id_DI = snapshot.value['Id_DI'],
        Id_user = snapshot.value['Id_user'],
        expression = snapshot.value['expression'],
        image = snapshot.value['image'],
        medicine = snapshot.value['medicine'],
        name = snapshot.value['name'],
        reason = snapshot.value['reason'],
        treatment = snapshot.value['treatment'];
  toJson() {
    return {
      "Id_DI": Id_DI,
      "Id_user": Id_user,
      "expression": expression,
      "image": image,
      "medicine": medicine,
      "name": name,
      "reason": reason,
      "treatment": treatment
    };
  }
}
//class MyDiseaseInforAdmin extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        debugShowCheckedModeBanner: false,
//        home:  DiseaseInforAdmin()); // MyImagePicker()
//  }
//}

class MyDiseaseInforAdmin extends StatefulWidget {
  @override
  DiseaseInfor createState() => new DiseaseInfor();
}

class DiseaseInfor extends State<MyDiseaseInforAdmin> {

  List<Disease> diseaseinfor = List();
  Disease infor;
  DatabaseReference dbRef;
  @override
  void initState() {
    super.initState();
    infor = Disease("", "", "", "", "", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    dbRef = database.reference().child("diseaseInfor");
//    dbRef.once().then((DataSnapshot snapshot) {
//      print(snapshot.value);
//    });

  }
  void dispose(){
    super.dispose();
  }
//  bool show = false;
  String label;
  String key;
  final _formKey = GlobalKey<FormState>();
  String ten;
  Future navigateToShowInfor(context,String label) async =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyShowDiseaseInforAdmin(label: label)));
//  Future showcontent (String key, String name){
//    setState(() {
//      label = name;
//      print(label);
//      key = key;
//      show = true;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
//              show == false
//              ?
        Flexible(
                  child: FirebaseAnimatedList(
                      query: dbRef,
                      itemBuilder: (BuildContext context, DataSnapshot snapshot,
                          Animation<double> animation, int index) {
                        return  Center(
                            child: SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  child: RaisedButton(
                                    textColor: Colors.black87,
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    color: Colors.white,
                                    onPressed: () => {
                                    navigateToShowInfor(context,snapshot.value['name']),
//                                      label = snapshot.value['name'],
//                                      show = true
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                            child: new Image.asset(
                                              "assets/images/" +
                                                  snapshot.value["image"],
                                              fit: BoxFit.cover,
                                              width: 70.0,
                                              height: 70.0,
                                            )),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                            child: SizedBox(
                                              width: 200.0,
                                              child: Text(
                                                  snapshot.value["name"],
                                                  maxLines: 5,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                      fontFamily: 'Merriweather',
                                                      fontSize: 18.0)),
                                            )),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.green[600])),
                                  ),
                                ))
                        );
                      })
                   )
//                  :Form (
//                key:_formKey,
//                child:Flexible(
//                    child: FirebaseAnimatedList(
//                        query: dbRef,
//                        itemBuilder: (BuildContext context, DataSnapshot snapshot,
//                            Animation<double> animation, int index) {
//                          if ( snapshot.value['name'] == label) {
//                            return Center(
//                              child: SingleChildScrollView(
//                                  child: Column(
//                                    children: <Widget>[
//                                      Container(
//                                        child:  TextFormField(
//                                            validator:(value) {
//                                               if (value.isEmpty){
//                                                 return 'Vui lòng nhập';
//                                               }
//                                               else {ten = value;}
//                                            },
////                                            controller: ten,
//                                            initialValue: label ,
//                                            decoration: InputDecoration(
//                                                labelText: 'Tên',
////                                        errorText: 'Error message',
////                                border: OutlineInputBorder(),
//                                                suffixIcon: Icon(
//                                                  Icons.error,
//                                                )
//                                            )
//                                        ),
//                                      ),
//                                      Padding (
//                                        padding: const EdgeInsets.symmetric(vertical: 16.0),
//                                          child: RaisedButton(
//                                              onPressed:(){
//                                                final FormState form = _formKey.currentState;
//                                                if (form.validate()){
//                                                dbRef.child(snapshot.key).update({
//                                                  'name': ten
//                                                });
//                                                }
//                                                show = false;
//                                              },
//                                            child: Text('Lưu'),
//                                          ),
//                                      )
//
//                                    ],
//                                  )
//
//                              ) ,
//                            );
//                          }
//
//                        }
//                    )
//                ),
//              )
             ]
        )

    );
  }
}

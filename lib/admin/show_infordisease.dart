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
import 'home_admin.dart';
import 'package:hexcolor/hexcolor.dart';
import 'diseaseinfor_admin.dart';

class MyShowDiseaseInforAdmin extends StatefulWidget {
  final String label;
  const MyShowDiseaseInforAdmin({
    Key key,
    @required this.label,
  }) : super(key: key);

  @override
  ShowDiseaseInfor createState() => new ShowDiseaseInfor();
}

class ShowDiseaseInfor extends State< MyShowDiseaseInforAdmin > {
  List<Disease> diseaseinfor = List();
  Disease infor;
  DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    infor = Disease("", "", "", "", "", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    print(widget.label);
    dbRef = database.reference().child("Benh");
    dbRef.once().then((DataSnapshot snapshot) {
      print(snapshot.value);
    });

  }

//  Future navigateToInfor(context) async =>
//      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Myadmin()));
  String ten;
  String bieuhien;
  String nguyennhan;
  String phongtri;
  String thuoc;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: "Navigation menu",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Hexcolor('#313437'),//lightGreen[600],
          title: Container(
                  child: Text('OnRice',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: "Montserrat",
                    ),
              )
          ),
          centerTitle:true ,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
//          Text(havevalue.toString()),
          Form (
                key:_formKey,
                child:Flexible(
                    child: FirebaseAnimatedList(
                        query: dbRef,
                        itemBuilder: (BuildContext context, DataSnapshot snapshot,
                            Animation<double> animation, int index) {
//                          if ( snapshot.value['name'] ==  'bọ gai')  {
                            return
                              snapshot.value['Ten_benh'] ==  widget.label ?
                            Center(
                              child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child:  TextFormField(
                                            validator:(value) {
                                              if (value.isEmpty){
                                                return 'Vui lòng nhập';
                                              }
                                              else {ten = value;}
                                            },
//                                            controller: ten,
                                            initialValue: snapshot.value['Ten_benh'],
                                            decoration: InputDecoration(
                                                labelText: 'Tên',
//                                        errorText: 'Error message',
//                                border: OutlineInputBorder(),
                                                suffixIcon: Icon(
                                                  Icons.error,
                                                  color: Colors.green[600],
                                                )
                                            )
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child:  TextFormField(
                                            validator:(value) {
                                              if (value.isEmpty){
                                                return 'Vui lòng nhập';
                                              }
                                              else {bieuhien = value;}
                                            },
//                                            controller: ten,
                                            initialValue: snapshot.value['Bieu_hien'] ,
                                            decoration: InputDecoration(
                                                labelText: 'Biểu hiện',
//                                        errorText: 'Error message',
//                                border: OutlineInputBorder(),
                                                suffixIcon: Icon(
                                                  Icons.error,
                                                  color: Colors.green[600],
                                                )
                                            )
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child:  TextFormField(
                                            validator:(value) {
                                              if (value.isEmpty){
                                                return 'Vui lòng nhập';
                                              }
                                              else {nguyennhan = value;}
                                            },
//                                            controller: ten,
                                            initialValue: snapshot.value['Nguyen_nhan'] ,
                                            decoration: InputDecoration(
                                                labelText: 'Nguyên nhân',
//                                        errorText: 'Error message',
//                                border: OutlineInputBorder(),
                                                suffixIcon: Icon(
                                                  Icons.error,
                                                  color: Colors.green[600],
                                                )
                                            )
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child:  TextFormField(
                                            validator:(value) {
                                              if (value.isEmpty){
                                                return 'Vui lòng nhập';
                                              }
                                              else {phongtri = value;}
                                            },
//                                            controller: ten,
                                            initialValue: snapshot.value['Chua_tri'] ,
                                            decoration: InputDecoration(
                                                labelText: 'Cách phòng trị',
//                                        errorText: 'Error message',
//                                border: OutlineInputBorder(),
                                                suffixIcon: Icon(
                                                  Icons.error,
                                                  color: Colors.green[600],
                                                )
                                            )
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child:  TextFormField(
                                            validator:(value) {
                                              if (value.isEmpty){
                                                return 'Vui lòng nhập';
                                              }
                                              else {thuoc = value;}
                                            },
//                                            controller: ten,
                                            initialValue: snapshot.value['Thuoc'] ,
                                            decoration: InputDecoration(
                                                labelText: 'Thuốc trị',
//                                        errorText: 'Error message',
//                                border: OutlineInputBorder(),
                                                suffixIcon: Icon(
                                                  Icons.error,
                                                  color: Colors.green[600],
                                                )
                                            )
                                        ),
                                      ),
                                      Padding (
                                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                                        child: RaisedButton(
                                          color: Colors.green[600],
                                          onPressed:(){
                                            final FormState form = _formKey.currentState;
                                            if (form.validate()){
                                              dbRef.child(snapshot.key).update({
                                                'Ten_benh': ten,
                                                'Bieu_hien':bieuhien,
                                                'Nguyen_nhan':nguyennhan,
                                                'Chua_tri':phongtri,
                                                'Thuoc':thuoc
                                              });

                                              Navigator.pop(context);

                                            }
                                          },
                                          child: Text('Lưu',
                                            style: new TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Montserrat",
                                            ),
                                          ),
                                        ),
                                      )

                                    ],
                                  )

                              ) ,
                            )
                                :Text('');


//                          }
//
                        }
                    )
                ),
              )
            ]
        )

    );
  }
  void dispose(){
    super.dispose();
  }
}

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
import 'add_marketadmin.dart';
import 'package:hexcolor/hexcolor.dart';

final FirebaseApp app = initializeApp(
    options: FirebaseOptions(
        googleAppID: "1:673866928334:android:448337214e83c7c60d409f",
        apiKey: 'AIzaSyBPbOP8LrXQoQ3PkIEr06wmcAk_aW4Pyqc',
        databaseURL: 'https://onrice-aac04.firebaseio.com'));

FirebaseApp initializeApp({FirebaseOptions options}) {}

class MarketRate {
  String key;
//  String Id;
  String Ma_admin;
  String Ten_NS;
  String Gia;
//  String date;
//  String location;
  MarketRate(
//      this.Id,
      this.Ma_admin,
      this.Ten_NS,
      this.Gia,
//      this.date,
//      this.location,
      );
  MarketRate.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
//        Id = snapshot.value['Id'],
        Ma_admin = snapshot.value['Ma_admin'],
        Ten_NS = snapshot.value['Ten_NS'],
        Gia = snapshot.value['Gia'];
//        date = snapshot.value['date'],
//        location = snapshot.value['location'];
  toJson() {
    return {
//      "Id": Id,
      "Ma_admin": Ma_admin,
      "Ten_NS": Ten_NS,
      "Gia": Gia,
//      "date": date,
//      "location": location,
    };
  }
}

class MyMarketRateAdmin extends StatefulWidget {
  @override
  MarketRateAdmin createState() => new MarketRateAdmin();
}

class MarketRateAdmin extends State<MyMarketRateAdmin> {
  List<MarketRate> market_rate = List();
  MarketRate rate;
  DatabaseReference rateRef;
  String product;
  String price;
  @override
  void initState() {
    super.initState();
    rate = MarketRate("", "", "");
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    rateRef = database.reference().child("Gia_NS");
    rateRef.once().then((DataSnapshot snapshot) {
      print(snapshot.value);
    });
//    print(date);
  }
  BoxDecoration myboxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1, //
        color: Colors.grey,
        //                  <--- border width here
      ),
      borderRadius: new BorderRadius.circular(
          4.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
          child: Column(children: <Widget>[
//         Product.length == 0 ? dynamicTextField : result,
//         Product.length == 0 ? submitButton : new Container(),
//          child: ListBody(children: <Widget>[
            Flexible(
                child: FirebaseAnimatedList(
                    query: rateRef,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.54,
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: new TextFormField(
//                            controller: snapshot.value['name'],
                            validator: (value){
                              if(value.isEmpty){
                                return 'Vui lòng nhập giá trị';
                              }
//                              else { product = value;}
                            },
                              onChanged:(value){
                                rateRef.child(snapshot.key).update({
                                  'Ten_NS': value
                                });
                              } ,
                             initialValue: snapshot.value['Ten_NS'],
                              decoration: const InputDecoration(
                                  labelText: 'Tên sản phẩm',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: new TextFormField(
//                             controller: snapshot.value['price'],
                              validator: (value){
                                if(value.isEmpty){
                                  return 'Vui lòng nhập giá trị';
                                }
//                                else { price = value;}
                              },
                              onChanged:(value){
                                rateRef.child(snapshot.key).update({
                                  'Gia': value
                                });
                              } ,
                              initialValue: snapshot.value['Gia'].toString(),
                              decoration: const InputDecoration(
                                  labelText: 'Giá',
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0.0,7.5,0,0.0),
                            width: MediaQuery.of(context).size.width * 0.15,
                            height:59.0,
//                            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: RaisedButton(

                               color:Colors.white,
                               onPressed:(){
                                     rateRef.child(snapshot.key).remove();
                                },
                               child:Icon(Icons.cancel),
                            ),

                            decoration: myboxDecoration(),)
                        ],
                      );
                    }))
          ]),
//       ]
//       ),
        ),
        floatingActionButton: new FloatingActionButton(
            backgroundColor: Colors.green[600],
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyAddMarketAdmin()));
            },
            child: new Icon(
              Icons.add,
            )));
  }
}


import 'package:flutter/material.dart';

class FindInfor extends StatefulWidget {
  @override
  finddesease createState() => finddesease();
}

@override
class finddesease extends State<FindInfor> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: RaisedButton(
            textColor: Colors.black87,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            color: Colors.white,
            onPressed: ()=>{},
            child: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: new Image.asset(
                      "assets/images/daoon.jpg",
                      fit: BoxFit.cover,
                      width: 70.0,
                      height: 70.0,
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: SizedBox(
                      width: 240.0,
                      child: Text(
                          'La benh gi do khong biet nhung neu khong xu ly som se de lai hau qua nghiem trong lam lua chet',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                              fontFamily: 'Merriweather', fontSize: 18.0)),
                    ))
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.green[600])),
          ),
        )
      ]))),
    );
  }
}

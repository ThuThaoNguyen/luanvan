import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:tflite_example/home_page.dart';
import 'marketrate.dart';
import 'weatherforecast.dart';
import 'help_infor.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:flutter/services.dart';

String local;

class Weather extends StatelessWidget {
  @override
  final WeatherData weather;

  Weather({Key key, @required this.weather}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(weather.name, style: new TextStyle(color: Colors.white)),
        Text(weather.main,
            style: new TextStyle(color: Colors.white, fontSize: 32.0)),
        Text('${weather.temp.toString()}°C',
            style: new TextStyle(color: Colors.white)),
        Image.network('https://openweathermap.org/img/w/${weather.icon}.png'),
        Text(new DateFormat.yMd().format(weather.date),
            style: new TextStyle(color: Colors.white)),
        Text(new DateFormat.Hm().format(weather.date),
            style: new TextStyle(color: Colors.white)),
      ],
    );
  }
}

class WeatherItem extends StatelessWidget {
  @override
  final WeatherData weather;

  WeatherItem({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(weather.name, style: new TextStyle(color: Colors.black)),
            Text(weather.main,
                style: new TextStyle(color: Colors.black, fontSize: 24.0)),
            Text('${weather.temp.toString()}°C',
                style: new TextStyle(color: Colors.black)),
            Image.network(
                'https://openweathermap.org/img/w/${weather.icon}.png'),
            Text(new DateFormat.yMd().format(weather.date),
                style: new TextStyle(color: Colors.black)),
            Text(new DateFormat.Hm().format(weather.date),
                style: new TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}

class WeatherData {

  final String name;
  final double temp;
  final String main;
  final String icon;
  final DateTime date;

  WeatherData({this.date, this.name, this.temp, this.main, this.icon});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
          isUtc: false),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      main: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}

class ForecastData {
  final List list;

  ForecastData({this.list});

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    List list = new List();

    for (dynamic e in json['list']) {
      WeatherData w = new WeatherData(
          date: new DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000,isUtc: false),
          name: json['city']['name'],
          temp: e['main']['temp'].toDouble(),
          main: e['weather'][0]['description'],
          icon: e['weather'][0]['icon']);
      list.add(w);
    }

    return ForecastData(
      list: list,
    );
  }
}

class weather_forecast extends StatefulWidget {
  @override
  MyWeatherState createState() => MyWeatherState();
}

class MyWeatherState extends State<weather_forecast> {
  bool isLoading = false;
  WeatherData weatherData;
  ForecastData forecastData;
//  Location _location = new Location();
  String error;

  BoxDecoration myboxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1, //
        color: Colors.green[600], //                  <--- border width here
      ),
    );
  }

//  @override
//  Future navigateToMarketRate(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => market_rate()));
//  }
//
//  Future navigateToHome(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => TutorialHome()));
//  }
//
//  @override
//  Future navigateToHelpInfor(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => help_infor()));
//  }
  List _cities = [
    'Can Tho',
    'An Giang',
    'Vung Tau',
    'Bac Giang',
    'Bac Kan',
    'Bac Lieu',
    'Bac Ninh',
    'Ben Tre',
    'Binh Dinh',
    'Binh Duong',
    'Binh Phuoc',
    'Binh Thuan',
    'Ca Mau',

    'Cao Bang',
    'Da Nang',
    'Dak Lak',
    'Dak Nong',
    'Dien Bien',
    'Dong Nai',
    'Dong Thap',
    'Gia Lai',
    'Ha Giang',
    'Ha Nam',
    'Ha Noi',
    'Ha Tinh',
    'Hai Duong',
    'Hai Phong',
    'Hau Giang',
    'Ho Chi Minh',
    'Hoa Binh',
    'Hung Yen',
    'Khanh Hoa',
    'Kien Giang',
    'Kon Tum',
    'Lai Chau',
    'Lam Dong',
    'Lang Son',
    'Lao Cai',
    'Long An',
    'Nam Dinh',
    'Nghe An',
    'Ninh Binh',
    'Ninh Thuan',
    'Phu Tho',
    'Phu Yen',
    'Quang Binh',
    'Quang Nam',
    'Quang Ngai',
    'Quang Ninh',
    'Quang Tri',
    'Soc Trang',
    'Son La',
    'Tay Ninh',
    'Thai Binh',
    'Thai Nguyen',
    'Thanh Hoa',
    'Thua Thien Hue',
    'Tien Giang',
    'Tra Vinh',
    'Tuyen Quang',
    'Vinh Long',
    'Vinh Phuc',
    'Yen Bai',
  ];
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  @override
  void initState() {

    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    local = _dropDownMenuItems[0].value;
    loadWeather();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
            child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                       Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                        new Text("Chọn thành phố: "),
                        new Container(
                          padding: new EdgeInsets.all(16.0),
                       ),
                        new DropdownButton(
                          value: local,
                          items: _dropDownMenuItems,
                          onChanged: changedDropDownItem,
                           ),
                         ]),
//                       Expanded(
//                         child:
                         Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: weatherData != null
                               ? Weather(weather: weatherData)
                               : Container(),
                          ),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: isLoading
                       ? CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor: new AlwaysStoppedAnimation(Colors.white),
                        )
                      : IconButton(
                          icon: new Icon(Icons.refresh),
                          tooltip: 'Refresh',
                          onPressed: loadWeather,
                          color: Colors.white,
                        ),
                ),
              ],
            ),
//          ),
                        SafeArea(
                          child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                            height: 200.0,
                              child: forecastData != null
                              ? ListView.builder(
                              itemCount: forecastData.list.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => WeatherItem(
                            weather: forecastData.list.elementAt(index)))
                        : Container(),
              ),
            ),
          )
        ]
                    )
            )
        )
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      local = selectedCity;
      loadWeather();
    });
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

//    Map<String, double> location;
//
//    try {
//      location = (await _location.getLocation) as Map<String, double>;
//
//      error = null;
//    } on PlatformException catch (e) {
//      if (e.code == 'PERMISSION_DENIED') {
//        error = 'Permission denied';
//      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
//        error = 'Permission denied - please ask the user to enable it from the app settings';
//      }
//
//      location = null;
//    }
//
//    if (location != null) {
//      final lat = location['latitude'];
//      final lon = location['longitude'];

//    final weatherResponse = await http.get(
//        'https://api.openweathermap.org/data/2.5/weather?APPID=eeacd6be3853434ce9b93247200b142f&lat=${lat
//            .toString()}&lon=${lon.toString()}');
//    final forecastResponse = await http.get(
//        'https://api.openweathermap.org/data/2.5/forecast?APPID=eeacd6be3853434ce9b93247200b142f&lat=${lat
//            .toString()}&lon=${lon.toString()}');
    final weatherResponse = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=${local.toString()}&APPID=eeacd6be3853434ce9b93247200b142f&lang=vi&units=metric');
    final forecastResponse = await http.get(
        'http://api.openweathermap.org/data/2.5/forecast?q=${local.toString()}&APPID=eeacd6be3853434ce9b93247200b142f&lang=vi&units=metric');
    if (weatherResponse.statusCode == 200 &&
        forecastResponse.statusCode == 200) {
      return setState(() {
        weatherData =
            new WeatherData.fromJson(jsonDecode(weatherResponse.body));
        forecastData =
            new ForecastData.fromJson(jsonDecode(forecastResponse.body));
        isLoading = false;
      });
    }


  }
  void dispose(){
    super.dispose();
  }
}
//}

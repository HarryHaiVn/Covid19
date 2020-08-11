import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_covid19/src/ui/home/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff008e7b),
      statusBarIconBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'googleSans'),
      home: Home(),
    );
  }
}

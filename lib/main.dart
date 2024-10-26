import 'package:flutter/material.dart';
import 'package:untitled1/homePage.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}
class MyAppState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
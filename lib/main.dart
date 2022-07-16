import 'package:flutter/material.dart';
import 'package:login_app/screens/pending.dart';
import './screens/menupage.dart';
import 'screens/requestpage.dart';
import './screens/pending.dart';
import './screens/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      title: "Login App",
      home: LoginApp(),
      routes: {
        '/second': (context) => Menupage(),
        '/third': (context) => RequestScreen(),
        //'/fourth': (context) => DateTimePicker(),
      },
    );
  }
}

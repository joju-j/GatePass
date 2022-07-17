import 'package:flutter/material.dart';
import 'screens/student/menupage.dart';
import 'screens/student/requestpage.dart';
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
      initialRoute: 'home',
      routes: {
        'home': (context) => Menupage(),
        'req': (context) => RequestScreen(),
        //'/fourth': (context) => DateTimePicker(),
      },
    );
  }
}

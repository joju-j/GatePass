import 'package:flutter/material.dart';
import 'package:login_app/routes/app.routes.dart';
import 'package:login_app/screens/student/menupage.dart';
import 'package:login_app/screens/student/requestpage.dart';
import 'package:provider/provider.dart';
import './app.provider.dart';
import './routes/app.routes.dart';
import './screens/loginpage.dart';
import './routes/meta/views/authentication/login.view.dart';
import 'package:login_app/core%20notifier/authentication.notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Core());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: Lava(),providers: AppProviders.providers);
  }
}
class Lava extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.LoginRoute,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
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
      home: LoginView(),//LoginApp(),
      routes: {
        '/second': (context) => Menupage(),
        '/third': (context) => RequestScreen(),
        //'/fourth': (context) => DateTimePicker(),
      },
    );
  }
}

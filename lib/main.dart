import 'package:flutter/material.dart';
import 'package:login_app/supabase/app.routes.dart';
import 'package:provider/provider.dart';
import 'supabase/app.provider.dart';
import './screens/loginpage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(child: Lava(), providers: AppProviders.providers);
  }
}

class Lava extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WayOut App",
      initialRoute: AppRoutes.LoginRoute,
      home: Loginpage(),
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
    );
  }
}



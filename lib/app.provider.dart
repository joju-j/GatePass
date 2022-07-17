//import 'package:flutter/cupertino.dart';
import 'package:login_app/core%20notifier/authentication.notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders{
  static List<SingleChildWidget> providers=[
    ChangeNotifierProvider(create:(_) => AuthenticationNotifier())
  ];
} 
import 'package:login_app/screens/loginpage.dart';


class AppRoutes{
    static const String LoginRoute='/login';
    static final routes = {
      LoginRoute:(context) => Loginpage()
      };
}
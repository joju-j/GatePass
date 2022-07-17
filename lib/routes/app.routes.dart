import 'package:login_app/routes/meta/views/authentication/login.view.dart';

class AppRoutes{
    static const String LoginRoute='/login';
    static final routes = {
      LoginRoute:(context) => LoginView()
      };
}
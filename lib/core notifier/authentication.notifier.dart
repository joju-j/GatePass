import 'package:flutter/material.dart';
import 'package:login_app/services/authentication.service.dart';

class AuthenticationNotifier extends ChangeNotifier{
  
  final AuthenticationService _authenticationService=new AuthenticationService();
  
  Future<String?> login({
    required String id,
    required String password,
  }) async {
    try{
      final response = await _authenticationService.login(id: id, password: password);
      print(response);
    }catch (e){
      print(e);
    }
  }
}
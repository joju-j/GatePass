import 'package:supabase/supabase.dart';

import 'supabase.credentials.dart';

class AuthenticationService {
  Future<String?> login({
    required String id,
    required String password,
  }) async {
    GotrueSessionResponse response =
        await SupabaseCredentials.supabaseClient.auth.signIn(
            email: id,
            password: password,
            options: AuthOptions(redirectTo: SupabaseCredentials.APIURL));

    if (response.error == null) {
      String? id = response.data!.user!.id;
      print("Login Successful: $id");
    } else {
      print("Id or password is invalid : ${response.error!.message}");
    }
  }
}

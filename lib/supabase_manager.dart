import 'package:supabase/supabase.dart' show SupabaseClient;

const supabaseUrl = 'https://chlpyifvyvkixuuhkkpj.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNobHB5aWZ2eXZraXh1dWhra3BqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTcwNDEyMDMsImV4cCI6MTk3MjYxNzIwM30.dbz43gbee00Gz88cRi_V8u7eh2U6Z6-5HJ-uiS95Guw';

class SupabaseManager {
  final client = SupabaseClient(supabaseUrl, supabaseKey);
  void signUpUser(String email, String password) async {
    await client.auth.signUp(email, password);
  }
}

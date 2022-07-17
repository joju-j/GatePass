
import 'package:supabase/supabase.dart';

class SupabaseCredentials{
  static const String APIKEY='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpseWdkaHRiam5sZ3JvaGllc2RrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTc5NzA3NzQsImV4cCI6MTk3MzU0Njc3NH0.w6Z_zty4oqdjqQCxMM3p8ATuqLn1alBrOSbA-En3sX8';
  static const String APIURL='https://jlygdhtbjnlgrohiesdk.supabase.co';

  static SupabaseClient supabaseClient =SupabaseClient(APIURL,APIKEY);
}
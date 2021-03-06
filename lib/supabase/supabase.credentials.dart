import 'package:intl/intl.dart';
import 'package:supabase/supabase.dart';

class SupabaseCredentials {
  static const String APIKEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNobHB5aWZ2eXZraXh1dWhra3BqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTcwNDEyMDMsImV4cCI6MTk3MjYxNzIwM30.dbz43gbee00Gz88cRi_V8u7eh2U6Z6-5HJ-uiS95Guw';
  static const String APIURL = 'https://chlpyifvyvkixuuhkkpj.supabase.co';

  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);

  static getData(String admissno, String password) async {
    var response2 = await supabaseClient
        .from('LoginTable')
        .select(('id,name,semester,dept,batch,grpadv'))
        .match({'id': admissno, 'pass': password}).execute();

    print('response2.error: ${response2.error}');
    print('ID,Name,Sem,Dept,Batch: ${response2.data}');
    return response2.data;
  }

  static getAdmin(String idd, String password) async {
    var response3 = await supabaseClient
        .from('GrpAdvisorTable')
        .select(('name,dept'))
        .match({'id': idd, 'passw': password}).execute();

    print('response2.error: ${response3.error}');
    print('Grp Advisor,Dept: ${response3.data}');
    return response3.data;
  }

  static request(var values, String reason, DateTime timeset) async {
    String formatteddate = DateFormat.jms().format(timeset);
    print(formatteddate);
    print(reason);

    final res = await supabaseClient.from('RequestTable').insert([
      {
        'id': values[0]['id'],
        'name': values[0]['name'],
        'dept': values[0]['dept'],
        'sem': values[0]['semester'],
        'batch': values[0]['batch'],
        'grpadv': values[0]['grpadv'],
        'reason': reason,
        'exit_time': formatteddate
      }
    ]).execute();
    print(res.error);
  }

  static pendingstatus(var values) async {
    var response5 = await supabaseClient
        .from('RequestTable')
        .select(('permission,qrcode,exit_time,reason'))
        .match({'id': values[0]['id']})
        .order('request_id', ascending: false)
        .execute();

    print('response2.error: ${response5.error}');
    return response5.data;
  }

  static allrequests(var grpadvval) async {
    var allres = await supabaseClient
        .from('RequestTable')
        .select()
        .match({'grpadv': grpadvval[0]['name']}).execute();
    print('select error: ${allres.error}');
    return allres.data;
  }
  // static printpending(var values) async {
  //   var response3 = await supabaseClient
  //       .from('GrpAdvisorTable')
  //       .select(('name,dept'))
  //       .match({'id': idd, 'passw': password}).execute();

  //   print('response2.error: ${response3.error}');
  //   print('Grp Advisor,Dept: ${response3.data}');
  //   return response3.data;
  // }

  static addData() async {
    await supabaseClient.from('LoginTable').insert([
      {'id': '8008', 'name': 'ajaja'}
    ]).execute();
  }
}

//https://jlygdhtbjnlgrohiesdk.supabase.co
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpseWdkaHRiam5sZ3JvaGllc2RrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTc5NzA3NzQsImV4cCI6MTk3MzU0Njc3NH0.w6Z_zty4oqdjqQCxMM3p8ATuqLn1alBrOSbA-En3sX8
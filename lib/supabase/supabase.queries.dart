import 'dart:math';
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

    print('Login error: ${response2.error}');
    print('ID,Name,Sem,Dept,Batch: ${response2.data}');
    return response2.data;
  }

  static getAdmin(String idd, String password) async {
    var response3 = await supabaseClient
        .from('GrpAdvisorTable')
        .select(('name,dept'))
        .match({'id': idd, 'passw': password}).execute();

    print('Grp adv login error: ${response3.error}');
    print('Grp Advisor,Dept: ${response3.data}');
    return response3.data;
  }

  static request(var values, String reason, DateTime timeset) async {
    String formatteddate = DateFormat.jms().format(timeset);
    print(formatteddate);
    print(reason);
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String currentdate = formatter.format(now);
    print(currentdate);

    final res = await supabaseClient.from('RequestTable').insert([
      {
        'id': values[0]['id'],
        'name': values[0]['name'],
        'dept': values[0]['dept'],
        'sem': values[0]['semester'],
        'batch': values[0]['batch'],
        'grpadv': values[0]['grpadv'],
        'reason': reason,
        'created_at': currentdate,
        'exit_time': formatteddate
      }
    ]).execute();
    var delerror = await supabaseClient
        .from('RequestTable')
        .delete()
        .match({'id': values[0]['id']})
        .lt('request_id', res.data[0]['request_id'])
        .execute();

    print('request delete error:${delerror.error}');
    print('request insert data:${res.data}');
  }

  static pendingstatus(var values) async {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String currentdate = formatter.format(now);
    var delerror = await supabaseClient
        .from('RequestTable')
        .delete()
        .not('created_at', 'eq', currentdate)
        .execute();
    print(delerror.error);
    var response5 = await supabaseClient
        .from('RequestTable')
        .select(('permission,qrcode,exit_time,reason'))
        .match({'id': values[0]['id']})
        .order('request_id', ascending: false)
        .execute();

    print('pending data error: ${response5.error}');
    return response5.data;
  }

  static allrequests(var grpadvval) async {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String currentdate = formatter.format(now);
    var delerror = await supabaseClient
        .from('RequestTable')
        .delete()
        .match({'grpadv': grpadvval[0]['name']})
        .not('created_at', 'eq', currentdate)
        .execute();
    print('duplicate error: ${delerror.error}');

    var allres = await supabaseClient
        .from('RequestTable')
        .select()
        .match({'grpadv': grpadvval[0]['name']})
        .is_('permission', null)
        .execute();

    print('select all data: ${allres.data}');
    print('select all error: ${allres.error}');
    return allres.data;
  }

  static denyreq(var values) async {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String currentdate = formatter.format(now);
    var deny = await supabaseClient
        .from('RequestTable')
        .update({'permission': false}).match(
            {'request_id': values['request_id']}).execute();
    print(deny.error);
    var inserror = await supabaseClient.from('HistoryTable').insert([
      {
        'id': '${values['id']}',
        'req_id': '${values['request_id']}',
        'name': '${values['name']}',
        'dept': '${values['dept']}',
        'sem': '${values['sem']}',
        'batch': '${values['batch']}',
        'exit_time': '${values['exit_time']}',
        'permission': false,
        'grpadv': '${values['grpadv']}',
        'note': "Student has been denied",
        'created': currentdate,
        'reason': '${values['reason']}'
      }
    ]).execute();
    print("Insert error for deny: ${inserror.error}");
    print("Insert data for deny: ${inserror.data}");
    await supabaseClient
        .from('RequestTable')
        .delete()
        .match({'request_id': values['request_id']}).execute();
  }

  static acceptreq(var values) async {
    print(values['id']);
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String currentdate = formatter.format(now);
    String newqrcode = values['id'].toString() + getRandomString(5);
    var acc = await supabaseClient
        .from('RequestTable')
        .update({'permission': true, 'qrcode': newqrcode}).match(
            {'request_id': values['request_id']}).execute();
    final res = await supabaseClient.from('HistoryTable').insert([
      {
        'id': '${values['id']}',
        'req_id': '${values['request_id']}',
        'name': '${values['name']}',
        'dept': '${values['dept']}',
        'sem': '${values['sem']}',
        'batch': '${values['batch']}',
        'exit_time': '${values['exit_time']}',
        'permission': true,
        'grpadv': '${values['grpadv']}',
        'qrcode': newqrcode,
        'note': "Student has not yet left.",
        'created': currentdate,
        'reason': '${values['reason']}'
      }
    ]).execute();
    print(res.error);
    print(acc.error);
  }

  static allqr(String value) async {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String currentdate = formatter.format(now);
    var delerror = await supabaseClient
        .from('RequestTable')
        .delete()
        .not('created_at', 'eq', currentdate)
        .execute();
    var qr = await supabaseClient
        .from('RequestTable')
        .select()
        .match({'qrcode': value}).execute();
    print('student details:${qr.data}');
    return qr.data;
  }

  static deleterow1(var value) async {
    //print(value.data);
    var acc = await supabaseClient
        .from('HistoryTable')
        .update({'note': 'Student has left'}).match(
            {'req_id': value[0]['request_id']}).execute();
    // print('new history table:${acc.data}');
    print('history error: ${acc.error}');
    // print('history data: ${acc.data}');
    await supabaseClient
        .from('RequestTable')
        .delete()
        .match({'request_id': value[0]['request_id']}).execute();
  }

  static showhistory() async {
    var his = await supabaseClient.from('HistoryTable').select().execute();
    print('show history error :${his.error}');
    print('show history data :${his.data}');
    return his.data;
  }

  static addData() async {
    await supabaseClient.from('LoginTable').insert([
      {'id': '8008', 'name': 'ajaja'}
    ]).execute();
  }
}

// void main() {
//   print(getRandomString(5));  // 5GKjb
//   print(getRandomString(10)); // LZrJOTBNGA
//   print(getRandomString(15)); // PqokAO1BQBHyJVK
// }

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

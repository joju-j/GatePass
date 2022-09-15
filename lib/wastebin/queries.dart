// import 'dart:convert';
// import 'dart:io';
// import 'dart:async';
// import 'package:flutter/cupertino.dart';

// import 'supabase.credentials.dart';


// class IndexProvider extends ChangeNotifier {
//   Future<void> getTodos() async {
//     var data = await SupabaseCredentials.supabaseClient.from('LoginTable').select().execute();
//     print(data.data);
//   }

//   Future<void> addTodo() async {
//     var response = await SupabaseCredentials.supabaseClient.from('todos').insert([
//       {'text': 'adding another content', 'user_id': '1'}
//     ]).execute();
//     print(response.data);
//   }

//   // just test for one to many example and it is own
//   Future<void> getTodoChild() async {
//     var data =
//         await supabase.from('todos').select('*, todo_child(*)').execute();
//     print(jsonEncode(data.data));
//   }

//   Future<void> updateTodo() async {
//     var response = await supabase
//         .from('todos')
//         .update({'text': 'from phone now', 'user_id': '1'})
//         .eq('id', 2)
//         .execute();
//     print(response.data);
//   }

//   Future<void> deleteTodo() async {
//     var response = await supabase.from('todos').delete().eq('id', 3).execute();
//     print(response.data);
//   }

//   Future<void> login() async {
//     var responsive =
//         await supabase.auth.signIn(email: EMAIL.trim(), password: 'zaiditit');
//     print(responsive.data?.user?.id);
//     print(responsive.data?.user?.email);
//     if (responsive.error != null) {
//       print(responsive.error?.message);
//     }
//   }

//   Future<void> register() async {
//     print('called sign up');
//     var responsive =
//         await supabase.auth.signUp(EMAIL.trim(), 'zaiditit'.trim());
//     print(responsive.data?.user?.id);
//     print(responsive.data?.user?.email);
//     if (responsive.error != null) {
//       print(responsive.error?.message);
//     }
//   }

//   Future<void> logout() async {
//     var responsive = await supabase.auth.signOut();
//     print(responsive.rawData);
//   }

//   void currentUser() {
//     print(supabase.auth.currentUser?.id);
//     print(supabase.auth.currentSession?.accessToken);
//   }

//   Future<String?> uploadImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
//     if (photo != null) {
//       File file = new File(photo.path);
//       var response =
//           await supabase.storage.from('avatars').upload('zaid', file);
//       print(response.error?.message);
//       print('first');
//       print(response.data);
//       print('second');
//       if (response.data != null) {
//         return response.data;
//       } else {
//         return '';
//       }
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:login_app/main.dart';
import 'package:login_app/screens/qrcode/scan.dart';
import 'package:login_app/screens/qrcode/scan2.dart';
import 'package:login_app/supabase/supabase.credentials.dart';
import 'package:provider/provider.dart';
import '../supabase/authentication.notifier.dart';
import '../supabase/supabase.credentials.dart';
import 'hod/hodhome.dart';
import 'student/menupage.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  void click() {}
  TextEditingController _id = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  void initState() {
    _id = TextEditingController();
    pass = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);

    void errorbox(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('User does not exist'),
                content: const Text('Please Enter A Valid User ID'),
                actions: [
                  // The "Yes" button
                  TextButton(
                      onPressed: () {
                        // Remove the box
                        Navigator.of(context).pop();
                      },
                      child: const Text('Okay')),
                ],
              ));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromRGBO(224, 101, 88, 1.0),
                Color.fromARGB(255, 243, 243, 242),
                Colors.blue,
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 200,
                width: 300,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 325,
                height: 420,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      "WayOut App",
                      style: TextStyle(
                        fontSize: 28,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Calistoga',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Please Login to Your Account",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontFamily: 'Chilanka',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 260,
                      height: 60,
                      child: TextField(
                        controller: _id,
                        decoration: InputDecoration(
                            labelText: "Username",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 260,
                      height: 60,
                      child: TextField(
                        controller: pass,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, top: 0, bottom: 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        primary: Color.fromARGB(255, 122, 30, 172),
                        shadowColor: Colors.black,
                        elevation: 10,
                      ),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        if (_id.text.isNotEmpty && pass.text.isNotEmpty) {
                          if (_id.text == '1000') {
                            String emailid = 'hod@gmail.com';
                            String password = 'example-hod';

                            await authenticationNotifier.login(
                                id: emailid, password: password);

                            var result1 = await SupabaseCredentials.getAdmin(
                                _id.text, pass.text);
                            if (result1.length > 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Successfully Logged In ${result1[0]['name']}"),
                                ),
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          hodpage(title: result1)));
                            } else {
                              errorbox(context);
                              print("INVALID LOGIN");
                            }
                          } else if ((_id.text == 's') && (pass.text == '0')) {
                            String emailid = 'security@email.com';
                            String password = 'security-pass';
                            var result = await authenticationNotifier.login(
                                id: emailid, password: password);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ScanScreen()));
                          } else {
                            String emailid = 'example@email.com';
                            String password = 'example-password';
                            //if (id.isNotEmpty && password.isNotEmpty) {
                            var result = await authenticationNotifier.login(
                                id: emailid, password: password);

                            var result2 = await SupabaseCredentials.getData(
                                _id.text, pass.text);

                            if (result2.length > 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Successfully Logged In ${result2[0]['name']}"),
                                ),
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Menupage(title: result2)));
                            } else {
                              print("INVALID STUDENT LOGIN");
                              errorbox(context);
                            }
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_app/screens/qrcode/scan.dart';
import 'hod/hodhome.dart';
import 'student/menupage.dart';

class LoginApp extends StatelessWidget {
  void click() {}
  final TextEditingController _id = TextEditingController();
  final TextEditingController pass = TextEditingController();
  String admin = 'admin';
  @override
  Widget build(BuildContext context) {
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
              SizedBox(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    Spacer(flex: 1),
                    ElevatedButton(
                      // hoverColor: Color.fromARGB(137, 184, 177, 177),
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
                            //fontFamily: 'Calistoga',
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => {
                        if (_id.text == admin)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        hodpage())),
                            //  Navigator.of(context).push(MaterialPageRoute(builder:
                            //  (context)=>CreateQr(qr: _id.text)))
                          }
                        else if (_id.text == 'security')
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const ScanScreen())),
                          }
                        else
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Menupage())),
                          }
                      },
                      onLongPress: () => {print("hii")},
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

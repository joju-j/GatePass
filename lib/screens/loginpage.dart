import 'package:flutter/material.dart';
import 'menupage.dart';

class LoginApp extends StatelessWidget {
  void click() {}
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
                      child: const TextField(
                        decoration: InputDecoration(
                            // suffix: Icon(
                            //   FontAwesomeIcons.envelope,
                            //   color: Colors.red,
                            // ),
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
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            // suffix: Icon(
                            //   FontAwesomeIcons.eyeSlash,
                            //   color: Colors.red,
                            // ),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       TextButton(
                    //         onPressed: () {},
                    //         child: const Text(
                    //           "        ",
                    //           style: TextStyle(color: Colors.deepOrange),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // GestureDetector(
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     width: 250,
                    //     decoration: const BoxDecoration(
                    //         borderRadius: BorderRadius.all(Radius.circular(50)),
                    //         gradient: LinearGradient(
                    //             begin: Alignment.centerLeft,
                    //             end: Alignment.centerRight,
                    //             colors: [
                    //               Color.fromARGB(255, 122, 30, 172),
                    //               //Color.fromARGB(255, 48, 118, 156),
                    //               Color.fromARGB(255, 22, 34, 159),
                    //             ])),
                    //     child: const Padding(
                    //       padding: EdgeInsets.all(12.0),
                    //       child:
                    //     ),
                    //   ),
                    // ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Menupage()))
                      },
                      onLongPress: () => {print("hii")},
                    ),

                    const SizedBox(
                      height: 17,
                    ),
                    Spacer(flex: 1),
                    // const Text(
                    //   "Or Login using Social Media Account",
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     IconButton(
                    //         onPressed: click,
                    //         icon: const Icon(FontAwesomeIcons.facebook,
                    //             color: Colors.blue)),
                    //     IconButton(
                    //         onPressed: click,
                    //         icon: const Icon(
                    //           FontAwesomeIcons.google,
                    //           color: Colors.redAccent,
                    //         )),
                    //     IconButton(
                    //         onPressed: click,
                    //         icon: const Icon(
                    //           FontAwesomeIcons.twitter,
                    //           color: Colors.orangeAccent,
                    //         )),
                    //     IconButton(
                    //         onPressed: click,
                    //         icon: const Icon(
                    //           FontAwesomeIcons.linkedinIn,
                    //           color: Colors.green,
                    //         ))
                    //   ],
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void _navigateToNextScreen(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => NewScreen()));
  // }
}

// class NewScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('New Screen')),
//       body: Center(
//         child: Text(
//           'This is a new screen',
//           style: TextStyle(fontSize: 24.0),
//         ),
//       ),
//     );
//   }
// }

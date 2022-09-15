import 'package:flutter/material.dart';
import 'package:login_app/screens/student/pending.dart';
import 'package:login_app/screens/student/requestpage.dart';
import 'package:login_app/supabase/supabase.queries.dart';

class Menupage extends StatelessWidget {
  Menupage({required this.title});
  var title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Start.jpg'),
                    fit: BoxFit.cover)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Container(
                    width: 325,
                    height: 250,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 143, 131),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RequestScreen(values: title))),
                            print(title),
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.only(
                                left: 70, right: 70, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            primary: Color.fromARGB(255, 122, 30, 172),
                            shadowColor: Colors.black,
                            elevation: 10,
                          ),
                          child: Text(
                            'Request',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              //fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        //Spacer(flex: 1),
                        const SizedBox(
                          height: 45,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            String awaiting;
                            var res =
                                await SupabaseCredentials.pendingstatus(title);
                            if (res.length > 0) {
                              if (res[0]['permission'] == null) {
                                awaiting = "Waiting for response";
                              } else if (res[0]['permission'] == false) {
                                awaiting = "Permssion Denied";
                              } else {
                                awaiting = "Permssion Granted";
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        pendingpage(
                                            values: title,
                                            decision: awaiting,
                                            perms: res)),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "No pending requests available at the moment! "),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            primary: Color.fromARGB(255, 122, 30, 172),
                            shadowColor: Colors.black,
                            elevation: 10,
                          ),
                          child: Text(
                            'Pending Log',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              //fontFamily: 'Calistoga',
                              //fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])

            //   child: RaisedButton(
            //       child: Text('Back To HomeScreen'),
            //       color: Theme.of(context).primaryColor,
            //       textColor: Colors.white,
            //       onPressed: () => Navigator.pop(context)),
            // ),
            ),
      ),
    );
  }
}

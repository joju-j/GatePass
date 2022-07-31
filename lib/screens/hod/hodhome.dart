import 'package:flutter/material.dart';
import 'package:login_app/screens/hod/history.dart';
import 'package:login_app/screens/hod/incomreq.dart';
import 'package:login_app/supabase/supabase.credentials.dart';

class hodpage extends StatelessWidget {
  var title;
  hodpage({required this.title});
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
                fit: BoxFit.cover),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                    onPressed: () async {
                      var allres = await SupabaseCredentials.allrequests(title);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => hodreq(
                                    userid: title,
                                    results: allres,
                                  )));
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
                      'Incoming Requests',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => history()))
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
                      'History',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

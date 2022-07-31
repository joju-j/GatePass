import 'package:flutter/material.dart';
import 'package:login_app/supabase/supabase.credentials.dart';

class decision extends StatelessWidget {
  var value;
  decision({required this.value});

  void acceptbox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Permission Granted'),
              content: const Text('Entry is recorded'),
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

  void denybox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Permission Declined'),
              content: const Text('Entry is recorded'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 244, 143, 131),
        ),
        child: Column(
          children: [
            const SizedBox(height: 170),
            Container(
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    "Name: ${value['name']}  ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color.fromARGB(255, 85, 31, 31),
                      fontSize: 25,
                      fontFamily: 'Calistoga',
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Class: S${value['sem']} ${value['dept']} ${value['batch']} ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 85, 31, 31),
                      fontSize: 25,
                      fontFamily: 'Calistoga',
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Exit Time: ${value['exit_time']}  ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color.fromARGB(255, 85, 31, 31),
                      fontSize: 25,
                      fontFamily: 'Calistoga',
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Reason for exit: ${value['reason']}  ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color.fromARGB(255, 85, 31, 31),
                      fontSize: 20,
                      fontFamily: 'Calistoga',
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 0, bottom: 0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          primary: Colors.green,
                          shadowColor: Colors.black,
                          elevation: 10,
                        ),
                        onPressed: () async {
                          acceptbox(context);
                          await SupabaseCredentials.acceptreq(value);
                        },
                        child: Text(
                          'Accept',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(width: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 0, bottom: 0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          primary: Colors.red,
                          shadowColor: Colors.black,
                          elevation: 10,
                        ),
                        onPressed: () async {
                          print(value);
                          denybox(context);
                          await SupabaseCredentials.denyreq(value);
                        },
                        child: Text(
                          'Deny',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

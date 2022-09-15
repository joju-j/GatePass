import 'package:flutter/material.dart';
import 'package:login_app/screens/qrcode/generate.dart';

class pendingpage extends StatelessWidget {
  var values, perms;
  String decision;

  pendingpage(
      {required this.values, required this.decision, required this.perms});

  void errorbox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                  'Group Advisor has not acknowledeged your request!'),
              content: const Text('Please try again later!'),
              actions: [
                // The "Yes" button
                TextButton(
                    onPressed: () {
                      // Remove the box
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => pendingpage(
                                  values: values,
                                  decision: decision,
                                  perms: perms)));
                    },
                    child: const Text('Okay')),
              ],
            ));
  }

  void deniedbox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Group Advisor has DENIED your request!'),
              content: const Text('Please try again later!'),
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

  void acceptbox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Group Advisor has ACCEPTED your request!'),
              content: const Text('PROCEED TO QRCODE!'),
              actions: [
                // The "Yes" button
                TextButton(
                    onPressed: () {
                      // Remove the box
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreateQr(values: values, perms: perms)));
                    },
                    child: const Text('GO!')),
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
            const SizedBox(height: 200),
            Container(
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Status: $decision ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color.fromARGB(255, 241, 10, 10),
                      fontSize: 18,
                      fontFamily: 'Calistoga',
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Exit Time: ${perms[0]['exit_time']}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color.fromARGB(255, 85, 31, 31),
                      fontSize: 18,
                      fontFamily: 'Calistoga',
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Reason: ${perms[0]['reason']} ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color.fromARGB(255, 85, 31, 31),
                      fontSize: 18,
                      fontFamily: 'Calistoga',
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
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
                    onPressed: () => {
                      if (decision == 'Waiting for response')
                        {
                          errorbox(context),
                        }
                      else if (perms[0]['permission'] == false)
                        {
                          deniedbox(context),
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             pendingpage(
                          //               values: values,
                          //               decision: decision,
                          //               perms: perms,
                          //             ))),
                        }
                      else
                        {acceptbox(context)}
                    },
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) => CreateQr()))

                    child: Text(
                      'Show QR CODE',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
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

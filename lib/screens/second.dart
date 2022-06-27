import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
                        fit: BoxFit.cover)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      const Text(
                        "MyWay App",
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Calistoga',
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        width: 325,
                        height: 260,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 18, 182, 215),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 35,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.only(
                                    left: 70, right: 70, top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                primary: Color.fromARGB(255, 122, 30, 172),
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.only(
                                    left: 40, right: 40, top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                primary: Color.fromARGB(255, 122, 30, 172),
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
                )));
  }
}

import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 205, 112, 102),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Request",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Calistoga',
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 350,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 227, 144, 135),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 260,
                        height: 400,
                        child: Column(
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                labelText: "HOD:",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: "CLASS:",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // const TextField(
                            //   decoration: InputDecoration(
                            //     labelText: "TIME:",
                            //     filled: true,
                            //     fillColor: Colors.white,
                            //     border: OutlineInputBorder(
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(100)),
                            //     ),
                            //   ),
                            // ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Time:",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Calistoga',
                                  ),
                                ),
                                const SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  "${selectedTime.hour}:${selectedTime.minute}",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Calistoga',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const SizedBox(
                              width: 500,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "REASON:",
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 50, horizontal: 20),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

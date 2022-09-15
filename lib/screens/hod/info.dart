import 'package:flutter/material.dart';
class info extends StatelessWidget {
  var value;
  info({required this.value});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Text(
              "Details",
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Calistoga',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                    Text(
                      "Class: S${value['sem']} ${value['dept']} ${value['batch']} ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 85, 31, 31),
                        fontSize: 25,
                        fontFamily: 'Calistoga',
                        //fontWeight: FontWeight.bold
                      ),
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
                    Text(
                      "Date: ${value['created']}  ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color.fromARGB(255, 85, 31, 31),
                        fontSize: 20,
                        fontFamily: 'Calistoga',
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Note: ${value['note']}  ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color.fromARGB(255, 85, 31, 31),
                        fontSize: 20,
                        fontFamily: 'Calistoga',
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

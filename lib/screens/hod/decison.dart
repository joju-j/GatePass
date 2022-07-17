import 'package:flutter/material.dart';

class decision extends StatelessWidget {
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
            const SizedBox(height: 100),
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
                  const TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      labelText: "NAME",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  const TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      labelText: "CLASS",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    ),
                  ),
                  const TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      labelText: "EXIT TIME",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: "Reason for exit:",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
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
                        onPressed: () => {},
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
                        onPressed: () => {},
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

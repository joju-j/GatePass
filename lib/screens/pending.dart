import 'package:flutter/material.dart';
import 'package:login_app/screens/qrcode/generate.dart';

class pendingpage extends StatelessWidget {
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
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      labelText: "NAME",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
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
                  TextField(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CreateQr()))
                    },
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

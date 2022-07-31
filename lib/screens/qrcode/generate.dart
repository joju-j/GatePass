import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

// class CreateQr extends StatelessWidget {
//   const CreateQr({required this.value});

//   @override
//   _CreateQrState createState() => _CreateQrState();
// }

class CreateQr extends StatelessWidget {
  var values, perms;
  CreateQr({required this.values, required this.perms});
  checkqr(context) {
    String qr = perms[0]['qrcode'];
    return qr;
  }

  //disable screenshots and record screen in current screen

  @override
  Widget build(BuildContext context) {
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("QR Code"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BarcodeWidget(
            color: Colors.black,
            data: checkqr(context),
            barcode: Barcode.qrCode(),
            width: 250.0,
            height: 250.0,
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width * .8,
          //   child: TextField(
          //     onChanged: (context) {
          //       setState(() {
          //         qr = context;
          //       });
          //     },
          //     decoration: InputDecoration(
          //         focusedBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: Colors.deepPurpleAccent)),
          //         hintText: "Enter your data here",
          //         hintStyle:
          //             TextStyle(fontSize: 20.0, color: Colors.grey.shade700),
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(8.0),
          //             borderSide: BorderSide(width: 4.0))),
          //   ),
          // ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}

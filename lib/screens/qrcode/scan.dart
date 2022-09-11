import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:login_app/supabase/supabase.credentials.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String qr = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Scan your QR Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              qr,
              style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 32.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700),
                onPressed: scanQR,
                child: Text("Scan Your QR Code"))
          ],
        ),
      ),
    );
  }

  Future<void> scanQR() async {
    //try {

    print("--------------------------------------------");
    var value = await FlutterBarcodeScanner.scanBarcode(
        "#00FF00", "Cancel", true, ScanMode.QR);
    print("#####################################------");
    print(value);
    var qrdata = await SupabaseCredentials.allqr(value);
    if (qrdata.length > 0) {
      qr = 'Permssion to leave granted';
      await SupabaseCredentials.deleterow1(qrdata);
    } else {
      qr = 'Permission Declined';
      await SupabaseCredentials.deleterow2(qrdata);
    }
    setState(() {
      // qr = value;
    });
    // } on MissingPluginException catch (_) {
    //   setState(() {
    //     qr = "Unable to read the QR Code";
    //   });
    // }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_barcode_scanner/flutter_barcode_scanner.dart";
import 'package:qrscanner/resultPage.dart';

class scannerPage extends StatefulWidget {
  const scannerPage({super.key});

  @override
  State<scannerPage> createState() => _scannerPage();
}

class _scannerPage extends State<scannerPage> {

  Future<void> scanQR() async {
    String qrCodeResult = "Not Yet Scanned";

    try{
      qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.QR
      );
      debugPrint(qrCodeResult);
    } on PlatformException {
      qrCodeResult = "Error";
    }
    if(!(qrCodeResult == "-1")){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => resultPage(result: qrCodeResult))
    );
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
                  "QR Reader",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                  ),
        backgroundColor: const Color(0xff91C8E4),
      ),

      body: Center(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("./asset/images/qr4.png"),
              SizedBox(
                width: 300,
                child: ElevatedButton(onPressed: scanQR,style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          // side: const BorderSide(color: Color(0xff33CC99)
                          // )
                        )
                      )
                    ), child: const Text("Scan QR")
                    
                  ),
              ),
            ],
          ),
        ),
    );
  }
}
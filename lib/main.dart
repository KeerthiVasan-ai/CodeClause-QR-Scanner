import 'package:flutter/material.dart';
import 'package:qrscanner/scannerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QR Scanner",
      home: const scannerPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff91C8E4)
      ),
    );
  }
}

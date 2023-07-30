import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class resultPage extends StatefulWidget {
  
  final String result;
  const resultPage({required this.result});

  @override
  State<resultPage> createState() => _resultPage();
}

class _resultPage extends State<resultPage> {

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
      body: Container(
        width : double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Scanner Result",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            Expanded(
              flex:4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(widget.result,style: const TextStyle(fontSize: 16)),
                ]
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   ElevatedButton(onPressed: (){
                            Clipboard.setData(ClipboardData(text: widget.result));
                            const snackBar = SnackBar(content: Text("Copied"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar); 
                      }, 
                      style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      // side: const BorderSide(color: Color(0xff33CC99))
                    ))
                  ),
                    child: const Text("Copy to Clipboard")
                  )
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}
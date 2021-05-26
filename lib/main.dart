import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String text = "Hasil QR Scan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        title: Text("QR Scanner"),
        backgroundColor: Colors.indigo[800],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                //the textstyle of the text on appbar
                fontSize: 25, //the font size
                color: Colors.black, //the colors of the text
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
              child: Text("Scan QR"),
              color: Colors.cyan,
              onPressed: () async {
                text = await scanner.scan();
                setState(() {});
              })
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class FingerprintPage extends StatefulWidget {
  @override
  _FingerprintPageState createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<FingerprintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fingerprint'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
          },
          child: Image.asset(
            'assets/icons/camera6.jpg',
            width: 100,
            height: 100,
          ),
      ),
      ),
    );
  }
}

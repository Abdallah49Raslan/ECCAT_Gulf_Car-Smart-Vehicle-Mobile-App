import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Face_Reco extends StatefulWidget {
  @override
  _FingerprintPageState createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<Face_Reco> {
  final database = FirebaseDatabase.instance.reference();
  late StreamSubscription outputstream;
  String? WelcomeName;
  String? UrlPic;

  void initState() {
    super.initState();
    activateListeners();
  }

  void activateListeners() {
    //Driver values
    outputstream = database.child('welcomeflag').onValue.listen((event) {
      final String? Name = event.snapshot.child('welcomeflag').value as String?;
      final String? Url = event.snapshot.child('UrlPic').value as String?;

      setState(() {
        WelcomeName = Name;
        UrlPic = Url;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Recognition'),
      ),
      body: Column(
        children: [
          if (UrlPic != null) Image.network(UrlPic!),
          Center(
            child: Text(WelcomeName ?? "no body"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    outputstream.cancel();
    super.dispose();
  }
}

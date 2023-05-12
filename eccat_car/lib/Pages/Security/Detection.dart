import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccat_car/core/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../core/text_style.dart';

class Detection extends StatefulWidget {
  @override
  _FingerprintPageState createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<Detection> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final database = FirebaseDatabase.instance.reference();
  late StreamSubscription outputstream;
  String? unAuth;
  String? urlPic;

  void initState() {
    super.initState();
    activateListeners();
  }

  void activateListeners() {
    outputstream = database.child('unwelcomeflag').onValue.listen((event) {
      final Object? Unwelcom = event.snapshot.child('unwelcomeflag').value;

      // Retrieve driver's information if the welcomeFlagValue matches driverName
      _firestore
          .collection('Unauthorized')
          .doc('unauthorized_person')
          .get()
          .then((snapshot) {
        final Object? profileUrl = snapshot.get('photoURL');

        setState(() {
          urlPic = '$profileUrl';
          unAuth = '$Unwelcom';
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColorDark,
        title: Text(
          "Detection",
          style: headline1,
        ),
      ),
      backgroundColor: blackBG,
      body: Column(
        children: [
          SizedBox(height: 30),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: maxWidth, // Adjust the width as needed
              height: maxHeight / 3, // Adjust the height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.red, // Add the blue color
                  width: 4, // Add the border width as needed
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (urlPic != null)
                      Image.network(
                        urlPic!,
                        fit: BoxFit.cover,
                      ),
                    if (urlPic == null) Icon(Icons.person, size: 60),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white, // Border color
              ),
              color: Colors.black, // Background color of the border
              borderRadius: BorderRadius.circular(10), // Border radius
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  ' $unAuth ',
                  style: Security,
                ),
              ],
            ),
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

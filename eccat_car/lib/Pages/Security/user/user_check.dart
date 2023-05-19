import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccat_car/Pages/Security/Captures.dart';
import 'package:eccat_car/Pages/Security/user/user_detect.dart';
import 'package:eccat_car/core/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../core/text_style.dart';
import '../Detection.dart';

class UserCheck extends StatefulWidget {
  @override
  _UserCheckState createState() => _UserCheckState();
}

class _UserCheckState extends State<UserCheck> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final database = FirebaseDatabase.instance.reference();
  late StreamSubscription outputstream;
  late StreamSubscription outputstream1;
  String? Driver_name;
  String? urlPic;
  String? Ages;
  String? welcomName;
  String? unwelcomflag;
  String? finger;

  @override
  void initState() {
    super.initState();
    activateListeners();
  }

  void activateListeners() {
    outputstream1 = database.child('Security').onValue.listen((event) {
      final String? welcomeFlagValue =
          event.snapshot.child('welcomeflag').value as String?;
      final String? fingerprint =
          event.snapshot.child('fingerprint').value as String?;
      unwelcomflag = event.snapshot.child('unwelcomeflag').value as String?;

      // Retrieve driver's information if the welcomeFlagValue matches driverName
      _firestore.collection('drivers').get().then((snapshot) {
        snapshot.docs.forEach((doc) {
          final Object? name = doc.get('driverName');
          final Object? driverAge = doc.get('age');
          final Object? profileUrl = doc.get('profilePicture');

          if (fingerprint == name) {
            setState(() {
              Driver_name = '$name';
              Ages = '$driverAge';
              urlPic = '$profileUrl';
              welcomName = '$welcomeFlagValue';
              finger = '$fingerprint';
            });
          } else if (unwelcomflag != null && unwelcomflag!.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserDetect()),
            );
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: blackBG,
      body: Column(
        children: [
          Container(
            width: maxWidth,
            height: maxHeight - 80,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/Car.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  SizedBox(height: 75),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: maxWidth,
                      height: maxHeight / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.blue,
                          width: 4,
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
                          'The Driver is: $Driver_name \n         Age: $Ages',
                          style: Security,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccat_car/Pages/Security/Captures.dart';
import 'package:eccat_car/core/colors.dart';
import 'package:eccat_car/core/text_style.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class FaceReco extends StatefulWidget {
  @override
  _FaceRecoState createState() => _FaceRecoState();
}

class _FaceRecoState extends State<FaceReco> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final database = FirebaseDatabase.instance.reference();
  late StreamSubscription outputstream;
  String? welcomeName;
  String? urlPic;

  @override
  void initState() {
    super.initState();
    activateListeners();
  }

  void activateListeners() {
    outputstream = database.child('DriverName').onValue.listen((event) {
      activateListeners1();
    });
  }

  void activateListeners1() {
    _firestore
        .collection('drivers')
        .doc()
        .get()
        .then((DocumentSnapshot snapshot) {
      final Map<String, dynamic>? data =
          snapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        final String? url = data['Photo'] as String?;
        final String? name = data['DriverName'] as String?;
        setState(() {
          urlPic = url;
          welcomeName = name;
        });
      }
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
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: maxWidth, // Adjust the width as needed
                      height: maxHeight / 3, // Adjust the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.blue, // Add the blue color
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: backgroundColorDark,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      welcomeName ?? "No body",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(flex: 6),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Captures()),
                      );

                      database.child('captureflag').update({
                        'capture': 1,
                      });

                      Future.delayed(Duration(seconds: 5), () {
                        database.child('captureflag').update({
                          'capture': 0,
                        });
                      });
                    },
                    child: Text('Take picture'),
                  ),
                ],
              ),
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

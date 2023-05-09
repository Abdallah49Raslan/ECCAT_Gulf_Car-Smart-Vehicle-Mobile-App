import 'dart:async';

import 'package:eccat_car/core/colors.dart';
import 'package:eccat_car/core/text_style.dart';
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
  bool _showAvatar = false;

  void initState() {
    super.initState();
    activateListeners();
  }

  void activateListeners() {
    //Driver values
    outputstream = database.child('welcomeflag').onValue.listen((event) {
      final String? Name = event.snapshot.child('welcomeflag').value as String?;
      final String? Url = event.snapshot.child('photo').value as String?;

      setState(() {
        WelcomeName = Name;
        UrlPic = Url;
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
                  SizedBox(height: 30),
                  _showAvatar
                      ? Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 120,
                            backgroundImage: UrlPic != null
                                ? NetworkImage(UrlPic!) as ImageProvider
                                : null,
                            child: GestureDetector(
                              child: UrlPic == null
                                  ? const Icon(Icons.person, size: 60)
                                  : SizedBox(),
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: backgroundColorDark,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      WelcomeName ?? "No body",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(flex: 6),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, bottom: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showAvatar = !_showAvatar;
                          });
                        },
                        child: Text(
                          _showAvatar ? 'Hide it' : 'Show Who in the car',
                          style: headline2,
                        ),
                      ),
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

  @override
  void dispose() {
    outputstream.cancel();
    super.dispose();
  }
}

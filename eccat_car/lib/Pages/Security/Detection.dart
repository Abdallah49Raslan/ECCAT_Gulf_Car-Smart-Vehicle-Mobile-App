import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccat_car/core/colors.dart';
import 'package:flutter/material.dart';

class Detection extends StatefulWidget {
  @override
  _FingerprintPageState createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<Detection> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late StreamSubscription outputstream;
  String? welcomeName;
  String? urlPic;

  void initState() {
    super.initState();
    activateListeners();
  }

  void activateListeners() {
    // Driver values
    outputstream = _firestore
        .collection('Unauthorized')
        .doc('unauthorized_person')
        .snapshots()
        .listen((event) {
      final String? name = event.data()?['Warning'] as String?;
      final String? url = event.data()?['photoURL'] as String?;

      setState(() {
        welcomeName = name;
        urlPic = url;
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: backgroundColorDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Unauthorized')
                  .doc('unauthorized_person')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data =
                      snapshot.data?.data() as Map<String, dynamic>? ?? {};
                  final welcomeName = data['Warning'] as String? ?? 'Nobody';
                  return Text(
                    welcomeName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error');
                } else {
                  return CircularProgressIndicator();
                }
              },
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

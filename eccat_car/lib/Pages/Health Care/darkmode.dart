import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../core/colors.dart';
import '../../core/globalvariables.dart';
import '../../core/text_style.dart';
import 'DriverGrid.dart';
import 'Passenger1Grid.dart';
import 'Passenger2Grid.dart';

class HealthCareDriver extends StatefulWidget {
  const HealthCareDriver({super.key});

  @override
  State<HealthCareDriver> createState() => _darkmodeState();
}

class _darkmodeState extends State<HealthCareDriver> {
  final database = FirebaseDatabase.instance.reference();
  late StreamSubscription outputstream;

  void initState() {
    super.initState();
    activateListeners();
  }

  void activateListeners() {
    //Driver values
    outputstream = database.child('HealthDatabase').onValue.listen((event) {
      final num? temp = event.snapshot.child('Drivertemperature').value as num;
      final num? heartRate =
          event.snapshot.child('DriverheartRate').value as num;
      final num? oximeter = event.snapshot.child('Driveroximeter').value as num;
      final Object? alcohol = event.snapshot.child('Driveralcohol').value;
      //Passenger1 values
      final num? P1heartRate =
          event.snapshot.child('passenger1heartRate').value as num;
      final num? P1temperature =
          event.snapshot.child('passenger1temperature').value as num;
      final num? P1oximeter =
          event.snapshot.child('passenger1oximeter').value as num;
      //Passenger2 values
      final num? P2heartRate =
          event.snapshot.child('passenger2heartRate').value as num;
      final num? P2temperature =
          event.snapshot.child('passenger2temperature').value as num;
      final num? P2oximeter =
          event.snapshot.child('passenger2oximeter').value as num;

      setState(() {
        Ddisplaytemp = temp!;
        DdisplayheartRat = heartRate!;
        Ddisplayoximeter = oximeter!;
        displayalcohol = '$alcohol';
//
        P1displaytemp = P1temperature!;
        P1displayheartRate = P1heartRate!;
        P1displayoximeter = P1oximeter!;
//
        P2displaytemp = P2temperature!;
        P2displayheartRate = P2heartRate!;
        P2displayoximeter = P2oximeter!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final TestButtonREf = database.child("TestNow");
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                    // fit: BoxFit.fill,
                    image: AssetImage("assets/icons/Car.png")),
              ),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                children: [
                  //Driver Screen
                  drivergrid(),
                  //Passenger1 Screen
                  passenger1grid(),
                  //Passenger2 Screen
                  passenger2grid()
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 10,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      TestButtonREf.set({'TestButton': 'on'});
                    },
                    child: Text(
                      "Test Now",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side:
                              BorderSide(width: 2, color: Color(0XFFC6372A)))),
                    ),
                  ),
                ))
          ],
        ));
  }

  @override
  void dispose() {
    outputstream.cancel();
    super.dispose();
  }
}

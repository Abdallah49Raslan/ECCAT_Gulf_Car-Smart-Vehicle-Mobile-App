import 'dart:async';
import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/colors.dart';
import '../../core/globalvariables.dart';
import '../../core/text_style.dart';
import 'HealthConditions.dart';

class Passenger1 extends StatefulWidget {
  const Passenger1({super.key});

  @override
  State<Passenger1> createState() => _Passenger1State();
}

class _Passenger1State extends State<Passenger1> {
  final database = FirebaseDatabase.instance.reference();
  late StreamSubscription outputstream;

  void initState() {
    super.initState();
    activateListeners();
  }

  void activateListeners() {
    outputstream = database.child('HealthDatabase').onValue.listen((event) {
      //Passenger1 values
      final num? P1heartRate =
          event.snapshot.child('passenger1heartRate').value as num;
      final num? P1temperature =
          event.snapshot.child('passenger1temperature').value as num;
      final num? P1oximeter =
          event.snapshot.child('passenger1oximeter').value as num;

      setState(() {
        P1displaytemp = P1temperature!;
        P1displayheartRate = P1heartRate!;
        P1displayoximeter = P1oximeter!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double childAspectvalue = 2;
    if (screenWidth > 480) {
      // If width is more than 480, set a new font value
      childAspectvalue = 2.5;
    }
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            width: screenWidth,
            height: screenHeight - 70,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 70, right: 10, left: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                  // fit: BoxFit.fill,
                  image: AssetImage("assets/icons/Car.png")),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    child: GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: childAspectvalue,
                      ),
                      children: [
                        //HeartRate
                        Container(
                          padding:
                              EdgeInsets.only(right: 10, left: 10, top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            border: Border.all(color: borderColor, width: 2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Heart Rate",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  Positioned(
                                    top: 10,
                                    right: 6,
                                    child: SvgPicture.asset(
                                      "assets/icons/heart-rate.svg",
                                      height: 30,
                                      width: 30,
                                      color: Colors.red,
                                    ),
                                  ),
                                  /*SvgPicture.asset("assets/icons/heart-rate.svg",
                        height: 20, width: 20, color: Colors.red),*/
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                children: [
                                  Text(
                                    '$P1displayheartRate',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    " BPM",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [P1HeartRateCondition()],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "60  : 100\nNormal",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  ])
                            ],
                          ),
                        ),

                        Container(
                          padding:
                              EdgeInsets.only(right: 10, left: 10, top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            border: Border.all(color: borderColor, width: 2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Temperature",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  Positioned(
                                    top: 10,
                                    right: 6,
                                    child: SvgPicture.asset(
                                      "assets/icons/temperature-high-solid-svgrepo-com.svg",
                                      height: 30,
                                      width: 30,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  /*SvgPicture.asset("assets/icons/heart-rate.svg",
                        height: 20, width: 20, color: Colors.red),*/
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                children: [
                                  Text(
                                    '$P1displaytemp',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    " °C",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [P1TemperatureCondition()],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "36  : 37.2\nNormal",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  ])
                            ],
                          ),
                        ),

                        Container(
                          padding:
                              EdgeInsets.only(right: 10, left: 10, top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            border: Border.all(color: borderColor, width: 2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Oximeter",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  Positioned(
                                    top: 10,
                                    right: 6,
                                    child: Image.asset(
                                      "assets/icons/oxi3.png",
                                      height: 30,
                                      width: 30,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  /*SvgPicture.asset("assets/icons/heart-rate.svg",
                        height: 20, width: 20, color: Colors.red),*/
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                children: [
                                  Text(
                                    '$P1displayoximeter',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    " SPO2",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [P1OximeterCondition()],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "90  : 100\nNormal",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  ])
                            ],
                          ),
                        ),
                      ],
                    ))
              ]),
            )));
  }

  void deactivate() {
    outputstream.cancel();
    super.deactivate();
  }
}

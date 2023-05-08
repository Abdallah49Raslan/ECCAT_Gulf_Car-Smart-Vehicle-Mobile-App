import 'dart:async';

import 'package:eccat_car/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

// import '../constants.dart';

class FireThree extends StatefulWidget {
  const FireThree({super.key});

  @override
  State<FireThree> createState() => _FireThreeState();
}

class _FireThreeState extends State<FireThree> {
  String Driverheart = "";
  String Drivertemp = "";
  String Driveroxi = "";
  String P1heart = "";
  String P1temp = "";
  String P1oxi = "";
  String P2heart = "";
  String P2temp = "";
  String P2oxi = "";
  final database = FirebaseDatabase.instance.reference();
  num? Ddisplaytemp;
  num? DdisplayheartRat;
  num? Ddisplayoximeter;
  String? displayalcohol;
  num? P1displaytemp;
  num? P1displayheartRate;
  num? P1displayoximeter;
  num? P2displaytemp;
  num? P2displayheartRate;
  num? P2displayoximeter;
  late StreamSubscription outputstream;

  void initState() {
    super.initState();

    activateListeners();
  }

  void activateListeners() {
    //Driver values
    outputstream = database.child('output').onValue.listen((event) {
      final num? temp = event.snapshot.child('temp').value as num;
      final num? heartRate = event.snapshot.child('heartRate').value as num;
      final num? oximeter = event.snapshot.child('oximeter').value as num;
      final Object? alcohol = event.snapshot.child('alcohol').value;
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
        // Timer(Duration(seconds: 1), () {
        //   Get.snackbar("Welcome", " You Can Test Now  ",
        //       animationDuration: Duration(seconds: 2),
        //       icon: Icon(
        //         Icons.help,
        //         size: 90,
        //       ),
        //       colorText: Colors.red,
        //       borderRadius: 12,
        //       backgroundColor: Colors.white,
        //       reverseAnimationCurve: Curves.bounceIn,
        //       titleText: Image.asset(
        //         "assets/icons/oxi3.png",
        //         color: Colors.blue,
        //       ));
        // });
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

  Widget DTemperatureCondition() {
    if (Ddisplaytemp == null || Ddisplaytemp == 0) {
      return Text(".........",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    } else if (36 <= Ddisplaytemp! && Ddisplaytemp! <= 37.2) {
      Drivertemp = "Normal";
      return Text('$Drivertemp',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ));
    } else {
      Drivertemp = "Abnormal";
      return Text('$Drivertemp',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0XFFC6372A),
          ));
    }
  }

  Widget P1TemperatureCondition() {
    if (P1displaytemp == null || P1displaytemp! == 0) {
      return Text(".........",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    } else if (36 <= P1displaytemp! && P1displaytemp! <= 37.2) {
      P1temp = "Normal";
      return Text('$P1temp',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ));
    } else {
      P1temp = "Abnormal";
      return Text('$P1temp',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0XFFC6372A),
          ));
    }
  }

  Widget P2TemperatureCondition() {
    if (P2displaytemp == null || P2displaytemp == 0) {
      return Text(".........",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    } else if (36 <= P2displaytemp! && P2displaytemp! <= 37.2) {
      P2temp = "Normal";
      return Text('$P2temp',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ));
    } else {
      P2temp = "Abnormal";
      return Text('$P2temp',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0XFFC6372A),
          ));
    }
  }

  Widget DHeartRateCondition() {
    if (DdisplayheartRat == null || DdisplayheartRat == 0) {
      return Text(".........",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    } else if (60 <= DdisplayheartRat! && DdisplayheartRat! <= 100) {
      Driverheart = " Normal";
      return Text('$Driverheart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ));
    } else {
      Driverheart = "Abnormal";
      return Text('$Driverheart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0XFFC6372A),
          ));
    }
  }

  Widget P1HeartRateCondition() {
    if (P1displayheartRate == null || P1displayheartRate == 0) {
      return Text(".........",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    } else if (60 <= P1displayheartRate! && P1displayheartRate! <= 100) {
      P1heart = " Normal";
      return Text('$P1heart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ));
    } else {
      P1heart = "Abnormal";
      return Text('$P1heart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0XFFC6372A),
          ));
    }
  }

  Widget P2HeartRateCondition() {
    if (P2displayheartRate == null || P2displayheartRate == 0) {
      return Text(".........",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    } else if (60 <= P2displayheartRate! && P2displayheartRate! <= 100) {
      P2heart = " Normal";
      return Text('$P2heart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ));
    } else {
      P2heart = "Abnormal";
      return Text('$P2heart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0XFFC6372A),
          ));
    }
  }

  Widget DOximeterCondition() {
    if (Ddisplayoximeter == null || Ddisplayoximeter == 0) {
      return Text(".........",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    } else if (90 <= Ddisplayoximeter! && Ddisplayoximeter! <= 100) {
      Driveroxi = "Normal";
      return Text('$Driveroxi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ));
    } else {
      Driveroxi = "Abnormal";
      return Text('$Driveroxi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0XFFC6372A),
          ));
    }
  }

  Widget P1OximeterCondition() {
    if (P1displayoximeter == null || P1displayoximeter == 0) {
      return Text(".........",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    } else if (90 <= P1displayoximeter! && P1displayoximeter! <= 100) {
      P1oxi = "Normal";
      return Text('$P1oxi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ));
    } else {
      P1oxi = "Abnormal";
      return Text('$P1oxi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0XFFC6372A),
          ));
    }
  }

  Widget P2OximeterCondition() {
    if (P2displayoximeter == null || P2displayoximeter == 0) {
      return Text(".........",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    } else if (90 <= P2displayoximeter! && P2displayoximeter! <= 100) {
      P2oxi = "Normal";
      return Text('$P2oxi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ));
    } else {
      P2oxi = "Abnormal";
      return Text('$P2oxi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0XFFC6372A),
          ));
    }
  }

  /*dynamic Alertmessage() {
    if (Driveroximeter == null) {
      return Text("",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    } else if (Driveroximeter == "Abnormal") {
      return AlertDialog(
        title: Text("Emergency"),
        titleTextStyle: TextStyle(color: Colors.red),
        content: Text(
            "Driver vital statistics are Abnormal\nyou should ask for help"),
        contentTextStyle: TextStyle(color: Colors.black),
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final TestButtonREf = database.child("TestNow");
    return Scaffold(
        // backgroundColor: Colors.black,
        // backgroundColor: Colors.cyanAccent[400],
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Colors.white,
        //   title: Text("HealthCare",
        //       style: TextStyle(
        //         fontSize: 30,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.black,
        //       )),
        // ),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: (550),
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              /* decoration: BoxDecoration(
                    image: DecorationImage(
                        // fit: BoxFit.fill,
                        image: AssetImage("assets/icons/Car.png")),
                  ),*/
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                children: [
                  //Driver Screen

                  Container(
                    padding: EdgeInsets.only(right: 5, left: 1),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        Text(" Driver",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              // color: Color.fromARGB(255, 112, 108, 108),
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            //Icons Column
                            Column(
                              children: [
                                SvgPicture.asset("assets/icons/heart-rate.svg",
                                    height: 20, width: 20, color: Colors.red),
                                SizedBox(
                                  height: 5,
                                ),
                                SvgPicture.asset(
                                    "assets/icons/temperature-high-solid-svgrepo-com.svg",
                                    height: 25,
                                    width: 25,
                                    color: Colors.orange),
                                SizedBox(
                                  height: 5,
                                ),
                                Image.asset(
                                  "assets/icons/oxi3.png",
                                  height: 35,
                                  width: 35,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Image.asset("assets/icons/alcohol.png",
                                    height: 18,
                                    width: 18,
                                    color: Color.fromARGB(255, 43, 168, 5)),
                              ],
                            ),
                            //Label Column
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Heart Rate",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Temp",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Oximeter",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Alcohol",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            //Values Column
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$DdisplayheartRat',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '$Ddisplaytemp',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '$Ddisplayoximeter',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '$displayalcohol',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            //Normal&Abnormal Column
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DHeartRateCondition(),
                                SizedBox(
                                  height: 5,
                                ),
                                DTemperatureCondition(),
                                SizedBox(
                                  height: 5,
                                ),
                                DOximeterCondition(),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Normal",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                  //Passenger1 Screen
                  Container(
                    padding: EdgeInsets.only(right: 5, left: 1),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(" Passenger 1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 112, 108, 108),
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          //Icons Column
                          Column(
                            children: [
                              SvgPicture.asset("assets/icons/heart-rate.svg",
                                  height: 20, width: 20, color: Colors.red),
                              SizedBox(
                                height: 5,
                              ),
                              SvgPicture.asset(
                                  "assets/icons/temperature-high-solid-svgrepo-com.svg",
                                  height: 25,
                                  width: 25,
                                  color: Colors.orange),
                              SizedBox(
                                height: 5,
                              ),
                              Image.asset(
                                "assets/icons/oxi3.png",
                                height: 35,
                                width: 35,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          //Label Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Heart Rate",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Temp",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Oximeter",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          //Values Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '$P1displayheartRate',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '$P1displaytemp',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '$P1displayoximeter',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          //Normal&Abnormal Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              P1HeartRateCondition(),
                              SizedBox(
                                height: 5,
                              ),
                              P1TemperatureCondition(),
                              SizedBox(
                                height: 5,
                              ),
                              P1OximeterCondition(),
                            ],
                          ),
                        ])
                      ],
                    ),
                  ),
                  //Passenger2 Screen
                  Container(
                    padding: EdgeInsets.only(right: 5, left: 1),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(" Passenger 2",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 112, 108, 108),
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.white54)),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset("assets/icons/heart-rate.svg",
                                    height: 20, width: 20, color: Colors.red),
                                SizedBox(
                                  height: 5,
                                ),
                                SvgPicture.asset(
                                    "assets/icons/temperature-high-solid-svgrepo-com.svg",
                                    height: 25,
                                    width: 25,
                                    color: Colors.orange),
                                SizedBox(
                                  height: 5,
                                ),
                                Image.asset(
                                  "assets/icons/oxi3.png",
                                  height: 35,
                                  width: 35,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                            //Label Column
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Heart Rate",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Temp",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Oximeter",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            //Values Column
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$P2displayheartRate',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '$P2displaytemp',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '$P2displayoximeter',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            //Normal&Abnormal Column
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                P2HeartRateCondition(),
                                SizedBox(
                                  height: 5,
                                ),
                                P2TemperatureCondition(),
                                SizedBox(
                                  height: 5,
                                ),
                                P2OximeterCondition(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Container(
                child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  TestButtonREf.set({'TestButton': 'on'});
                  Timer(Duration(seconds: 10), () {
                    TestButtonREf.update({'TestButton': 'off'});
                  });
                },
                child: Text(
                  "Test Now",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(width: 2, color: Color(0XFFC6372A)))),
                ),
              ),
            ))
          ],
        ),
      ),
    ));
  }

  void deactivate() {
    outputstream.cancel();
    super.deactivate();
  }
}

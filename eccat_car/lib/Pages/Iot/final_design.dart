import 'dart:async';
import 'dart:math';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../core/colors.dart';

class IoTPage extends StatefulWidget {
  const IoTPage({super.key});

  @override
  State<IoTPage> createState() => _IoTPageState();
}

class _IoTPageState extends State<IoTPage> {
  var refdb = FirebaseDatabase.instance.ref();
  dynamic display;
  dynamic break_display;
  dynamic light_display;
  dynamic batt_display;

  StreamController sc = StreamController();

  var cdm = FirebaseMessaging.instance;

  intialmessage() async {
    var m = await FirebaseMessaging.instance.getInitialMessage();
  }

  sebelisteners() {
    var sb = refdb.child('seatbelt/status').onValue.listen((event) {
      dynamic val = event.snapshot.value;
      setState(() {
        display = '$val';
      });
    });
  }

  breaklisteners() {
    refdb.child('breaks/1').onValue.listen((event) {
      dynamic b = event.snapshot.value;
      setState(() {
        break_display = '$b';
      });
    });
  }

  lightliseners() {
    refdb.child('light/2').onValue.listen((event) {
      dynamic l = event.snapshot.value;
      setState(() {
        light_display = l;
      });
    });
  }

  @override
  void initState() {
    lightliseners();
    breaklisteners();
    sebelisteners();

    super.initState();
  }

  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    var temp = refdb.child('temp');
    var light = refdb.child('light');
    var breaks = refdb.child('breaks');
    var seatbelt = refdb.child('seatbelt');
    var speed = refdb.child('speed');
    var battery = refdb.child('battery');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 1, 19, 34),
        title: Text("Iot",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: whiteText,
            )),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color.fromARGB(255, 1, 19, 34)),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                'battery',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
                child: Expanded(
                    child: Container(
                        child: StreamBuilder(
                            stream: refdb.child('battery/batt').onValue,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                dynamic b = 23;
                                double p = 0.5;
                                b = snapshot.data?.snapshot.value;
                                if (b > 20) {
                                  p = b / 100;
                                  return new CircularPercentIndicator(
                                    animationDuration: 4500,
                                    radius: 100.0,
                                    lineWidth: 25.0,
                                    animation: true,
                                    percent: p,
                                    center: new Text(
                                      "${b} %",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.0,
                                          color: Colors.white),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Colors.green,
                                  );
                                } else if (b <= 20) {
                                  p = b / 100;
                                  return new CircularPercentIndicator(
                                    animationDuration: 4500,
                                    radius: 100.0,
                                    lineWidth: 25.0,
                                    animation: true,
                                    percent: p,
                                    center: new Text("${b} %",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0,
                                            color: Colors.red)),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Colors.red,
                                  );
                                }
                              }
                              return new CircularPercentIndicator(
                                animationDuration: 4500,
                                radius: 100.0,
                                lineWidth: 25.0,
                                animation: true,
                                percent: 0.0,
                                center: new Text(
                                  "0 %",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      color: Colors.white),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.green,
                              );
                            })))),
            Column(children: [
              Container(
                margin: EdgeInsets.only(
                  top: 40,
                ),
                child: Text(
                  'SPeed',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              InkWell(
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 400,
                      height: 300,
                      child: Expanded(
                          child: Container(
                        child: StreamBuilder(
                            stream: refdb.child('speed/speed').onValue,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                dynamic num = 55.toDouble();
                                //  double f=0.1;
                                num = snapshot.data?.snapshot.value;

                                if (num >= 140) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          child: Icon(
                                            Icons.warning_rounded,
                                            size: 60,
                                            color: Colors.red,
                                          ),
                                        )),
                                        Expanded(
                                            child: Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                'speed is too high',
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        )),
                                      ],
                                    ),
                                  );
                                }
                                // return Container(
                                //   child: KdGaugeView(
                                //     fractionDigits: 1,
                                //     speedTextStyle: TextStyle(
                                //         fontSize: 50,
                                //         fontWeight: FontWeight.bold),
                                //     animate: true,
                                //     duration: Duration(seconds: 5),
                                //     minSpeed: 0.0,
                                //     minMaxTextStyle: TextStyle(fontSize: 20),
                                //     maxSpeed: 200,
                                //     speed: num,
                                //     unitOfMeasurementTextStyle:
                                //         TextStyle(fontSize: 20),
                                //   ),
                                // );

                                return SfRadialGauge(
                                  enableLoadingAnimation: true,
                                  animationDuration: 4500,
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      minimum: 0,
                                      maximum: 200,
                                      //  axisLineStyle:AxisLineStyle(color: Colors.white) ,
                                      axisLabelStyle: GaugeTextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),

                                      pointers: <GaugePointer>[
                                        NeedlePointer(
                                          needleColor: Colors.orange,
                                          value: num,
                                          enableAnimation: true,
                                        )
                                        //
                                      ],
                                      ranges: <GaugeRange>[
                                        GaugeRange(
                                          startValue: 0,
                                          endValue: 60,
                                          color: Colors.blue,
                                        ),
                                        GaugeRange(
                                          startValue: 60,
                                          endValue: 140,
                                          color: Colors.blue,
                                        ),
                                        GaugeRange(
                                          startValue: 140,
                                          endValue: 200,
                                          color: Colors.blue,
                                        )
                                      ],
                                      annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(
                                          widget: Text(
                                            '${num} K/H',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          positionFactor: 0.5,
                                          angle: 90,
                                        )
                                      ],
                                    )
                                  ],
                                  backgroundColor:
                                      Color.fromARGB(255, 1, 19, 34),
                                );
                              } else {
                                return Container(
                                  child: Text('data'),
                                );
                                // // return SfRadialGauge(
                                //   enableLoadingAnimation: true,
                                //   animationDuration: 4500,
                                //   axes: <RadialAxis>[
                                //     RadialAxis(
                                //       minimum: 0,
                                //       maximum: 200,
                                //       //  axisLineStyle:AxisLineStyle(color: Colors.white) ,
                                //       axisLabelStyle: GaugeTextStyle(
                                //           color: Colors.white,
                                //           fontWeight: FontWeight.bold),

                                //       pointers: <GaugePointer>[
                                //         NeedlePointer(
                                //           //needleColor: Colors.white,
                                //           value: 0,
                                //           enableAnimation: true,
                                //         )
                                //       ],
                                //       ranges: <GaugeRange>[
                                //         GaugeRange(
                                //           startValue: 0,
                                //           endValue: 60,
                                //           color: Colors.green,
                                //         ),
                                //         GaugeRange(
                                //           startValue: 60,
                                //           endValue: 140,
                                //           color: Colors.yellow,
                                //         ),
                                //         GaugeRange(
                                //           startValue: 140,
                                //           endValue: 200,
                                //           color: Colors.red,
                                //         )
                                //       ],
                                //       annotations: <GaugeAnnotation>[
                                //         GaugeAnnotation(
                                //           widget: Text(
                                //             '100K/H',
                                //             style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontSize: 25,
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //           positionFactor: 0.5,
                                //           angle: 90,
                                //         )
                                //       ],
                                //     )
                                //   ],
                                //   backgroundColor:
                                //       Color.fromARGB(255, 8, 21, 65),
                                // );
                              }
                            }),
                      )))),
              Divider(),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Seatbelt',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              InkWell(
                // onTap: () async {
                //   await seatbelt.set(
                //         {'status': 1});
                // },
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 3),
                      color: Color.fromARGB(255, 56, 56, 56),
                      borderRadius: BorderRadius.circular(120)),
                  width: 250,
                  height: 250,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'seat belt',
                          //   style: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          Divider(
                            height: 5,
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 10, right: 45),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(),
                              child: Icon(
                                size: 150,
                                Icons.airline_seat_recline_extra,
                                color: Colors.green,
                              ),
                            ),
                          ),

                          // Expanded(
                          //     child: Text(
                          //   '${display}',
                          //   style: TextStyle(
                          //     fontSize: 30,
                          //     color: Colors.red,
                          //   ),
                          // )),
                        ]),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ]),
          ]),
        ),
      ),
    );
  }
}

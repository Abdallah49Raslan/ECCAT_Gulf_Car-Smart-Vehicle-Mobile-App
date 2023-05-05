import 'dart:async';
import 'dart:math';
import 'package:eccat_car/core/text_style.dart';
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
    var sb = refdb.child('seatbelt/2').onValue.listen((event) {
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
    // var seatbelt = refdb.child('seatbelt');
    var speed = refdb.child('speed');
    var battery = refdb.child('battery');

    return Scaffold(
      backgroundColor: blackBG,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColorDark,
        title: Text(
          "IoT",
          style: headline1,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color(0xff2b2b2b)),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 20,),
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
                // onTap: () async {
                //   await battery.set({'batt': 30});
                // },
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
            Container(
                // margin: EdgeInsets.only(top: 10),
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  size: 30,
                  Icons.charging_station,
                  color: Colors.green,
                ),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      '14 minutes remaining',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ))
              ],
            )),
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
                  // onTap: () async {
                  //   await speed.set({'speed': 100});
                  // },
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
                                          //needleColor: Colors.white,
                                          value: num,
                                          enableAnimation: true,
                                        )
                                      ],
                                      ranges: <GaugeRange>[
                                        GaugeRange(
                                          startValue: 0,
                                          endValue: 60,
                                          color: Colors.green,
                                        ),
                                        GaugeRange(
                                          startValue: 60,
                                          endValue: 140,
                                          color: Colors.yellow,
                                        ),
                                        GaugeRange(
                                          startValue: 140,
                                          endValue: 200,
                                          color: Colors.red,
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
                                  backgroundColor: Color(0xff2b2b2b),
                                );
                              } else {
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
                                          //needleColor: Colors.white,
                                          value: 0,
                                          enableAnimation: true,
                                        )
                                      ],
                                      ranges: <GaugeRange>[
                                        GaugeRange(
                                          startValue: 0,
                                          endValue: 60,
                                          color: Colors.green,
                                        ),
                                        GaugeRange(
                                          startValue: 60,
                                          endValue: 140,
                                          color: Colors.yellow,
                                        ),
                                        GaugeRange(
                                          startValue: 140,
                                          endValue: 200,
                                          color: Colors.red,
                                        )
                                      ],
                                      annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(
                                          widget: Text(
                                            '100K/H',
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
                                      Color.fromARGB(255, 8, 21, 65),
                                );
                              }
                            }),
                      )))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    // onTap: () async {
                    //   await temp.set({'temp': '20'});
                    // },
                    child: Container(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 56, 56, 56),
                          borderRadius: BorderRadius.circular(15)),
                      width: 150,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'temprature',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            height: 5,
                          ),
                          Text(
                            'engine',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            height: 20,
                          ),
                          Expanded(
                            child: Container(
                              child: StreamBuilder(
                                  stream: refdb.child('temp/temp').onValue,
                                  builder: ((context, snapshot) {
                                    dynamic t = 23;
                                    if (snapshot.hasData) {
                                      t = snapshot.data?.snapshot.value;
                                      if (t <= 43) {
                                        return Text(
                                          '${t} c',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 50),
                                        );
                                      } else if (t > 43) {
                                        return Text(
                                          '${t} c',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 50),
                                        );
                                      }
                                      return Text(
                                        '${t} c',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 50),
                                      );
                                    }
                                    return Text(
                                      '0 c',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 50),
                                    );
                                  })),
                              // child: FirebaseAnimatedList(
                              //     query: refdb.child('temp'),
                              //     itemBuilder:
                              //         (context, snapshot, animation, index) {
                              //       return Text(
                              //         '${snapshot.value ?? ['temp']} c',
                              //         style: TextStyle(
                              //             color: Colors.green,
                              //             fontSize: 50,
                              //             fontWeight: FontWeight.bold),
                              //       );
                              //      }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    // onTap: () async {
                    //   await light.set({'1': 'on', '2': 'off'});
                    // },
                    child: Container(
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 56, 56, 56),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'headlight',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://cdn-icons-png.flaticon.com/128/1633/1633109.png')))),
                          Divider(
                            height: 5,
                          ),
                          Expanded(
                            child: Text(
                              '${light_display}',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 35,
                              ),
                            ),
                            //     child: Container(
                            //   child: FirebaseAnimatedList(
                            //     query: refdb.child('light'),
                            //     itemBuilder:
                            //         (context, snapshot, animation, index) {
                            //       return Text(
                            //         '${snapshot.child('light').value ?? ['1']}',
                            //         style: TextStyle(
                            //             fontSize: 40,
                            //             color: Colors.green,
                            //             fontWeight: FontWeight.bold),
                            //       );
                            //     },
                            //   ),
                            // )
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                    // onTap: () async {
                    //   await breaks.set({'1': 'exellent', '2': 'breakdown'});
                    // },
                    child: Container(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 56, 56, 56),
                            borderRadius: BorderRadius.circular(15)),
                        width: 150,
                        height: 200,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'breaks',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(
                                height: 5,
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://cdn-icons-png.flaticon.com/128/5670/5670596.png')))),
                              Divider(
                                height: 2,
                              ),
                              Expanded(
                                  child: Text(
                                '${break_display}',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.green,
                                ),
                              )
                                  // child: FirebaseAnimatedList(
                                  //     query: refdb.child('breaks').child('1'),
                                  //     itemBuilder: (context, snapshot,
                                  //         animation, Index) {
                                  //       return Text(
                                  //         '${snapshot.value}',
                                  //         style: TextStyle(
                                  //             fontSize: 25,
                                  //             color: Colors.green,
                                  //             fontWeight: FontWeight.bold),
                                  //       );
                                  //     }),

                                  )
                            ]))),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () async {
                    // await seatbelt.set(
                    //     {'1': 'active', '2': 'inactive'});
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 56, 56, 56),
                        borderRadius: BorderRadius.circular(15)),
                    width: 150,
                    height: 200,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'seat belt',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/128/1996/1996052.png'))),
                          ),
                          Divider(height: 20),
                          Expanded(
                              child: Text(
                            '${display}',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                            ),
                          )
                              // FirebaseAnimatedList(
                              //     query: refdb.child('seatbelt').child('status two'),
                              //     itemBuilder: (context, snapshot,
                              //         animation, Index) {
                              //       return Text(
                              //         '${snapshot.child('seatbelt').value ??['status two']

                              //             }',
                              //         style: TextStyle(
                              //             fontSize: 25,
                              //             color: Colors.red,
                              //             fontWeight: FontWeight.bold),
                              //       );
                              //     })
                              ),
                        ]),
                  ),
                ),
              ]),
            ]),
          ]),
        ),
      ),
    );
  }
}

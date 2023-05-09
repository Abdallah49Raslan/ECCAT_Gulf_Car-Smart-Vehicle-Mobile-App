// ignore_for_file: prefer_const_constructors, deprecated_member_use, camel_case_types, prefer_final_fields, unused_field, avoid_single_cascade_in_expression_statements
import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:eccat_car/Pages/AI/controller/controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import '../../core/colors.dart';
import '../../core/text_style.dart';
import '../started_pages/Driver/entry_Driver.dart';

class Car_page extends StatefulWidget {
  const Car_page({super.key});

  @override
  State<Car_page> createState() => _Car_pageState();
}

class _Car_pageState extends State<Car_page> {
  Query dpRef = FirebaseDatabase.instance.ref().child('bump');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('bump');

  Query LeftLane = FirebaseDatabase.instance.ref().child('LeftLane');
  DatabaseReference Left = FirebaseDatabase.instance.ref().child('LeftLane');

  Query RightLane = FirebaseDatabase.instance.ref().child('RightLane');
  DatabaseReference Right = FirebaseDatabase.instance.ref().child('RightLane');

  bool leftside = false;
  bool rightside = false;
  final _controller = Get.find<controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, BoxConstraints) {
            return Stack(
              alignment: Alignment.center,
              children: [
                //bump detection
                FirebaseAnimatedList(
                  query: dpRef.limitToFirst(1),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    if (snapshot.child('action1').value == '222') {
                      // _controller.sendNotification();
                    }

                    return Builder(builder: (context) {
                      Timer(Duration(seconds: 7), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EntryDriver(
                                    initialIndex: 0,
                                  )),
                        );
                      });
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.amber),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(70))),
                                    ),
                                    onPressed: () {},
                                    child: null,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.amber),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(70))),
                                    ),
                                    onPressed: () {},
                                    child: null,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.amber),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(70))),
                                    ),
                                    onPressed: () {},
                                    child: null,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.amber),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(70))),
                                    ),
                                    onPressed: () {},
                                    child: null,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.amber),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(70))),
                                    ),
                                    onPressed: () {},
                                    child: null,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                      // Container(width: double.maxFinite,
                      //   margin: EdgeInsets.only(
                      //     top: 0,
                      //   ),
                      //   child: SafeArea(
                      //     child: SvgPicture.asset(
                      //       'assets/icons/bump1.svg',
                      //       color: Colors.amber,
                      //       width: 100.w,
                      //     ),
                      //   ),
                      // );
                    });
                  },
                ),

                FirebaseAnimatedList(
                  query: dpRef.limitToFirst(1),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    Timer(Duration(seconds: 7), () {
                      if (snapshot.child('action1').value == '222') {
                        reference.remove();
                      }
                    });

                    return Container(
                      child: Text('Finished'),
                    );

                    // return listItem(Lane: Lane);
                  },
                ),

                // LeftLane
                FirebaseAnimatedList(
                  query: LeftLane.limitToFirst(2),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    if (snapshot.child('LeftAction').value == '444') {
                      // _controller.rightNotification();
                    }

                    return Builder(builder: (context) {
                      // AwesomeDialog(
                      //   context: context,
                      //   dialogType: DialogType.error,
                      //   animType: AnimType.rightSlide,
                      //   title: 'Warning',
                      //   desc: 'Turn a little to the left',
                      //   showCloseIcon: true,
                      //   btnCancelOnPress: () {},
                      //   btnOkOnPress: () {},
                      // )..show();

                      Timer(Duration(seconds: 7), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EntryDriver(
                                    initialIndex: 0,
                                  )),
                        );
                      });
                      return Container(
                        alignment: Alignment.topRight,
                        child: Positioned(
                            right: MediaQuery.of(context).size.width / 3,
                            bottom: MediaQuery.of(context).size.height / 3.h,
                            height: 300.h,
                            width: 200.h,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                'assets/icons/Car.svg',
                                color: Colors.red,
                                height: 400.h,
                                width: double.infinity,
                              ),
                            )),
                      );
                    });
                  },
                ),

                FirebaseAnimatedList(
                  query: LeftLane.limitToFirst(1),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    Timer(Duration(seconds: 7), () {
                      if (snapshot.child('LeftAction').value == '444') {
                        Left.remove();
                      }
                    });

                    return Container();

                    // return listItem(Lane: Lane);
                  },
                ),

                //RightLane
                FirebaseAnimatedList(
                  query: RightLane.limitToFirst(2),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    if (snapshot.child('RightAction').value == '333') {
                      // _controller.setNotification();
                    }

                    return Builder(builder: (context) {
                      // AwesomeDialog(
                      //   context: context,
                      //   dialogType: DialogType.error,
                      //   animType: AnimType.rightSlide,
                      //   title: 'Warning',
                      //   desc: 'Turn a little to the left',
                      //   showCloseIcon: true,
                      //   btnCancelOnPress: () {},
                      //   btnOkOnPress: () {},
                      // )..show();

                      Timer(Duration(seconds: 7), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EntryDriver(
                                    initialIndex: 0,
                                  )),
                        );
                      });
                      return Container(
                        alignment: Alignment.topLeft,
                        child: Positioned(
                            left: MediaQuery.of(context).size.width / 3,
                            bottom: MediaQuery.of(context).size.height / 3.h,
                            height: 300.h,
                            width: 200.h,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                'assets/icons/Car.svg',
                                color:
                                    leftside ? Colors.red : Colors.transparent,
                                height: 400.h,
                                width: double.infinity,
                              ),
                            )),
                      );
                    });
                  },
                ),

                FirebaseAnimatedList(
                  query: RightLane.limitToFirst(1),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    Timer(Duration(seconds: 7), () {
                      if (snapshot.child('RightAction').value == '333') {
                        Right.remove();
                      }
                    });

                    return Container();

                    // return listItem(Lane: Lane);
                  },
                ),

                Center(
                  child: Positioned(
                      left: MediaQuery.of(context).size.width / 2.4,
                      top: MediaQuery.of(context).size.height / 30,
                      height: 500.h,
                      width: 200.h,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/icons/Car.svg',
                          height: 500.h,
                          width: double.infinity,
                        ),
                      )),
                ),

                // Test Car left
                Container(
                  alignment: Alignment.topLeft,
                  child: Positioned(
                      left: MediaQuery.of(context).size.width / 3,
                      bottom: MediaQuery.of(context).size.height / 3.h,
                      height: 300.h,
                      width: 200.h,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/icons/Car.svg',
                          color: leftside ? Colors.red : Colors.transparent,
                          height: 400.h,
                          width: double.infinity,
                        ),
                      )),
                ),

                //Test car Right
                Container(
                  alignment: Alignment.topRight,
                  child: Positioned(
                      right: MediaQuery.of(context).size.width / 3,
                      bottom: MediaQuery.of(context).size.height / 3.h,
                      height: 300.h,
                      width: 200.h,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/icons/Car.svg',
                          color: rightside ? Colors.red : Colors.transparent,
                          height: 400.h,
                          width: double.infinity,
                        ),
                      )),
                ),

                // Right Lane up
                Positioned(
                    left: MediaQuery.of(context).size.width / 1.8,
                    top: MediaQuery.of(context).size.height / 35,
                    height: 250.h,
                    width: 200.h,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/icons/verticalline.svg',
                        color: rightside ? Colors.red : Colors.white54,
                        height: 500.h,
                        width: double.infinity,
                      ),
                    )),
                // Right Lane down
                Positioned(
                    left: MediaQuery.of(context).size.width / 1.8,
                    top: MediaQuery.of(context).size.height / 4.5,
                    height: 500.h,
                    width: 200.h,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/icons/verticalline.svg',
                        color: Colors.white54,
                        height: 500.h,
                        width: double.infinity,
                      ),
                    )),

                // Left Lane up

                Positioned(
                    right: MediaQuery.of(context).size.width / 1.8,
                    top: MediaQuery.of(context).size.height / 35,
                    height: 250.h,
                    width: 200.h,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/icons/verticalline.svg',
                        color: leftside ? Colors.red : Colors.white54,
                        height: 500.h,
                        width: double.infinity,
                      ),
                    )),

                // Left Lane down
                Positioned(
                    right: MediaQuery.of(context).size.width / 1.8,
                    top: MediaQuery.of(context).size.height / 4.5,
                    height: 500.h,
                    width: 200.h,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/icons/verticalline.svg',
                        color: Colors.white54,
                        height: 500.h,
                        width: double.infinity,
                      ),
                    )),
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                leftside = !leftside;
                                _controller.setNotification();
                                Timer(Duration(seconds: 7), () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const EntryDriver(
                                              initialIndex: 0,
                                            )),
                                  );
                                  // Get.offAll(EntryDriver(initialIndex: 2,));
                                });
                                //                 // Timer(Duration(seconds: 5), () {});
                              });
                            },
                            child: Icon(
                              Icons.warning,
                              // color: Color(0xFFFF5368),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _controller.sendNotification();
                              setState(() {
                                rightside = !rightside;
                                Timer(Duration(seconds: 7), () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const EntryDriver(
                                              initialIndex: 0,
                                            )),
                                  );
                                });
                              });
                            },
                            child: Text('Ai'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _controller.rightNotification();

                              setState(() {
                                rightside = !rightside;
                              });
                            },
                            child: Text('Right'),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
//  'favoit',
//           style: TextStyle(fontSize: 50),

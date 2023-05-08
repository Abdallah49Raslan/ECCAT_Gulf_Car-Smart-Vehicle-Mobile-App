// ignore_for_file: camel_case_types
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eccat_car/Pages/AI/car_page.dart';
import 'package:eccat_car/Pages/AI/home_Page.dart';
import 'package:eccat_car/Pages/AI/person_page.dart';
import 'package:eccat_car/Pages/AI/search_page.dart';
import 'package:eccat_car/Pages/Health%20Care/darkmode.dart';
import 'package:eccat_car/Pages/started_pages/Driver/driverstart.dart';
import 'package:eccat_car/functions/alertexitapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Pages/Iot/iot.dart';

class homescren extends StatefulWidget {
  final int initialIndex; // add initialIndex parameter

  const homescren({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<homescren> createState() => _homescrenState();
}

class _homescrenState extends State<homescren> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  final screens = [
    DriverStartPage(),
    HealthCareDriver(),
    Car_page(),
    IoTPage(),
    SearchPage(),
  ];

  final items = <Widget>[
    Icon(
      Icons.home,
      size: 30.h,
    ),
    Icon(
      CupertinoIcons.heart_slash_circle_fill,
      size: 30.h,
    ),
    Icon(
      CupertinoIcons.car_detailed,
      size: 30.h,
    ),
    Icon(
      Icons.iso_outlined,
      size: 30.h,
    ),
    Icon(
      Icons.app_blocking,
      size: 30.h,
    ),
  ];
  late int index;
  
@override
  void initState() {
    super.initState();
    index = widget.initialIndex; // set initial value here
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        // SystemUiOverlayStyle.light,
        SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light));
    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            // backgroundColor: Colors.yellow,
            // appBar: AppBar(
            backgroundColor: Colors.black,
            //   bottomOpacity: 5.1,
            //   // foregroundColor: Colors.red,
            //   // title: Text(
            //   //   '',
            //   //   style: TextStyle(fontSize: 30.sp),
            //   // ),
            //   centerTitle: true,
            // ),
            // drawer: Drawer(
            //   child: Menu(),
            // ),
            // drawerScrimColor: Colors.amber,
            // Image.asset(
            //   'assets/11111.jfif',
            //   height: double.infinity,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            //     Column(
            //   children: [
            //     Center(
            //       child: Text(
            //         '$index',
            //         style: TextStyle(color: Colors.red, fontSize: 100),
            //       ),
            //     ),
            //     ElevatedButton(
            //         onPressed: () {
            //           final navigationState = navigationKey.currentState!;
            //           navigationState.setPage(0);
            //         },
            //         child: Text('go to'))
            //   ],
            // ),
            body: screens[index],

            bottomNavigationBar: Theme(
                data: Theme.of(context)
                    .copyWith(iconTheme: IconThemeData(color: Colors.white)),
                child: WillPopScope(
                  onWillPop: alertExitApp,
                  child: CurvedNavigationBar(
                    key: navigationKey,
                    color: Colors.black,
                    buttonBackgroundColor: Colors.blue,
                    backgroundColor: Colors.transparent,
                    height: 60,
                    animationCurve: Curves.easeInOut,
                    animationDuration: Duration(milliseconds: 600),
                    items: items,
                    index: index,
                    onTap: (index) {
                      setState(() {
                        this.index = index;
                      });
                    },
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

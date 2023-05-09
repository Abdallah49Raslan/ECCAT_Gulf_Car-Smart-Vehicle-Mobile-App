// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAPP extends StatefulWidget {
  const AboutAPP({super.key});

  @override
  State<AboutAPP> createState() => _SearchPageState();
}

class _SearchPageState extends State<AboutAPP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Information About App',
              style: TextStyle(fontSize: 30.sp),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SafeArea(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      // barrierColor: Colors.blue,

                      context: context,
                      builder: (BuildContext context) {
                        return AboutDialog(
                          applicationIcon: FlutterLogo(
                            size: 60,
                          ),
                          applicationLegalese: 'legalese',
                          applicationVersion: 'version 1.0.0',
                          applicationName: 'Golf Car',
                          children: [
                            Text(
                              'This App created by Abdel Rahman Said',
                              style: TextStyle(fontSize: 30.sp),
                            ),
                          ],
                        );
                      });
                },
                child: Text(
                  'Push',
                  style: TextStyle(fontSize: 50.sp),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 110)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60))),
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

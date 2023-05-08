// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:io' show exit;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Warning",
      middleText: 'you want to Exit App',
      middleTextStyle: TextStyle(color: Colors.blue, fontSize: 22.sp),
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: Text(
            'yes',
            style: TextStyle(fontSize: 20.sp),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 22.w)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60))),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'No',
            style: TextStyle(fontSize: 20.sp),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60))),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
      ]);
  return Future.value(true);
}

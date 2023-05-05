import 'dart:async';
import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/colors.dart';
import '../../core/globalvariables.dart';
import 'HealthConditions.dart';


Widget passenger2grid() {
  return Container(
    padding: EdgeInsets.only(right: 5, left: 1),
    decoration: BoxDecoration(
      color: Colors.white10,
      border: Border.all(color: borderColor, width: 2),
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
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
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
                      color: Colors.white),
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
                      color: Colors.white),
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
                      color: Colors.white),
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
                    color: Colors.white,
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
                    color: Colors.white,
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
                    color: Colors.white,
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
  );
}

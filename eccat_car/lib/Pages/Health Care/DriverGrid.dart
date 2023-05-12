import 'dart:async';
import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/colors.dart';
import '../../core/globalvariables.dart';
import 'HealthConditions.dart';

Widget drivergrid() {
  return Builder(builder: (context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 5, left: 1),
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Text(" Driver",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 10.h,
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
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Alcohol",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                width: 15.h,
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
                      color: Colors.white,
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
                      color: Colors.white,
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
                      color: Colors.white,
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
                  DAlcoholCondition(),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  });
}

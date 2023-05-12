import 'dart:async';
import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/colors.dart';
import '../../core/globalvariables.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Widget DTemperatureCondition() {
  if (Ddisplaytemp == null || Ddisplaytemp == 0) {
    return Text(".........",
        style: TextStyle(
          color: Colors.white,
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
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 1,
      channelKey: "schedule",
      title: "Emergency",
      body: "Driver's Temperature is abnormal ",
      bigPicture: "asset://assets/icons/tempnoti.png",
      notificationLayout: NotificationLayout.BigPicture,
      largeIcon: "asset://assets/icons/tempnoti.png",
      wakeUpScreen: true,
      locked: true,
      displayOnBackground: true,
      actionType: ActionType.Default,
    ));
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
          color: Colors.white,
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
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 20,
      channelKey: "schedule",
      title: "Emergency",
      body: "Passenger1's Temperature is abnormal ",
      bigPicture: "asset://assets/icons/tempnoti.png",
      notificationLayout: NotificationLayout.BigPicture,
      largeIcon: "asset://assets/icons/tempnoti.png",
      wakeUpScreen: true,
      locked: true,
      displayOnBackground: true,
      actionType: ActionType.Default,
    ));
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
          color: Colors.white,
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
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 21,
      channelKey: "schedule",
      title: "Emergency",
      body: "Passenger2's Temperature is abnormal ",
      bigPicture: "asset://assets/icons/tempnoti.png",
      notificationLayout: NotificationLayout.BigPicture,
      largeIcon: "asset://assets/icons/tempnoti.png",
      wakeUpScreen: true,
      locked: true,
      displayOnBackground: true,
      actionType: ActionType.Default,
    ));
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
          color: Colors.white,
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
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 22,
      channelKey: "schedule",
      title: "Emergency",
      body: "Driver's Heart rate is abnormal ",
      bigPicture: "asset://assets/icons/heartnoti.png",
      notificationLayout: NotificationLayout.BigPicture,
      largeIcon: "asset://assets/icons/heartnoti.png",
      wakeUpScreen: true,
      locked: true,
      displayOnBackground: true,
      actionType: ActionType.Default,
    ));
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
          color: Colors.white,
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
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 23,
      channelKey: "schedule",
      title: "Emergency",
      body: "Passenger1's Heart rate is abnormal ",
      bigPicture: "asset://assets/icons/heartnoti.png",
      notificationLayout: NotificationLayout.BigPicture,
      largeIcon: "asset://assets/icons/heartnoti.png",
      wakeUpScreen: true,
      locked: true,
      displayOnBackground: true,
      actionType: ActionType.Default,
    ));
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
          color: Colors.white,
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
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 24,
      channelKey: "schedule",
      title: "Emergency",
      body: "Passenger2's Heart rate is abnormal ",
      bigPicture: "asset://assets/icons/heartnoti.png",
      notificationLayout: NotificationLayout.BigPicture,
      largeIcon: "asset://assets/icons/heartnoti.png",
      wakeUpScreen: true,
      locked: true,
      displayOnBackground: true,
      actionType: ActionType.Default,
    ));
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
          color: Colors.white,
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
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 25,
      channelKey: "schedule",
      title: "Emergency",
      body: "Driver's Oximeter is abnormal ",
      bigPicture: "asset://assets/icons/oximeternotif.png",
      notificationLayout: NotificationLayout.BigPicture,
      largeIcon: "asset://assets/icons/oximeternotif.png",
      wakeUpScreen: true,
      locked: true,
      displayOnBackground: true,
      actionType: ActionType.Default,
    ));
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
          color: Colors.white,
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
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 26,
      channelKey: "schedule",
      title: "Emergency",
      body: "Passenger1's Oximeter is abnormal ",
      bigPicture: "asset://assets/icons/oximeternotif.png",
      notificationLayout: NotificationLayout.BigPicture,
      largeIcon: "asset://assets/icons/oximeternotif.png",
      wakeUpScreen: true,
      locked: true,
      displayOnBackground: true,
      actionType: ActionType.Default,
    ));
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
          color: Colors.white,
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
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 27,
      channelKey: "schedule",
      title: "Emergency",
      body: "Passenger2's Oximeter is abnormal ",
      bigPicture: "asset://assets/icons/oximeternotif.png",
      notificationLayout: NotificationLayout.BigPicture,
      largeIcon: "asset://assets/icons/oximeternotif.png",
      wakeUpScreen: true,
      locked: true,
      displayOnBackground: true,
      actionType: ActionType.Default,
    ));
    return Text('$P2oxi',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0XFFC6372A),
        ));
  }
}

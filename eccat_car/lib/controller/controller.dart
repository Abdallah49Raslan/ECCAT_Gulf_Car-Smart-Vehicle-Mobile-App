import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class controller extends GetxController {
  void sendNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 2,
      channelKey: 'schedule',
      title: 'bumb // bump // bump',
      body: 'هناك مطب علي بضعه امتار', displayOnForeground: true,

      backgroundColor: Colors.green,
      // لازم اللي اتنين اللي تحت بعد عشان اظهر الصوره
      bigPicture: "asset://assets/noty.png",
      notificationLayout: NotificationLayout.BigPicture,
      // الايكون اللي علي اليمين
      largeIcon: 'asset://assets/images/noty.png',
      customSound: "asset://assets/bump",
      wakeUpScreen: true,
      // locked: true,
      displayOnBackground: true,
      actionType: ActionType.Default,
      // بتخلي الرساله مش بتروح
      //  fullScreenIntent: false
      ticker: "asset://raw/bump",
    ));
  }

  //  void leftNotification() {
  //   AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  //     if (isAllowed) {
  //       AwesomeNotifications().requestPermissionToSendNotifications();
  //     }
  //   });
  //   AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //     id: 2,
  //     channelKey: 'schedule',
  //      title: 'bumb // bump // bump',
  //    body: 'jjagcagjgdajر', displayOnForeground: true,

  //     backgroundColor: Colors.green,
  //     // لازم اللي اتنين اللي تحت بعد عشان اظهر الصوره
  //      bigPicture: "asset://assets/noty.png",
  //     notificationLayout: NotificationLayout.BigPicture,
  //       // الايكون اللي علي اليمين
  //      largeIcon: 'asset://assets/images/2.jpeg',
  //      customSound: "asset://assets/bump",
  //      wakeUpScreen: true,
  //     // locked: true,
  //      displayOnBackground: true,
  //      actionType: ActionType.Default,
  //         // بتخلي الرساله مش بتروح
  //      //  fullScreenIntent: false
  //     //  ticker: "asset://raw/bump",

  //   ));
  // }

  void rightNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 2,
      channelKey: 'schedule',
      title: 'Turn right // Turn right // Turn right',
      body: 'اتجه قليلا الي اليمين',

      backgroundColor: Colors.green,
      // لازم اللي اتنين اللي تحت بعد عشان اظهر الصوره
      bigPicture: "asset://assets/Hot_glow_4.png",
      notificationLayout: NotificationLayout.BigPicture,
      // الايكون اللي علي اليمين
      largeIcon: 'asset://assets/images/Hot_glow_4.png',
      customSound: "asset://assets/bump",
      wakeUpScreen: true,
      locked: true,
      displayOnBackground: true,
      actionType: ActionType.Default,
      // بتخلي الرساله مش بتروح
      //  fullScreenIntent: false
      ticker: "asset://raw/bump",
    ));
  }

  void setNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 2,
          channelKey: 'schedule',
          criticalAlert: true,
          title: 'Turn left // Turn left // Turn left',
          body: 'اتجه قليلا الي اليسار',
          backgroundColor: Colors.green,
          // لازم اللي اتنين اللي تحت بعد عشان اظهر الصوره
          bigPicture: "asset://assets/Hot_glow_4.png",
          notificationLayout: NotificationLayout.BigPicture,
          // الايكون اللي علي اليمين
          largeIcon: 'asset://assets/images/Hot_glow_4.png',
          customSound: "asset://assets/bump",
          wakeUpScreen: true,
          locked: true,
          displayOnBackground: true,
          actionType: ActionType.Default,
          // بتخلي الرساله مش بتروح
          //  fullScreenIntent: false
          //  ticker: "asset://raw/bump",

          // bigPicture: "asset://assets/aaa.png",
          // notificationLayout: NotificationLayout.BigPicture,
          color: Colors.red),

      // schedule: NotificationCalendar.fromDate(date: DateTime.now().add(Duration(seconds: 2)))
    );
  }
}

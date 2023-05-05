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
      id: 1,
      channelKey: 'test',
      title: 'bumb // bump // bump',
      body: 'هناك مطب علي بضعه امتار', displayOnForeground: true,
      // criticalAlert: true,
      //لون اسم البرنامج
      backgroundColor: Colors.green,
      // لازم اللي اتنين اللي تحت بعد عشان اظهر الصوره
      bigPicture: "asset://assets/noty.png",
      notificationLayout: NotificationLayout.BigPicture,
        // الايكون اللي علي اليمين 
       largeIcon: 'asset://assets/images/2.jpeg',
       customSound: "resource://raw/bump",
       wakeUpScreen: true,
      //  locked: true,
      //  displayOnBackground: true,
       actionType: ActionType.Default,
          // بتخلي الرساله مش بتروح    
       //  fullScreenIntent: false
       ticker: "asset://raw/bump",

    ));
  }

   void leftNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 2,
      channelKey: 'left',
      title: 'Turn right // Turn right // Turn right',
      body: 'اتجه قليلا الي اليمين', 
     
    
      backgroundColor: Colors.green,
      // لازم اللي اتنين اللي تحت بعد عشان اظهر الصوره
      bigPicture: "asset://assets/Hot_glow_4.png",
      notificationLayout: NotificationLayout.BigPicture,
        // الايكون اللي علي اليمين 
       largeIcon: 'asset://assets/images/2.jpeg',
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
}

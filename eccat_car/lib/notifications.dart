
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:eccat_car/Pages/AI/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final _controller = Get.find<controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    AwesomeNotifications()
                        .requestPermissionToSendNotifications();
                  },
                  child: Text('requst perimision')),
              ElevatedButton(
                  onPressed: () {
                    AwesomeNotifications().createNotification(
                        content: NotificationContent(
                      id: 5, channelKey: 'firstkey',
                      title: 'test ',
                      body: 'test body notification',
                      bigPicture: 'assets/11111.jfif',
                      

                      notificationLayout: NotificationLayout.BigPicture,
                      // showWhen: true,
                    ));
                  },
                  child: Text('create')),
              ElevatedButton(
                  onPressed: () {
                    AwesomeNotifications().createNotification(
                      content: NotificationContent(
                          id: 11,
                          channelKey: 'schedule',
                          title: 'schedule title',
                          body: 'schedule body notification',
                          bigPicture: "asset://assets/noty.png",
                          notificationLayout: NotificationLayout.BigPicture,
                          payload: {'asset://raw/bump.mp3': '1234567890'},
                          largeIcon: 'asset://assets/images/2.jpeg',
                          //  backgroundColor: Colors.amber,
                          color: Colors.red),
                      // schedule: NotificationCalendar.fromDate(date: DateTime.now().add(Duration(seconds: 2)))
                    );
                  },
                  child: Text('schedule')),
            ],
          ),
        ),
      ),
    );
  }
}

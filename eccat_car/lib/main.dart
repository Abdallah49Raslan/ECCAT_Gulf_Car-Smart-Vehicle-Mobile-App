import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:eccat_car/Pages/AI/controller/controller.dart';
import 'package:eccat_car/Pages/AI/controller/controller_bindings.dart';
import 'package:eccat_car/Pages/started_pages/Driver/Driver_start.dart';
import 'package:eccat_car/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'Pages/Health Care/darkmode.dart';
import 'Pages/started_pages/Driver/entry_Driver.dart';
import 'Pages/started_pages/Owner/entry_Owner.dart';
import 'logic/auth.dart';
import 'onboding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AwesomeNotifications().initialize(
      // 'res://drawable/noty',
      // 'res://raw/bump.mp3'
      null,
      [
        // NotificationChannel(
        //   channelKey: 'test',
        //   channelName: 'test',
        //   channelDescription: 'notification for test',
        //   playSound: true,
        //   soundSource: 'resource://raw/bump',
        //   // channelShowBadge: true,
        //   importance: NotificationImportance.High,
        //   criticalAlerts: true,
        //   enableLights: true,
        //   enableVibration: true,
        // ),

        // NotificationChannel(
        //   channelKey: 'leftchannel',
        //   channelName: 'left',
        //   channelDescription: 'notification for test',
        //   playSound: true,
        //    channelShowBadge: true,

        // enableLights: true,
        // enableVibration: true,
        // onlyAlertOnce: true,

        // importance: NotificationImportance.High,
        // ledColor: Colors.green
        // ),

        NotificationChannel(
            channelKey: 'schedule',
            channelName: 'schchannel',
            channelDescription: ' schdule notification for test',
            playSound: true,
            //  soundSource: 'https://soundcloud.com/moustfadiab/6nqfm1olmwci?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing',
            // soundSource: 'asset://assets/bump.mp3',
            channelShowBadge: true,
            enableLights: true,
            enableVibration: true,
            onlyAlertOnce: true,
            importance: NotificationImportance.High,
            ledColor: Colors.green),

        //     NotificationChannel(
        //   channelKey: 'basickey',
        //   channelName: 'testchannel',
        //   channelDescription: 'notification for test',
        //   playSound: true,
        //   soundSource: 'resource://raw/bump',
        //   channelShowBadge: true,
        //   importance: NotificationImportance.High,

        //     enableLights: true,
        //     enableVibration: true,
        //     onlyAlertOnce: true,
        // ),
        NotificationChannel(
            channelKey: 'leftlane',
            channelName: 'leftlane',
            channelDescription: ' schdule notification for gest',
            playSound: true,
            //  soundSource: 'https://soundcloud.com/moustfadiab/6nqfm1olmwci?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing',
            // soundSource: 'asset://assets/bump.mp3',
            channelShowBadge: true,
            enableLights: true,
            enableVibration: true,
            onlyAlertOnce: true,
            importance: NotificationImportance.High,
            ledColor: Colors.green),
      ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final _controller = Get.lazyPut(() => controller());
        return GetMaterialApp(
          initialBinding: controllerBindings(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            // scaffoldBackgroundColor: Colors.black,
          ),
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          // ),
          home: child,
        );
      },
      child: AuthPage(),
    );
  }
}

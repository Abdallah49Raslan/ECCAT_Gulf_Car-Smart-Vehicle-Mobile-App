import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'Pages/AI/controller/controller.dart';
import 'Pages/AI/controller/controller_bindings.dart';
import 'firebase_options.dart';
import 'onboding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'test',
        channelName: 'test',
        channelDescription: 'notification for test',
        importance: NotificationImportance.High,
        criticalAlerts: true,
        enableLights: true,
        enableVibration: true,
      ),
      NotificationChannel(
        channelKey: 'left',
        channelName: 'left',
        channelDescription: 'notification for test',
        channelShowBadge: true,
        importance: NotificationImportance.High,
        criticalAlerts: true,
        enableLights: true,
        enableVibration: true,
      ),
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          home: child,
        );
      },
      child: OnboardingScreen(),
    );
  }
}

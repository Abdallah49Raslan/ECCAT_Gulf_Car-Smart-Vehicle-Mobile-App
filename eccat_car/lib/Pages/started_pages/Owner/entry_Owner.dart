import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eccat_car/Pages/home/components/animated_bar.dart';
import 'package:eccat_car/Pages/started_pages/Customer/Custom_start.dart';
import 'package:eccat_car/Pages/started_pages/Driver/Driver_start.dart';
import 'package:eccat_car/Pages/started_pages/Owner/Owner_start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import '../../../core/colors.dart';
import '../../../core/rive_utils.dart';
import '../../../functions/alertexitapp.dart';
import '../../../lists/search.dart';
import '../../AI/car_page.dart';
import '../../AI/search_page.dart';
import '../../Health Care/Passenger1.dart';
import '../../Health Care/darkmode.dart';
import '../../Security/Detection.dart';
import '../../Security/Face_reco.dart';
import '../../User_Profile.dart';
import '../../home/components/side_menu.dart';
import '../../home/models/menu_btn.dart';
import '../../home/models/rive_asset.dart';
import '../../Iot/iot.dart';

// We are done with our 5th and last episode
// Thank you so much for watching entire serise
// Bye

class EntryOwner extends StatefulWidget {
  final int initialIndex;

  const EntryOwner({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<EntryOwner> createState() => _EntryOwnerState();
}

class _EntryOwnerState extends State<EntryOwner>
    with SingleTickerProviderStateMixin {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  // Let's chnage the name
  late SMIBool isSideBarClosed;

  bool isSideMenuClosed = true;
  int currentpages = 0;
  final screens = [
    FaceReco(),
    HealthCareDriver(),
    OwnerStartPage(),
    AboutAPP(),
  ];

  final items = <Widget>[
    Icon(
      CupertinoIcons.video_camera_solid,
      size: 30.h,
    ),
    Icon(
      CupertinoIcons.heart_slash_circle_fill,
      size: 30.h,
    ),
    Icon(
      Icons.home,
      size: 30.h,
    ),
    Icon(
      Icons.app_blocking,
      size: 30.h,
    ),
  ];

  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        // It's time to add the SideMenu
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isSideMenuClosed ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu(),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: screens[index],
                ),
              ),
            ),
          ),
          // As you can see it's an ANimated button
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed ? 0 : 220,
            top: 16,
            child: MenuBtn(
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                    artboard,
                    stateMachineName: "State Machine");
                isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                // Now it's easy to understand
                isSideBarClosed.value = true;
              },
              // Let's fixed the scal animation
              press: () {
                isSideBarClosed.value = !isSideBarClosed.value;
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideMenuClosed = isSideBarClosed.value;
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: WillPopScope(
          onWillPop: alertExitApp,
          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.black,
            buttonBackgroundColor: Colors.blue,
            backgroundColor: Colors.transparent,
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            items: items,
            index: index,
            onTap: (index) {
              setState(() {
                this.index = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

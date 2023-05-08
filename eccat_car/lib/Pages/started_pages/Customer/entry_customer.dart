import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../core/colors.dart';
import '../../../core/rive_utils.dart';
import '../../../lists/search.dart';
import '../../../lists/search_customer.dart';
import '../../Health Care/darkmode.dart';
import '../../Iot/iot.dart';
import '../../User_Profile.dart';
import '../../home/components/animated_bar.dart';
import '../../home/components/side_menu.dart';
import '../../home/models/menu_btn.dart';
import '../../home/models/rive_asset.dart';
import 'Custom_start.dart';

// We are done with our 5th and last episode
// Thank you so much for watching entire serise
// Bye

class EntryCustomer extends StatefulWidget {
  const EntryCustomer({super.key});

  @override
  State<EntryCustomer> createState() => _EntryCustomerState();
}

class _EntryCustomerState extends State<EntryCustomer>
    with SingleTickerProviderStateMixin {
  Widget selectedBottomNav = NavIcons.first;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  // Let's chnage the name
  late SMIBool isSideBarClosed;

  bool isSideMenuClosed = true;
  int currentpages = 0;
  List<Widget> pages = [CustomerStartPage(), customer_search(), UserInfoPage()];

  @override
  void initState() {
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
                  child: pages[currentpages],
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
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  NavIcons.length,
                  (index) => GestureDetector(
                    onTap: () {
                      // NavIcons[index].input!.change(true);
                      if (NavIcons[index] != selectedBottomNav) {
                        setState(() {
                          selectedBottomNav = NavIcons[index];
                          currentpages = index;
                        });
                      }
                      Future.delayed(const Duration(seconds: 1), () {
                        // NavIcons[index].input!.change(false);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                            isActive: NavIcons[index] == selectedBottomNav),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: selectedBottomNav,
                          // child: Opacity(
                          //   opacity: NavIcons[index] == selectedBottomNav
                          //       ? 1
                          //       : 0.5,
                          //   child: RiveAnimation.asset(
                          //     NavIcons.first.src,
                          //     artboard: NavIcons[index].artboard,
                          //     onInit: (artboard) {
                          //       StateMachineController controller =
                          //           RiveUtils.getRiveController(artboard,
                          //               stateMachineName:
                          //                   NavIcons[index].stateMachineName);

                          //       NavIcons[index].input =
                          //           controller.findSMI("active") as SMIBool;
                          //     },
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

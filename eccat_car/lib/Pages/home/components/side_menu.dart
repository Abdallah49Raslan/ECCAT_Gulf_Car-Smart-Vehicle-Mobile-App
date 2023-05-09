import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../core/colors.dart';
import '../../../core/rive_utils.dart';
import '../../../core/space.dart';
import '../../../core/text_style.dart';
import '../../../onboding_screen.dart';
import '../../../widget/main_button.dart';
import '../../User_Profile.dart';
import '../models/rive_asset.dart';
import 'info_card.dart';
import 'side_menu_tile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final userData =
                      snapshot.data!.data() as Map<String, dynamic>?;
                  final userName = userData?['name'] as String?;
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserInfoPage()));
                        },
                        child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user!.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white24,
                                child: Icon(
                                  CupertinoIcons.person,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              );
                            }
                            final userData =
                                snapshot.data!.data() as Map<String, dynamic>?;
                            final profilePicUrl =
                                userData?['photoUrl'] as String?;
                            return CircleAvatar(
                              radius: 40,
                              backgroundImage: profilePicUrl != null
                                  ? NetworkImage(profilePicUrl)
                                  : null,
                              backgroundColor: Colors.white24,
                              child: profilePicUrl == null
                                  ? const Icon(
                                      CupertinoIcons.person,
                                      color: Colors.white,
                                      size: 40,
                                    )
                                  : null,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          ' ${userName ?? ''}',
                          style: headline2.copyWith(
                            fontSize: 28.0,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    // Let me show you if user click on the menu how to show the animation
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                    // See as we click them it start animate
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                      menu.onTap?.call(context);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              //   child: Text(
              //     "History".toUpperCase(),
              //     style: Theme.of(context)
              //         .textTheme
              //         .titleMedium!
              //         .copyWith(color: Colors.white70),
              //   ),
              // ),
              // ...sideMenu2.map(
              //   (menu) => SideMenuTile(
              //     menu: menu,
              //     riveonInit: (artboard) {
              //       // Let me show you if user click on the menu how to show the animation
              //       StateMachineController controller =
              //           RiveUtils.getRiveController(artboard,
              //               stateMachineName: menu.stateMachineName);
              //       menu.input = controller.findSMI("active") as SMIBool;
              //       // See as we click them it start animate
              //     },
              //     press: () {
              //       menu.input!.change(true);
              //       Future.delayed(const Duration(seconds: 1), () {
              //         menu.input!.change(false);
              //         menu.onTap?.call(context);
              //       });
              //       setState(() {
              //         selectedMenu = menu;
              //       });
              //     },
              //     isActive: selectedMenu == menu,
              //   ),
              // ),

              const Spacer(flex: 6),
              Mainbutton(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardingScreen()),
                  );
                },
                text: 'Logout',
                btnColor: blueButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:eccat_car/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../core/space.dart';
import '../../core/text_style.dart';
import '../../data/demo.dart';
import 'Pages/Authintication/Sign_in/animated_btn.dart';
import 'Pages/Authintication/Sign_in/custom_sign_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationColtroller;

  @override
  void initState() {
    _btnAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            child: Image.asset("assets/image/home_page.jpg"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            // It's time to add the animation
            // Before that
            top: isSignInDialogShown ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 300,
                      child: Image.asset(
                        'assets/image/Home_logo.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 260,
                          child: Column(
                            children: const [
                              SpaceVH(height: 250.0),
                              Text(
                                splashText,
                                textAlign: TextAlign.left,
                                style: headline2,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 3),
                        AnimatedBtn(
                          btnAnimationColtroller: _btnAnimationColtroller,
                          press: () {
                            _btnAnimationColtroller.isActive = true;
                            Future.delayed(
                              const Duration(milliseconds: 800),
                              () {
                                setState(() {
                                  isSignInDialogShown = true;
                                });

                                customSigninDialog(
                                  context,
                                  onCLosed: (_) {
                                    setState(() {
                                      isSignInDialogShown = false;
                                    });
                                  },
                                );
                              },
                            );
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

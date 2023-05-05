import 'package:eccat_car/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/text_style.dart';
import '../../Authintication/sign_up.dart';
import 'sign_in_form.dart';

Future<Object?> customSigninDialog(BuildContext context,
    {required ValueChanged onCLosed}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign In",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => Center(
      child: Container(
        height: 620,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.94),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Sign In",
                  style: headline,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Please sign in to your account",
                    style: headline4,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SignInForm(),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        " OR Don't have an Accounet",
                        style: headline3,
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "Sign up with Email",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const SignUpPage()));
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/email_box.svg",
                        height: 64,
                        width: 64,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  ).then(onCLosed);
}

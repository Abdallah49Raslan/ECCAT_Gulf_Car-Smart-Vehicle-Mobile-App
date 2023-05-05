import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/colors.dart';
import '../../../core/rive_utils.dart';
import '../../../core/space.dart';
import '../../../core/text_style.dart';
import '../../../logic/LogInLogic.dart';
import '../../../widget/text_fild.dart';
import '../../Authintication/Forget_Pass.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String _email = '';
  String _password = '';

  TextEditingController userEmail = TextEditingController();
  TextEditingController userPass = TextEditingController();
  bool _isScure = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;

  void signIn(BuildContext context) {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (formKey.currentState!.validate()) {
          // If everything looks good it shows the success animation
          check.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              // After closing it want to show the confetti animation
              // First let's add the animation
              // restart it
              confetti.fire();
              // Once all success we will navigate to the Next screen
              Future.delayed(
                const Duration(seconds: 1),
                () async {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginLogic(
                          email: _email,
                          password: _password,
                        ),
                      ),
                    );
                  }
                },
              );
            },
          );
        } else {
          // or error animation
          error.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textField(
                onChanged: (data) {
                  _email = data;
                },
                controller: userEmail,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email),
                hintTxt: 'Email Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
              ),
              textField(
                onChanged: (data) {
                  _password = data;
                },
                controller: userPass,
                prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isScure = !_isScure;
                    });
                  },
                  icon: Icon(
                    _isScure ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                isObs: _isScure,
                keyboardType: TextInputType.visiblePassword,
                hintTxt: 'Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Password';
                  }
                  return null;
                },
              ),

              //forget pass
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: headline5,
                    ),
                  ),
                ),
              ),

              const SpaceVH(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    signIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueButton,
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: blackBG,
                  ),
                  label: const Text("Sign In"),
                ),
              ),
            ],
          ),
        ),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  "assets/RiveAssets/check.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),

        // Looks good
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                  scale: 7,
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/confetti.riv",
                    onInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard);

                      confetti =
                          controller.findSMI("Trigger explosion") as SMITrigger;
                    },
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      // Let's make it small
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

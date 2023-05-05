import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/space.dart';
import '../../core/text_style.dart';
import '../../onboding_screen.dart';
import '../../widget/main_button.dart';
import '../../widget/text_fild.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();

  String? _errorMessage;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SpaceVH(height: 50.0),
                const Text(
                  'Forget Password',
                  style: headline,
                ),
                //text hint
                const SpaceVH(height: 30.0),
                const Text(
                  'Please enter your email address to reset your password',
                  textAlign: TextAlign.center,
                  style: headline4,
                ),
                //email
                const SizedBox(height: 100.0),
                textField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                  hintTxt: 'Email Address',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!value.contains('@') || !value.contains('.')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                if (_errorMessage != null) // Display error message if it exists
                  Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SpaceVH(height: 120.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Mainbutton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              // Check if email is signed up
                              List<String> signInMethods = await FirebaseAuth
                                  .instance
                                  .fetchSignInMethodsForEmail(
                                      _emailController.text.trim());
                              if (signInMethods.isEmpty) {
                                // Email does not exist
                                setState(() {
                                  _errorMessage =
                                      'No user found for that email address.';
                                });
                              } else {
                                // Reset password
                                await FirebaseAuth.instance
                                    .sendPasswordResetEmail(
                                        email: _emailController.text.trim());
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'A password reset link has been sent to your email.',
                                    ),
                                  ),
                                );
                                setState(() {
                                  _errorMessage =
                                      null; // Set to null to hide error message
                                });
                              }
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'invalid-email') {
                                setState(() {
                                  _errorMessage = 'Invalid email address.';
                                });
                              } else if (e.code == 'user-not-found') {
                                setState(() {
                                  _errorMessage =
                                      'No user found for that email address.';
                                });
                              } else {
                                setState(() {
                                  _errorMessage =
                                      'An error occurred. Please try again later.';
                                });
                              }
                            } catch (e) {
                              setState(() {
                                _errorMessage =
                                    'An error occurred. Please try again later.';
                              });
                            }
                          }
                        },
                        text: 'Reset Password',
                        btnColor: blueButton,
                      ),
                      const SpaceVH(height: 20.0),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => const OnboardingScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: 'Remember the password ! ',
                              style: headline3,
                            ),
                            TextSpan(
                              text: ' Login',
                              style: headline4,
                            ),
                          ]),
                        ),
                      ),
                    ],
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

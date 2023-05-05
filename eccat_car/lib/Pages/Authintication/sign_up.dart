import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/space.dart';
import '../../core/text_style.dart';
import '../../logic/SignUpLogic.dart';
import '../../logic/validator.dart';
import '../../onboding_screen.dart';
import '../../widget/Dropdown_Menu.dart';
import '../../widget/main_button.dart';
import '../../widget/text_fild.dart';
import 'Sign_in/sign_in_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPh = TextEditingController();
  TextEditingController personId = TextEditingController();
  TextEditingController driverLicense = TextEditingController();

  bool _isScure = true;
  final List<String> options = ['Driver', 'Customer'];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  String? email;
  String? password;
  String? Name;
  String? phone;
  String? selectedOption;
  String? UserID;
  String? DriverLic;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                //head of page
                const SpaceVH(height: 30.0),
                const Text(
                  'Create new account',
                  style: headline,
                ),

                //text hint
                const SpaceVH(height: 10.0),
                const Text(
                  'Please fill in the form to continue',
                  style: headline4,
                ),

                //userName
                const SpaceVH(height: 20.0),
                textField(
                  onChanged: (data) {
                    Name = data;
                  },
                  controller: userName,
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                  keyboardType: TextInputType.name,
                  hintTxt: 'Full Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                //userEmail
                textField(
                  onChanged: (data) {
                    email = data;
                  },
                  controller: userEmail,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                  hintTxt: 'Email Address',
                  validator: InputValidator.emailValidator,
                ),

                //user Number
                textField(
                  onChanged: (data) {
                    phone = data;
                  },
                  controller: userPh,
                  prefixIcon: const Icon(Icons.phone),
                  keyboardType: TextInputType.phone,
                  hintTxt: 'Phone Number',
                  validator: InputValidator.phoneValidator,
                ),

                //user Password
                textField(
                  onChanged: (data) {
                    password = data;
                  },
                  controller: userPass,
                  isObs: _isScure,
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
                  keyboardType: TextInputType.visiblePassword,
                  hintTxt: 'Password',
                  validator: InputValidator.passwordValidator,
                ),

                // user role
                UserRoleDropdown(
                  hintTxt: 'Please select your role',
                  options: options,
                  selectedOption: selectedOption,
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                  onChanged: (newValue) {
                    setState(() {
                      selectedOption = newValue;
                    });
                  },
                  validator: (value) {
                    // add custom validation logic here
                    return null;
                  },
                ),

                // conditional text fields for driver ID and license number
                if (selectedOption == 'Driver')
                  Column(children: [
                    textField(
                      onChanged: (data) {
                        UserID = data; // save driver ID data
                      },
                      controller: personId,
                      prefixIcon: const Icon(Icons.credit_card_sharp),
                      keyboardType: TextInputType.number,
                      hintTxt: 'Driver ID',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your driver ID';
                        }
                        return null;
                      },
                    ),
                    textField(
                      onChanged: (data) {
                        DriverLic = data; // save driver license data
                      },
                      controller: driverLicense,
                      prefixIcon: const Icon(Icons.credit_card),
                      keyboardType: TextInputType.number,
                      hintTxt: 'Driver License Number',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your driver license number';
                        }
                        return null;
                      },
                    ),
                  ]),

                // sign up button
                const SpaceVH(height: 20.0),
                Mainbutton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpLogic(
                            email: email!,
                            password: password!,
                            name: Name!,
                            phone: phone!,
                            role: selectedOption!,
                          ),
                        ),
                      );
                    } else {
                      // handle case when form is not valid
                    }
                  },
                  text: 'Sign Up',
                  btnColor: blueButton,
                ),

                //switch to Login
                const SpaceVH(height: 10.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardingScreen()));
                  },
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'Have an account? ',
                        style: headline3,
                      ),
                      TextSpan(
                        text: ' Sign In',
                        style: headline5,
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

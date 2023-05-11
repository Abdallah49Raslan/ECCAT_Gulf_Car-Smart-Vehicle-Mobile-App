import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Pages/started_pages/Customer/entry_customer.dart';
import '../Pages/started_pages/Driver/entry_Driver.dart';
import '../Pages/started_pages/Owner/entry_Owner.dart';
import '../onboding_screen.dart';
import 'LogInLogic.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}
class _AuthPageState extends State<AuthPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    checkUserAuth();
  }

  Future<void> checkUserAuth() async {
    final user = _auth.currentUser;
    if (user != null) {
      // Check user's role in Cloud Firestore
      String? userRole; // Declare the role variable before using it
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
      print('1');
      if (documentSnapshot != null && documentSnapshot.exists) {
        userRole = documentSnapshot.data()!['user'];
        print('2');
        // Navigate to the appropriate start page based on user's role
        if (userRole == 'Owner') {
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const EntryOwner(initialIndex: 2,)),
            );
          });
        } else if (userRole == 'Driver') {
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const EntryDriver(initialIndex: 2,)),
            );
          });
          print('3');
        } else if (userRole == 'Customer') {
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const EntryCustomer(initialIndex: 2,)),
            );
          });
        } else {
          print('4');
          // If role is not recognized, show an error message and return to OnboardingScreen
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.error_outline),
                  const SizedBox(width: 10),
                  const Text('User role not recognized'),
                ],
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreen()),
            );
          });
        }
      } else {
        print('5');
        // If user document does not exist, show an error message and return to OnboardingScreen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error_outline),
                const SizedBox(width: 10),
                const Text('User document not found in Cloud Firestore'),
              ],
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
        });
      }
    } else {
      print('6');
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

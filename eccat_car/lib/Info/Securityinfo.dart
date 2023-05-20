import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../core/text_style.dart';

class SecurityInfo extends StatefulWidget {
  const SecurityInfo({super.key});

  @override
  State<SecurityInfo> createState() => _SecurityInfoState();
}

class _SecurityInfoState extends State<SecurityInfo> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double imgHeight = (screenHeight / 2) - 100;
    double titleFontsize = 25;
    double normalFontsize = 19;
    if (screenWidth > 480) {
      // If width is more than 480, set a new font value
      imgHeight = (screenHeight / 2);
      titleFontsize = 40;
      normalFontsize = 30;
    }
    return Scaffold(
      backgroundColor: blackBG,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColorDark,
        title: const Text(
          "Security",
          style: headline1,
        ),
        actions: [],
        iconTheme: IconThemeData(color: whiteText),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Car Antitheft System",
                    style: TextStyle(
                        color: Color(0xffA8E0F1),
                        fontSize: titleFontsize,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/icons/security2.jpg',
                      height: imgHeight,
                      width: double.infinity,
                    ),
                  ),
                  Text(
                    "Fingerprint Recognition",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontsize,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Text(
                      '-The system works by integrating a fingerprint scanner with the cars entry and ignition systems, which will require the driver to scan their fingerprint to start the car',
                      style: TextStyle(
                        fontSize: normalFontsize,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/icons/security1.jpg',
                      height: imgHeight,
                      width: double.infinity,
                    ),
                  ),
                  Text(
                    "Face Recognition ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontsize,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Text(
                      '-Identify the driver of the vehicle.\n\n-If the driver is authorized, the entered user data is sent accordingly.\n\n-If the driver is not authorized, the app captures the photo and sends it to the owner for verification. ',
                      style: TextStyle(
                        fontSize: normalFontsize,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

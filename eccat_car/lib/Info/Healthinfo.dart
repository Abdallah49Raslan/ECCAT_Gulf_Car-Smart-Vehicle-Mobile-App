import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../core/text_style.dart';

class HealthInfo extends StatefulWidget {
  const HealthInfo({super.key});

  @override
  State<HealthInfo> createState() => _HealthInfoState();
}

class _HealthInfoState extends State<HealthInfo> {
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
          "Healthcare",
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
                  Container(
                    child: Image.asset(
                      'assets/icons/Healthcare.png',
                      height: imgHeight,
                      width: double.infinity,
                    ),
                  ),
                  Text(
                    "Health Tracking System",
                    style: TextStyle(
                        color: Color(0xffA8E0F1),
                        fontSize: titleFontsize,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Text(
                      'Health tracking for Driver and each passenger in the car to keep track of:\n-Heart rate\n-Temperature\n-Oximeter\n-Alcohol detection\n\nDisplay these vital values on application.\n\nGiving alert if any value is abnormal.',
                      style: TextStyle(
                        fontSize: normalFontsize,
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

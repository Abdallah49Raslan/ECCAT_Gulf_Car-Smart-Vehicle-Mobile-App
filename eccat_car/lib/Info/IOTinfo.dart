import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../core/text_style.dart';

class IOTInfo extends StatefulWidget {
  const IOTInfo({super.key});

  @override
  State<IOTInfo> createState() => _IOTInfoState();
}

class _IOTInfoState extends State<IOTInfo> {
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
          "IOT",
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
                      'assets/icons/iot2.jpg',
                      height: imgHeight,
                      width: screenWidth,
                    ),
                  ),
                  Text(
                    "Car Management System",
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
                      '-Keep track of the components of the car.\n\n-Display the current state of vehicle speed, battery charge, seat belt.\n\n-Warning the driver if anything went wrong.',
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

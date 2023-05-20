import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../core/text_style.dart';

class AiInfo extends StatefulWidget {
  const AiInfo({super.key});

  @override
  State<AiInfo> createState() => _AiInfoState();
}

class _AiInfoState extends State<AiInfo> {
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
          "AI",
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
                      'assets/icons/Ai.jpg',
                      height: imgHeight,
                      width: double.infinity,
                    ),
                  ),
                  Text(
                    "ADAS System",
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
                      '-Detect unmarked and marked bumps from a distance between 30m-40m using Cumputer Vision and Deep Learning.\n\n-Lane assistance system using image processing to avoid the driver from get out the track.\n\n-Alert the driver if he gets out the lane or bump detected  ',
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

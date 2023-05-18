import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../../core/space.dart';
import '../../Health Care/Passenger1.dart';

class CustomerStartPage extends StatefulWidget {
  const CustomerStartPage({super.key});

  @override
  State<CustomerStartPage> createState() => _CustomerStartPageState();
}

class _CustomerStartPageState extends State<CustomerStartPage> {
  int index = 0;
  double fontSize = 25;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 480) {
      // If width is more than 480, set a new font value
      fontSize = 30;
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //car icon in above of page
              Image.asset(
                'assets/image/App_logo.png',
                height: MediaQuery.of(context).size.height / 2 - 100,
                width: double.infinity,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                child: Text(
                  'specifications',
                  style: TextStyle(
                      color: redhomeColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: LayoutBuilder(builder: (context, cons) {
                  return Row(
                    children: [
                      //location
                      InkWell(
                        onTap: () async {
                          await LaunchApp.openApp(
                            androidPackageName: 'com.google.android.apps.maps',
                            iosUrlScheme: 'comgooglemaps://',
                            appStoreLink:
                                'https://apps.apple.com/us/app/google-maps/id585027354',
                            // openStore: false
                          );
                        },
                        child: Container(
                          height: screenWidth > 480
                              ? (cons.maxWidth - 8) / 3
                              : (cons.maxWidth - 8) / 2,
                          width: (cons.maxWidth - 8) / 2,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              const SpaceVH(height: 30.0),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/location.png'))),
                                ),
                              ),
                              const SpaceVH(height: 10.0),
                              Expanded(
                                  child: Container(
                                child: const Text(
                                  'Location',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 4,
                      ),

                      //health
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => const Passenger1()));
                        },
                        child: Container(
                          height: screenWidth > 480
                              ? (cons.maxWidth - 8) / 3
                              : (cons.maxWidth - 8) / 2,
                          width: (cons.maxWidth - 8) / 2,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: backgroundColorDark,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              const SpaceVH(height: 30.0),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/health.png'))),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  child: Container(
                                //margin: EdgeInsets.only(top: 20),
                                child: const Text(
                                  'Health',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

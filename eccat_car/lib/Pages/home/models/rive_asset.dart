import 'package:eccat_car/Pages/AI/person_page.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../lists/chat.dart';
import '../../AI/search_page.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  final Function(BuildContext)? onTap;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input,
      this.onTap});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> sideMenus = [
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Home",
    onTap: (BuildContext context) {
      // Navigate to the Home screen
    },
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Help",
    onTap: (BuildContext context) {
      // Navigate to the Help screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatbotPage()),
      );
    },
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "History OF ECCAT",
    onTap: (BuildContext context) {
      // Navigate to the screen HistoryPage
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WebViewApp()));
    },
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "SETTINGS",
    stateMachineName: "SETTINGS_Interactivity",
    title: "About App",
    onTap: (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutAPP()),
      );
    },
  ),
];

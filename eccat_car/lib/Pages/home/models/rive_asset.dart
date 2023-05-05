import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../lists/chat.dart';
import '../../../lists/search.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  final Function(BuildContext)? onTap;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input,
      this.onTap}); // Add default value of null for onTap

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
      title: "Home", onTap: (BuildContext context) {
    // Navigate to the Chat screen
  }),
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search", onTap: (BuildContext context) {
    // Navigate to the Search screen
  }),
  // RiveAsset("assets/RiveAssets/icons.riv",
  //     artboard: "TIMER",
  //     stateMachineName: "TIMER_Interactivity",
  //     title: "Timer", onTap: (BuildContext context) {
  //   // Navigate to the Timer screen
  // }),
  // RiveAsset("assets/RiveAssets/icons.riv",
  //     artboard: "BELL",
  //     stateMachineName: "BELL_Interactivity",
  //     title: "Notifications", onTap: (BuildContext context) {
  //   // Navigate to the Notifications screen
  // }),
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile", onTap: (BuildContext context) {
    // Navigate to the Profile screen
  }),
];

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
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
    onTap: (BuildContext context) {
      // Navigate to the Search screen
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DataSearchPage()));
    },
  ),
  // RiveAsset(
  //   "assets/RiveAssets/icons.riv",
  //   artboard: "LIKE/STAR",
  //   stateMachineName: "STAR_Interactivity",
  //   title: "Favorites",
  //   onTap: (BuildContext context) {
  //     // Navigate to the Favorites screen
  //   },
  // ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Help",
    onTap: (BuildContext context) {
      // Navigate to the Help screen
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChatbotPage()));
    },
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notification",
    onTap: (BuildContext context) {
      // Navigate to the Favorites screen
    },
  ),
];

List<RiveAsset> sideMenu2 = [
  // RiveAsset(
  //   "assets/RiveAssets/icons.riv",
  //   artboard: "TIMER",
  //   stateMachineName: "TIMER_Interactivity",
  //   title: "History",
  //   onTap: (BuildContext context) {
  //     // Navigate to the screen HistoryPage
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => HistoryPage()));
  //   },
  // ),
];

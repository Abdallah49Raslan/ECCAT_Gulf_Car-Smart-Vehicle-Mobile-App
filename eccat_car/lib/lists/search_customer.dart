import 'package:eccat_car/Pages/User_Profile.dart';
import 'package:flutter/material.dart';
import '../Pages/Health Care/Passenger1.dart';
import '../core/colors.dart';
import '../core/text_style.dart';

class customer_search extends StatefulWidget {
  @override
  _customer_searchState createState() => _customer_searchState();
}

class _customer_searchState extends State<customer_search> {
  Map<String, Widget> dataPages = {

    'Passenger1': Passenger1(),
    'Email & password': UserInfoPage(),
  };
  List<String> data = [

    'Passenger1',
    'Email & password'
  ];
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    List<String> filteredData = data
        .where((item) => item.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: blackBG,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColorDark,
        title: const Text(
          "Data Search",
          style: headline1,
        ),
        iconTheme: IconThemeData(color: whiteText),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  _searchText = text;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: headline3,
                suffixIcon: Icon(Icons.search, color: whiteText),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: whiteText),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: whiteText),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(color: whiteText),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    String selectedData = filteredData[index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => dataPages[selectedData]!,
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      filteredData[index],
                      style: TextStyle(color: whiteText),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

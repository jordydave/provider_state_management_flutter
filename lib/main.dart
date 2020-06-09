import 'package:flutter/material.dart';
import 'package:tugas11/multi_provider_page.dart';
import 'package:tugas11/single_provider_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    SingleProviderPage(),
    MultiProviderPage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ac_unit,
              color: Color(0xff11999e),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Single",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "Provider",
                  style: TextStyle(color: Colors.pink),
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_alarm,
              color: Color(0xff11999e),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Multi",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "Provider",
                  style: TextStyle(color: Colors.pink),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

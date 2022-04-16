import 'package:flutter/material.dart';
import 'package:navigation_rail/two.dart';

import 'one.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _pages =[
    One(),
    Two(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              backgroundColor: Colors.black87,
              labelType: NavigationRailLabelType.all,
              minWidth: 50,

              destinations: [
                NavigationRailDestination(
                    icon: Icon(
                      Icons.wifi,
                      color: Colors.white,
                    ),
                    label: Text("Wifi"),
                    selectedIcon: Icon(
                      Icons.wifi,
                      color: Colors.blue,
                    )),
                NavigationRailDestination(
                    icon: Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                    ),
                    label: Text("Sunny"),
                    selectedIcon: Icon(
                      Icons.wb_sunny,
                      color: Colors.blue,
                    )),
              ],
              selectedIndex: _selectedIndex,
              onDestinationSelected: (val) {
                setState(() {
                  _selectedIndex = val;
                });
              },
            ),
            Expanded(child: Container(
              child: _pages[_selectedIndex],
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vhq/screens/home.dart';
import 'package:vhq/screens/record.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<NavBar> {
  int currentPageIndex = 0;

  final _pageOptions = <Widget>[
    HomePage(),
    RecordPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Theme.of(context).colorScheme.primaryContainer,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fiber_manual_record),
            label: 'Record',
          ),
          // NavigationDestination(
          //   selectedIcon: Icon(Icons.school),
          //   icon: Icon(Icons.school_outlined),
          //   label: 'School',
          // ),
        ],
      ),
      body: _pageOptions[currentPageIndex],
    );
  }
}
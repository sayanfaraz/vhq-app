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
    const HomePage(),
    const RecordPage()
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
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home, color: Theme.of(context).colorScheme.primary),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fiber_manual_record, color: Theme.of(context).colorScheme.primary),
            selectedIcon: Icon(Icons.fiber_manual_record, color: Theme.of(context).colorScheme.error),
            label: 'Record',
          ),
        ],
      ),
      body: _pageOptions[currentPageIndex],
    );
  }
}
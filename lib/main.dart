import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'volleyball hq',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const NavBar()
      // home: const HomePage(title: 'vhq'),
    );
  }
}

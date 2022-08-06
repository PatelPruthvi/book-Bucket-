import 'package:bookbucket/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'Discover/discover.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final tabs = [
    Discover(),
    Center(
      child: Text('Quotes'),
    ),
    Center(
      child: Text('Audio Books'),
    ),
    Center(
      child: Text('Settings'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        color: dark_blue,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            backgroundColor: dark_blue,
            color: Colors.white,
            activeColor: Colors.white,
            iconSize: 24,
            tabBackgroundColor: dark_blue_1,
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            padding: EdgeInsets.all(16),
            haptic: true,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Discover',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Quotes',
              ),
              GButton(
                icon: Icons.search,
                text: 'Audio Books',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

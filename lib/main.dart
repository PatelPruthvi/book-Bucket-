// ignore_for_file: prefer_const_constructors

import 'package:bookbucket/Settings/SettingScreen.dart';
import 'package:bookbucket/screens/AudioBookUI.dart';
import 'package:bookbucket/screens/Home/HomeScreen.dart';
import 'package:bookbucket/screens/audiobooklv.dart';
import 'package:bookbucket/screens/bookQouList.dart';
import 'package:bookbucket/screens/qoutes_reel_view.dart';
import 'package:bookbucket/screens/quotes_view.dart';
import 'package:bookbucket/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currIndex = 0;
  final tabs = [
    HomeScreen(),
    QoutesViewbar(),
    AudListView(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (context) => QoutesViewbar(),
          '/BookQuo': (context) => BookQouList(),
          '/InspireQuo': (context) => ReelQuotes(),
          '/AudioUI': (context) => AudioBookUI()
        },
        home: Scaffold(
          backgroundColor: dark_blue,
          body: tabs[_currIndex],
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
                    _currIndex = index;
                  });
                },
                padding: EdgeInsets.all(16),
                haptic: true,
                tabs: const [
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
        ));
  }
}

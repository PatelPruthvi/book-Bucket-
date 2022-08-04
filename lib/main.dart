// ignore_for_file: prefer_const_constructors

import 'package:bookbucket/screens/bookQouList.dart';
import 'package:bookbucket/screens/qoutes_reel_view.dart';
import 'package:bookbucket/screens/quotes_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => QoutesViewbar(),
        '/BookQuo': (context) => BookQouList(),
        '/InspireQuo': (context) => ReelQuotes()
      },
      home: QoutesViewbar(),
    );
  }
}

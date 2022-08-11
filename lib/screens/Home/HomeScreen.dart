// ignore_for_file: prefer_const_constructors

import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';
import 'BookDetail.dart';
import 'SeeAllBooks.dart';
import 'item_collections.dart';
import 'item_home_books.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
        ),
        backgroundColor: dark_blue,
        centerTitle: false,
      ),
      body: Container(
        color: dark_blue,
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 4),
                      child: Text(
                        "Collections",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return item_collection();
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Text(
                        "To Win at Work",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllBooks(
                                        "To Win at Work",
                                        "https://content.thriveglobal.com/wp-content/uploads/2020/07/IMG_0308.jpg?w=1024",
                                        "Why Men Win at Work",
                                      )));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                              OutlinedBorder?>((states) {
                            // Rounded button (when the button is pressed)
                            if (states.contains(MaterialState.pressed)) {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }
                          }),
                        ),
                        child: Text('See all'),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return item_home_books(
                            "https://content.thriveglobal.com/wp-content/uploads/2020/07/IMG_0308.jpg?w=1024",
                            "Why Men Win at Work");
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Text(
                        "To have more money",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllBooks(
                                        "To have more money",
                                        "https://m.media-amazon.com/images/I/51gIriQ5hLL.jpg",
                                        "How to make more Money",
                                      )));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                              OutlinedBorder?>((states) {
                            // Rounded button (when the button is pressed)
                            if (states.contains(MaterialState.pressed)) {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }
                          }),
                        ),
                        child: Text('See all'),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return item_home_books(
                            "https://m.media-amazon.com/images/I/51gIriQ5hLL.jpg",
                            "How to make more Money");
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Text(
                        "To be Productive",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllBooks(
                                        "To be Productive",
                                        "https://m.media-amazon.com/images/I/41XMvYgrIcL._SL500_.jpg",
                                        "Calender Hacking",
                                      )));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                              OutlinedBorder?>((states) {
                            // Rounded button (when the button is pressed)
                            if (states.contains(MaterialState.pressed)) {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }
                          }),
                        ),
                        child: Text('See all'),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return item_home_books(
                            "https://m.media-amazon.com/images/I/41XMvYgrIcL._SL500_.jpg",
                            "Calender Hacking");
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                        child: Text(
                          "To be Business Booster",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllBooks(
                                        "To be Business Booster",
                                        "https://149502452.v2.pressablecdn.com/wp-content/uploads/2020/11/the-lean-startup-book-001-1-2048x1152.jpeg",
                                        "The Learn Startup",
                                      )));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                              OutlinedBorder?>((states) {
                            // Rounded button (when the button is pressed)
                            if (states.contains(MaterialState.pressed)) {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }
                          }),
                        ),
                        child: Text('See all'),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return item_home_books(
                            "https://149502452.v2.pressablecdn.com/wp-content/uploads/2020/11/the-lean-startup-book-001-1-2048x1152.jpeg",
                            "The Learn Startup");
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

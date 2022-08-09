import 'package:bookbucket/screens/Home/item_see_books.dart';
import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';

import 'item_collections.dart';
import 'item_home_books.dart';

class SeeAllBooks extends StatelessWidget {
  String appBarTitle, imgLink, bookTitle;
  SeeAllBooks(this.appBarTitle, this.imgLink, this.bookTitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        backgroundColor: dark_blue,
        centerTitle: false,
      ),
      // body: GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //     ),
      //     itemCount: 10,
      //     itemBuilder: (context, index) {
      //       return item_see_books(
      //           "https://content.thriveglobal.com/wp-content/uploads/2020/07/IMG_0308.jpg?w=1024");
      //     }),
      body: GridView.count(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.7,
        children: [
          item_see_books(imgLink, bookTitle),
          item_see_books(imgLink, bookTitle),
          item_see_books(imgLink, bookTitle),
          item_see_books(imgLink, bookTitle),
          item_see_books(imgLink, bookTitle),
          item_see_books(imgLink, bookTitle),
          item_see_books(imgLink, bookTitle),
          item_see_books(imgLink, bookTitle),
        ],
      ),
    );
  }
}

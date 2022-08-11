import 'package:bookbucket/screens/Home/item_see_books.dart';
import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: dark_blue,
      body: GridView.count(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 1.2 *
            MediaQuery.of(context).size.width /
            MediaQuery.of(context).size.height,
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

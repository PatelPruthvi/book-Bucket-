import 'package:bookbucket/screens/Home/item_see_books.dart';
import 'package:bookbucket/utils/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'item_collections.dart';
import 'item_home_books.dart';

class SeeAllBooks extends StatefulWidget {
  String appBarTitle, imgLink, bookTitle;
  SeeAllBooks(this.appBarTitle, this.imgLink, this.bookTitle, {Key? key})
      : super(key: key);

  @override
  State<SeeAllBooks> createState() => _SeeAllBooksState();
}

class _SeeAllBooksState extends State<SeeAllBooks> {
  Query db_ref =
      FirebaseDatabase.instance.ref().child("Home").child("To_Win_at_work");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark_blue,
      appBar: AppBar(
        title: Text(
          widget.appBarTitle,
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
        childAspectRatio: 1.2 *
            MediaQuery.of(context).size.width /
            MediaQuery.of(context).size.height,
        children: [
          SizedBox(
            height: double.infinity,
            child: FirebaseAnimatedList(
                query: db_ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return item_see_books(
                      snapshot.child("Book-img-url").value.toString(),
                      snapshot.child("Book-title").value.toString());
                }),
          ),
          // item_see_books(widget.imgLink, widget.bookTitle),
          // item_see_books(widget.imgLink, widget.bookTitle),
          // item_see_books(widget.imgLink, widget.bookTitle),
          // item_see_books(widget.imgLink, widget.bookTitle),
          // item_see_books(widget.imgLink, widget.bookTitle),
          // item_see_books(widget.imgLink, widget.bookTitle),
          // item_see_books(widget.imgLink, widget.bookTitle),
          // item_see_books(widget.imgLink, widget.bookTitle),
          // SizedBox(
          //     height: 10,
          //     child: FirebaseAnimatedList(
          //         query: db_ref,
          //         itemBuilder: (context, snapshot, animation, index) {
          //           return GridView.builder(
          //               itemCount: 8,
          //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //                   crossAxisCount: 2),
          //               itemBuilder: (_, index) =>
          //                   // item_see_books(widget.imgLink, widget.bookTitle));
          //                   item_see_books(
          //                       snapshot.child("Book-img-url").value.toString(),
          //                       snapshot.child("Book-title").value.toString()));

          //           // return ListTile(
          //           //     title: Text(
          //           //         snapshot.child("Book-img-url").value.toString()),
          //           //     subtitle: Text(
          //           //         snapshot.child("Book-title").value.toString()));

          //           // return item_see_books(
          //           //     snapshot.child("Book-img-url").value.toString(),
          //           //     snapshot.child("Book-title").value.toString());
          //         })),
        ],
      ),
    );
  }
}

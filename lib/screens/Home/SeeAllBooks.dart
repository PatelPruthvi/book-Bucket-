import 'dart:ffi';

import 'package:bookbucket/screens/Home/item_see_books.dart';
import 'package:bookbucket/utils/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'item_collections.dart';
import 'item_home_books.dart';

class SeeAllBooks extends StatelessWidget {
  Query db_ref =
      FirebaseDatabase.instance.ref().child("Home").child("To_Win_at_work");
  String appBarTitle, imgLink, bookTitle;
  SeeAllBooks(this.appBarTitle, this.imgLink, this.bookTitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark_blue,
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        backgroundColor: dark_blue,
        centerTitle: false,
      ),
      body: Row(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: db_ref,
                itemBuilder: ((context, snapshot, animation, index) {
                  if (index % 2 == 0)
                    // ignore: curly_braces_in_flow_control_structures
                    return item_see_books(
                      snapshot.child("Book-img-url").value.toString(),
                      snapshot.child("Book-title").value.toString(),
                      snapshot.child("Book-description").value.toString(),
                      snapshot.child("Book-summary").value.toString(),
                    );
                  else
                    return SizedBox();
                })),
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: db_ref,
                itemBuilder: ((context, snapshot, animation, index) {
                  if (index % 2 != 0)
                    return item_see_books(
                      snapshot.child("Book-img-url").value.toString(),
                      snapshot.child("Book-title").value.toString(),
                      snapshot.child("Book-description").value.toString(),
                      snapshot.child("Book-summary").value.toString(),
                    );
                  else
                    return SizedBox();
                })),
          )
        ],
      ),
      // body: GridView.count(
      //   shrinkWrap: true,
      //   scrollDirection: Axis.vertical,
      //   crossAxisCount: 2,
      //   childAspectRatio: 1.2 *
      //       MediaQuery.of(context).size.width /
      //       MediaQuery.of(context).size.height,
      //   children: [
      //     SizedBox(
      //       height: double.infinity,
      //       child: FirebaseAnimatedList(
      //           query: db_ref,
      //           itemBuilder: (context, snapshot, animation, index) {
      //             if (index % 2 == 0)
      //               return item_see_books(
      //                   snapshot.child("Book-img-url").value.toString(),
      //                   snapshot.child("Book-title").value.toString());
      //             else
      //               return SizedBox();
      //           }),
      //     ),
      //     SizedBox(
      //       height: double.infinity,
      //       child: FirebaseAnimatedList(
      //           query: db_ref,
      //           itemBuilder: (context, snapshot, animation, index) {
      //             if (index % 2 != 0)
      //               return item_see_books(
      //                   snapshot.child("Book-img-url").value.toString(),
      //                   snapshot.child("Book-title").value.toString());
      //             else
      //               return SizedBox();
      //           }),
      //     ),
      //   ],
      // ),
    );
  }
}

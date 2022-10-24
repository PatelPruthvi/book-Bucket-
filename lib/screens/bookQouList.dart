// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class BookQouList extends StatefulWidget {
  const BookQouList({Key? key}) : super(key: key);

  @override
  State<BookQouList> createState() => _BookQouListState();
}

class _BookQouListState extends State<BookQouList> {
  Query qoutes =
      FirebaseDatabase.instance.ref().child("Quotes").child("Book Quotes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Select Book',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
          ),
          backgroundColor: Color.fromRGBO(0, 22, 36, 1),
          centerTitle: false,
        ),
        backgroundColor: Color.fromRGBO(0, 22, 36, 1),
        body: FirebaseAnimatedList(
          query: qoutes,
          itemBuilder: ((context, snapshot, animation, index) {
            return QuotListItem(
              snapshot.child("Author-name").value.toString(),
              snapshot.child("Book-title").value.toString(),
              snapshot.child("Book-img-url").value.toString(),
            );
          }),
        ));
  }
}

class QuotListItem extends StatefulWidget {
  String author, bookTitle, imgUrl;
  QuotListItem(this.author, this.bookTitle, this.imgUrl, {Key? key})
      : super(key: key);

  @override
  State<QuotListItem> createState() => _QuotListItemState();
}

class _QuotListItemState extends State<QuotListItem> {
  @override
  void initState() {
    getD();
    super.initState();
  }

  String? aname, link, title;
  getD() {
    aname = widget.author;
    link = widget.imgUrl;
    title = widget.bookTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromARGB(255, 3, 74, 118),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          // ignore: prefer_const_literals_to_create_immutables
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    link.toString(),
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      title.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'By: ' + aname.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}

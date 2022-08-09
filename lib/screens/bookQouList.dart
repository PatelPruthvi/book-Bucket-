// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BookQouList extends StatefulWidget {
  const BookQouList({Key? key}) : super(key: key);

  @override
  State<BookQouList> createState() => _BookQouListState();
}

class _BookQouListState extends State<BookQouList> {
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
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return QuotListItem();
          }),
    );
  }
}

class QuotListItem extends StatefulWidget {
  const QuotListItem({Key? key}) : super(key: key);

  @override
  State<QuotListItem> createState() => _QuotListItemState();
}

class _QuotListItemState extends State<QuotListItem> {
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
                    'https://www.richdad.com/MediaLibrary/RichDad/Images/3d-books/2020/front-covers/3d-front-RDPD.png',
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
                      'Rich Dad Poor Dad',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'By: Robert T kiyosaki',
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

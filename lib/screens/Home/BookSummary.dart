import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';

class BookSummary extends StatelessWidget {
  String bookTitle, bookSummary;
  BookSummary(this.bookTitle, this.bookSummary, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark_blue,
      appBar: AppBar(
        title: Text(
          bookTitle,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: dark_blue,
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                bookSummary,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    overflow: TextOverflow.visible,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

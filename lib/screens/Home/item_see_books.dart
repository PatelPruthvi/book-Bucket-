// ignore_for_file: prefer_const_constructors

import 'package:bookbucket/screens/Home/BookDetail.dart';
import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';

class item_see_books extends StatelessWidget {
  String imgLink, bookTitle, bookDescription, bookSummary;

  item_see_books(
      this.imgLink, this.bookTitle, this.bookDescription, this.bookSummary,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetail(
                    imgLink, bookTitle, bookDescription, bookSummary)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: dark_blue_1,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: NetworkImage(imgLink),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(
                    color: Colors.grey.shade600,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepPurple[200],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 6, 3, 5),
              child: Text(
                bookTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

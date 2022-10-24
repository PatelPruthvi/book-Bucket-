import 'package:flutter/material.dart';

import 'BookDetail.dart';

class item_home_books extends StatelessWidget {
  String imgLink, bookTitle, bookDescription, bookSummary;
  item_home_books(
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 140,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(imgLink),
              fit: BoxFit.cover,
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
    );
  }
}

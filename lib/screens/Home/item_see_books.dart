import 'package:flutter/material.dart';

class item_see_books extends StatelessWidget {
  String imgLink, bookTitle;

  item_see_books(this.imgLink, this.bookTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 300,
            width: 240,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Text(
              bookTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

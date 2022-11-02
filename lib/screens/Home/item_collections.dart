import 'package:bookbucket/screens/Home/SeeAllBooks.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'BookDetail.dart';

class item_collection extends StatefulWidget {
  Query db;
  String title, link;
  item_collection(this.db, this.title, this.link, {Key? key}) : super(key: key);

  @override
  State<item_collection> createState() => _item_collectionState();
}

class _item_collectionState extends State<item_collection> {
  @override
  void initState() {
    getD();
    super.initState();
  }

  Query? db_ref;
  void getD() {
    setState(() {
      db_ref = widget.db;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SeeAllBooks(widget.title, '', widget.title, db_ref!)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 220,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(widget.link),
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
    );
  }
}

import 'package:bookbucket/screens/Home/BookDetail.dart';
import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';

class item_see_books extends StatelessWidget {
  String imgLink, bookTitle;

  item_see_books(this.imgLink, this.bookTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: dark_blue_1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDetail(imgLink, bookTitle)));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

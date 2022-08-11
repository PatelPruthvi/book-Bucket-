// ignore_for_file: prefer_const_constructors

import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';

class AudListView extends StatefulWidget {
  const AudListView({Key? key}) : super(key: key);

  @override
  State<AudListView> createState() => _AudListViewState();
}

class _AudListViewState extends State<AudListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: dark_blue,
          centerTitle: false,
          title: const Text('Select Book',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400)),
        ),
        backgroundColor: dark_blue,
        body: GridView.count(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          childAspectRatio: 1.3 *
              MediaQuery.of(context).size.width /
              MediaQuery.of(context).size.height,
          children: const [
            BookItem(),
            BookItem(),
            BookItem(),
            BookItem(),
            BookItem(),
            BookItem(),
            BookItem(),
            BookItem(),
          ],
        ));
  }
}

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: dark_blue_1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/AudioUI');
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
                    image: NetworkImage(
                        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1344270266l/6012533.jpg'),
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
                padding: const EdgeInsets.all(4),
                child: Text(
                  'How successful people think',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

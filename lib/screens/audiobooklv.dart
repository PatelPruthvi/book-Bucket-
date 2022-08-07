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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/AudioUI');
      },
      child: Card(
          color: dark_blue_1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1344270266l/6012533.jpg',
                    height: MediaQuery.of(context).size.height / 4,
                  )),
              // ignore: prefer_const_constructors
              Text(
                'How successful people think',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ]),
          )),
    );
  }
}

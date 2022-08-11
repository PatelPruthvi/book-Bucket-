import 'package:bookbucket/screens/Home/BookSummary.dart';
import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  String imgLink, bookTitle;

  String tempDescription =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. " +
          "\n\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  BookDetail(this.imgLink, this.bookTitle, {Key? key}) : super(key: key);

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
      body: SafeArea(
        child: ListView(
          children: [
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: 30,
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                  child: Container(
                    height: 260,
                    width: 160,
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  bookTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  bookTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w200),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                    child: Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        tempDescription,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            overflow: TextOverflow.visible,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: 60.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BookSummary(bookTitle)));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Icon(
                                  Icons.menu_book,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Read",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    overflow: TextOverflow.visible,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

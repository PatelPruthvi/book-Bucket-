import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';

class ReelQuotes extends StatefulWidget {
  const ReelQuotes({Key? key}) : super(key: key);

  @override
  State<ReelQuotes> createState() => _ReelQuotesState();
}

class _ReelQuotesState extends State<ReelQuotes> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark_blue,
      body: Stack(children: [
        PageView(
          controller: _controller,
          scrollDirection: Axis.vertical,
          // ignore: prefer_const_literals_to_create_immutables
          children: [MyPost(), MyPost(), MyPost()],
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.07,
            left: MediaQuery.of(context).size.width * 0.02,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new))),
      ]),
    );
  }
}

class MyPost extends StatefulWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  State<MyPost> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: getRandomColor(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
                'We are what we repeatedly do. Excellence, then, is not an act, but a habit.',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.left),
            Text(
              "-Aristrotle ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[900]),
              textAlign: TextAlign.right,
            )
          ],
        ),
      ),
    );
  }
}

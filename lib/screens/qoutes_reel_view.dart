import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReelQuotes extends StatefulWidget {
  const ReelQuotes({Key? key}) : super(key: key);

  @override
  State<ReelQuotes> createState() => _ReelQuotesState();
}

class _ReelQuotesState extends State<ReelQuotes> {
  final _controller = PageController();
  @override
  void initState() {
    getD();
    super.initState();
  }

  Map? mapdata;
  List<String>? abc;
  Future getD() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://goquotes-api.herokuapp.com/api/v1/random?count=20'));

    if (response.statusCode == 200) {
      setState(() {
        mapdata = json.decode(response.body);
      });
    }
    print(mapdata!['quotes'][0]['text']);
    print(mapdata!['quotes'][0]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark_blue,
      body: Stack(children: [
        PageView(
          controller: _controller,
          scrollDirection: Axis.vertical,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            if (mapdata != null)
              for (int i = 0; i < 20; i++)
                MyPost(mapdata!['quotes'][i]['text'],
                    mapdata!['quotes'][i]['author'])
            else
              CircularProgressIndicator(),
            // MyPost("", ""),
            // MyPost("", ""),
            // MyPost("", ""),
            // MyPost("", ""),
            // MyPost("", ""),
            // MyPost("", ""),
          ],
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
  String quotes, author;
  MyPost(this.quotes, this.author, {Key? key}) : super(key: key);

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
            Text(widget.quotes,
                overflow: TextOverflow.ellipsis,
                maxLines: 11,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.left),
            Text(
              "- " + widget.author,
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

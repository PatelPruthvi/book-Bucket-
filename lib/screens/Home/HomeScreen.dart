import 'package:bookbucket/utils/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'BookDetail.dart';
import 'SeeAllBooks.dart';
import 'item_collections.dart';
import 'item_home_books.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final connectedRef = FirebaseDatabase.instance.ref(".info/connected");
    connectedRef.onValue.listen((event) {
      final connected = event.snapshot.value as bool? ?? false;
      if (connected) {
        debugPrint("Connected.");
      } else {
        debugPrint("Not connected.");
      }
    });
    super.initState();
  }

  List<String> arr = [
    "Bill Gates Bookshelf",
    "Elon Musk Bookshelf",
    "Mark Zaku Bookshelf",
    "Top 5 Business Boosting",
    "Top 5 Leadership",
    "Warren Buffet Bookshelf"
  ];
  List<String> links = [
    'https://image.winudf.com/v2/image/YmQuY29tLmRvZC5iaWxsZ2F0ZXN0aGVyb2FkYWhlYWRfc2NyZWVuXzBfMTUzMDEwNTgzNF8wNTM/screen-0.jpg?fakeurl=1&type=.webp',
    'https://static01.nyt.com/images/2015/05/13/arts/13BOOKVANCE/13BOOKVANCE-superJumbo.jpg?quality=75&auto=webp',
    'https://m.media-amazon.com/images/I/41nrwyppetL._SX322_BO1,204,203,200_.jpg',
    'https://cdn.lifehack.org/wp-content/uploads/2014/05/the-magic-of-thinking-big.jpg',
    'https://cdn.lifehack.org/wp-content/uploads/2014/05/how-to-win-friends-and-influence-people.jpg',
    'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1374910955l/17972688.jpg'
  ];

  Query win_at_work =
      FirebaseDatabase.instance.ref().child("Home").child("To_Win_at_work");
  Query have_more_money =
      FirebaseDatabase.instance.ref().child("Home").child("To_have_more_money");
  Query be_business_booster = FirebaseDatabase.instance
      .ref()
      .child("Home")
      .child("To be business booster");
  Query be_a_prod =
      FirebaseDatabase.instance.ref().child("Home").child("To_be_productive");

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
        ),
        backgroundColor: dark_blue,
        centerTitle: false,
      ),
      body: Container(
        color: dark_blue,
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 4),
                      child: const Text(
                        "Collections",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return item_collection(
                            FirebaseDatabase.instance
                                .ref()
                                .child("Home")
                                .child("Collections")
                                .child(arr[index]),
                            arr[index],
                            links[index]);
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Text(
                        "To Win at Work",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllBooks(
                                      "To Win at Work",
                                      "https://content.thriveglobal.com/wp-content/uploads/2020/07/IMG_0308.jpg?w=1024",
                                      "Why Men Win at Work",
                                      FirebaseDatabase.instance
                                          .ref()
                                          .child("Home")
                                          .child("To_Win_at_work"))));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                              OutlinedBorder?>((states) {
                            // Rounded button (when the button is pressed)
                            if (states.contains(MaterialState.pressed)) {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }
                          }),
                        ),
                        child: Text('See all'),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: FirebaseAnimatedList(
                    scrollDirection: Axis.horizontal,
                    query: win_at_work,
                    itemBuilder: (context, snapshot, animation, index) {
                      return item_home_books(
                          snapshot.child("Book-img-url").value.toString(),
                          snapshot.child("Book-title").value.toString(),
                          snapshot.child("Book-description").value.toString(),
                          snapshot.child("Book-summary").value.toString());
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Text(
                        "To have more money",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllBooks(
                                      "To have more money",
                                      "https://m.media-amazon.com/images/I/51gIriQ5hLL.jpg",
                                      "How to make more Money",
                                      FirebaseDatabase.instance
                                          .ref()
                                          .child("Home")
                                          .child("To_have_more_money"))));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                              OutlinedBorder?>((states) {
                            // Rounded button (when the button is pressed)
                            if (states.contains(MaterialState.pressed)) {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }
                          }),
                        ),
                        child: Text('See all'),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: FirebaseAnimatedList(
                    scrollDirection: Axis.horizontal,
                    query: have_more_money,
                    itemBuilder: (context, snapshot, animation, index) {
                      return item_home_books(
                          snapshot.child("Book-img-url").value.toString(),
                          snapshot.child("Book-title").value.toString(),
                          snapshot.child("Book-description").value.toString(),
                          snapshot.child("Book-summary").value.toString());
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Text(
                        "To be Productive",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllBooks(
                                      "To be Productive",
                                      "https://m.media-amazon.com/images/I/41XMvYgrIcL._SL500_.jpg",
                                      "Calender Hacking",
                                      FirebaseDatabase.instance
                                          .ref()
                                          .child("Home")
                                          .child("To_be_productive"))));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                              OutlinedBorder?>((states) {
                            // Rounded button (when the button is pressed)
                            if (states.contains(MaterialState.pressed)) {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }
                          }),
                        ),
                        child: Text('See all'),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: FirebaseAnimatedList(
                    scrollDirection: Axis.horizontal,
                    query: be_a_prod,
                    itemBuilder: (context, snapshot, animation, index) {
                      return item_home_books(
                          snapshot.child("Book-img-url").value.toString(),
                          snapshot.child("Book-title").value.toString(),
                          snapshot.child("Book-description").value.toString(),
                          snapshot.child("Book-summary").value.toString());
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Text(
                        "To be Business Booster",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllBooks(
                                      "To be Business Booster",
                                      "https://149502452.v2.pressablecdn.com/wp-content/uploads/2020/11/the-lean-startup-book-001-1-2048x1152.jpeg",
                                      "The Learn Startup",
                                      FirebaseDatabase.instance
                                          .ref()
                                          .child("Home")
                                          .child("To be business booster"))));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                              OutlinedBorder?>((states) {
                            // Rounded button (when the button is pressed)
                            if (states.contains(MaterialState.pressed)) {
                              return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20));
                            }
                          }),
                        ),
                        child: Text('See all'),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: FirebaseAnimatedList(
                    scrollDirection: Axis.horizontal,
                    query: be_business_booster,
                    itemBuilder: (context, snapshot, animation, index) {
                      return item_home_books(
                          snapshot.child("Book-img-url").value.toString(),
                          snapshot.child("Book-title").value.toString(),
                          snapshot.child("Book-description").value.toString(),
                          snapshot.child("Book-summary").value.toString());
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

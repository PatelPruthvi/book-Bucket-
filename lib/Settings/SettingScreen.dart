import 'package:bookbucket/utils/colors.dart';
import 'package:bookbucket/utils/constants.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
        ),
        backgroundColor: dark_blue,
        centerTitle: false,
      ),
      backgroundColor: dark_blue,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/premium-vector/teamwork-finding-new-ideas-little-people-launch-mechanism-search-new-solutions-vector_566886-659.jpg?w=996"),
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
                ProfileMenu(
                  text: "Bookmarks",
                  press: () => {},
                ),
                ProfileMenu(
                  text: "About us",
                  press: () => {},
                ),
                ProfileMenu(
                  text: "Contact us",
                  press: () => {},
                ),
                ProfileMenu(
                  text: "Share",
                  press: () => {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: dark_blue,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SizedBox(width: 20),
            Expanded(child: Text(text, style: TextStyle(fontSize: 20))),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';

class QoutesViewbar extends StatefulWidget {
  const QoutesViewbar({Key? key}) : super(key: key);

  @override
  State<QoutesViewbar> createState() => _QoutesViewbarState();
}

class _QoutesViewbarState extends State<QoutesViewbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quotes',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
        ),
        backgroundColor: dark_blue,
        centerTitle: false,
      ),
      backgroundColor: dark_blue,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/InspireQuo');
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.8), BlendMode.dstATop),
                          image: AssetImage('assets/images/inspiring.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: const Center(
                        child: Text(
                      'Inspiring Quotes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.w400),
                    )),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/BookQuo');
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/books.jpg'),
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.8), BlendMode.dstATop),
                          fit: BoxFit.cover,
                        )),
                    child: const Center(
                        child: Text(
                      'Book Quotes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';

class AudioBookUI extends StatefulWidget {
  const AudioBookUI({Key? key}) : super(key: key);

  @override
  State<AudioBookUI> createState() => _AudioBookUIState();
}

class _AudioBookUIState extends State<AudioBookUI> {
  Duration compl = Duration(seconds: 0);
  Duration total = Duration(seconds: 1400);
  bool pause = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark_blue,
        centerTitle: false,
        title: const Text('Book Info',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400)),
      ),
      backgroundColor: dark_blue,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: dark_blue_1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(80),
                )),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: Image.network(
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1344270266l/6012533.jpg',
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 10),
          child: Text('How do successful people think ',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w400)),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: ProgressBar(
            progress: compl,
            total: total,
            onSeek: (value) {
              setState(() {
                compl = value;
              });
            },
            onDragUpdate: (details) {
              setState(() {
                compl = details.timeStamp;
              });
            },
            progressBarColor: dark_blue_2,
            thumbColor: dark_blue_2,
            timeLabelLocation: TimeLabelLocation.above,
            timeLabelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            timeLabelPadding: 3.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 40),
          child: Container(
              height: MediaQuery.of(context).size.height / 10,
              child: IconButton(
                iconSize: 60,
                icon: pause
                    ? Icon(
                        Icons.play_circle,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.pause_circle,
                        color: Colors.white,
                      ),
                onPressed: () {
                  setState(() {
                    pause = !pause;
                  });
                },
              )),
        )
      ]),
    );
  }
}

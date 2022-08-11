// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:bookbucket/utils/colors.dart';
import 'package:flutter/material.dart';

class AudioBookUI extends StatefulWidget {
  const AudioBookUI({Key? key}) : super(key: key);

  @override
  State<AudioBookUI> createState() => _AudioBookUIState();
}

class _AudioBookUIState extends State<AudioBookUI> {
  Duration compl = Duration.zero;
  Duration total = Duration.zero;
  bool isPlaying = false;
  AudioPlayer _player = AudioPlayer();
  String audiobook =
      'https://ia801506.us.archive.org/16/items/cheatingthejunkpile_2208_librivox/cheatingthejunkpile_00_peyser_64kb.mp3';

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getAudio();
    _player.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.PLAYING;
      });
    });
    _player.onDurationChanged.listen((Duration) {
      setState(() {
        total = Duration;
      });
    });
    _player.onAudioPositionChanged.listen((posi) {
      setState(() {
        compl = posi;
      });
    });
    _player.setUrl(audiobook);
    super.initState();
  }

  getAudio() async {
    await _player.play(audiobook);
  }

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
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                compl.toString().substring(2, 7),
                style: TextStyle(color: Colors.white),
              ),
              Expanded(
                child: Slider(
                    activeColor: dark_blue_2,
                    min: 0,
                    max: total.inSeconds.toDouble(),
                    value: compl.inSeconds.toDouble(),
                    onChanged: (val) async {
                      compl = Duration(seconds: val.toInt());
                      await _player.seek(compl);
                      setState(() {});
                    }),
              ),
              Text(
                total.toString().substring(2, 7),
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 40),
          child: Container(
              height: MediaQuery.of(context).size.height / 10,
              child: IconButton(
                iconSize: 60,
                icon: isPlaying
                    ? Icon(
                        Icons.pause_circle,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.play_circle,
                        color: Colors.white,
                      ),
                onPressed: () async {
                  if (isPlaying) {
                    await _player.pause();
                  } else {
                    await _player.resume();
                  }
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
              )),
        ),
      ]),
    );
  }
}

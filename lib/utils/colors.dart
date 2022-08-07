import 'dart:math';

import 'package:flutter/material.dart';

const Color dark_blue = Color.fromRGBO(0, 22, 36, 1);
const Color dark_blue_1 = Color(0xFF2f3e5c);
const Color dark_blue_2 = Color.fromARGB(255, 11, 109, 245);

getRandomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

const Color dark_blue = Color.fromRGBO(0, 22, 36, 1);
RandomColor _randomColor = RandomColor();
getRandomColor() {
  return _randomColor.randomColor(
      colorBrightness: ColorBrightness.light,
      colorSaturation: ColorSaturation.lowSaturation);
}

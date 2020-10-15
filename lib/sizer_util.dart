import 'package:flutter/material.dart';

class SizerUtil {
  static double width;
  static double height;
  static Orientation _orientation;

  void init(BoxConstraints constraints, Orientation orientation) {
    _orientation = orientation;
    if (orientation == Orientation.portrait) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;
    } else {
      width = constraints.maxHeight;
      height = constraints.maxWidth;
    }
  }

  get orientation => _orientation;
}

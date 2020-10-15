import 'package:flutter/material.dart';

class SizerUtil {
  static double _width;
  static double _height;
  static Orientation _orientation;

  void init(BoxConstraints constraints, Orientation orientation) {
    _orientation = orientation;
    if (orientation == Orientation.portrait) {
      _width = constraints.maxWidth;
      _height = constraints.maxHeight;
    } else {
      _width = constraints.maxHeight;
      _height = constraints.maxWidth;
    }
  }

  static height(var i) {
    return _height * i / 100;
  }

  static width(var i) {
    return _width * i / 100;
  }

  static sp(var i) {
    return _width * i / 1000;
  }

  get orientation => _orientation;
}

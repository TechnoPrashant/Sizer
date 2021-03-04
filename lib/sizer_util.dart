import 'package:flutter/material.dart';

class SizerUtil {
  static late double _width;
  static late double _height;
  static late Orientation _orientation;
  static late DeviceType _deviceType;

  void init(BoxConstraints constraints, Orientation orientation) {
    //use constraints object for maxWidth and maxHeight of device screen

    _orientation = orientation;
    if (orientation == Orientation.portrait) {
      _width = constraints.maxWidth;
      _height = constraints.maxHeight;
    } else {
      _width = constraints.maxHeight;
      _height = constraints.maxWidth;
    }

    //for mobile and tablet screen
    if (_width < 600) {
      _deviceType = DeviceType.Mobile;
    } else {
      _deviceType = DeviceType.Tablet;
    }
  }

  //If you want to set height 50% of screen height then follow this method
  // screenHeight * yourInput /100;
  static height(var i) {
    return _height * i / 100;
  }

  //If you want to set width 50% of screen width then follow this method
  // screenWidth * yourInput /100;
  static width(var i) {
    return _width * i / 100;
  }

  //If you want to set textSize 50% of screen width then follow this method
  // screenWidth * yourInput /1000;
  static sp(var i) {
    return _width / 100 * (i / 3);
  }

  static get orientation => _orientation;

  static get deviceType => _deviceType;
}

enum DeviceType {
  Mobile,
  Tablet,
}

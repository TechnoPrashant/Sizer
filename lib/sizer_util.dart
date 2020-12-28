import 'package:flutter/material.dart';

class SizerUtil {
  static double _width;
  static double _height;
  static Orientation _orientation;
  static DeviceType _deviceType;
  void init(BoxConstraints constraints, Orientation orientation) {
    //use constraints object for maxWidth and maxHeight of device screen
    _orientation = orientation;
    _width = constraints.maxWidth;
    _height = constraints.maxHeight;
    //for mobile and tablet screen
    if ((_orientation == Orientation.portrait && _width < 600) || (_orientation == Orientation.landscape && _height < 600)) {
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

part of sizer;

extension SizerExt on num {
//  *****************  Absolute length units *****************************************
  // https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units

  /// The respective value in centimeters
  double get cm => this * 37.8;

  /// The respective value millimeters
  double get mm => this * 3.78;

  /// The respective value in quarter-millimeters
  double get Q => this * 0.945;

  /// The respective value in inches
  double get inches => this * 96;

  /// The respective value in picas (1/6th of 1 inch)
  double get pc => this * 16;

  /// The respective value in points (1/72th of 1 inch)
  double get pt => this * inches / 72;

  /// The respective value in pixels (default)
  double get px => this.toDouble();

  //  *****************  Relative length units *****************************************
  // https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units

  // TODO Recursive units need to be implemented
  /*double get em => ;
  double get ex => ;
  double get ch => ;
  double get rem => ;
  double get lh => ;*/

  /// Respective percentage of the viewport's smaller dimension.
  double get vmin => this * min(Device.height, Device.width) / 100;

  /// Respective percentage of the viewport's larger dimension.
  double get vmax => this * max(Device.height, Device.width) / 100;

  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * Device.height / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => this * Device.width / 100;

  /// Calculates the height depending on the remaining device height
  /// after using `SafeArea`
  /// Eg: 20.sh -> will take 20% of the safe area height
  double get sh => this * Device.safeHeight / 100;

  /// Calculates the width depending on the remaining device width
  /// after using `SafeArea`
  ///
  /// Eg: 20.sw -> will take 20% of the safe area width
  double get sw => this * Device.safeWidth / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's pixel
  /// density and aspect ratio
  double get sp =>
      this *
      (((h + w) + (Device.pixelRatio * Device.aspectRatio)) / 2.08) /
      100;

  /// Calculates the material dp (Pixel Density)
  /// (https://material.io/design/layout/pixel-density.html#pixel-density-on-android))
  double get dp => this * (w * 160) / Device.pixelRatio;

  /// Calculates the sp (Scalable Pixel) based on Issue #27
  double get spa =>
      this * (((h + w) + (240 * Device.aspectRatio)) / 2.08) / 100;
}

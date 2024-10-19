part of sizer;

/// Type of Device
///
/// This can be android, ios, fuchsia, web, or desktop (windows, mac, linux)
enum DeviceType { android, ios, fuchsia, web, windows, mac, linux }

/// Type of Screen
///
/// This can either be mobile or tablet
enum ScreenType { mobile, tablet, desktop }

class Device {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  static late DeviceType deviceType;

  /// Type of Screen
  static late ScreenType screenType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  // TODO: Reconsider if we should include AppBar and BottomNavigationBar
  // in safe height calculation

  /// Device's Remaining Height after applying `SafeArea`
  static late double safeHeight;

  /// Device's Remaining Width after applying `SafeArea`
  static late double safeWidth;

  /// Device's Aspect Ratio
  static late double aspectRatio;

  /// Device's Pixel Ratio
  static late double pixelRatio;

  /// Sets the Screen's size and Device's `Orientation`,
  /// `BoxConstraints`, `Height`, and `Width`
  static void setScreenSize(
    BuildContext context,
    BoxConstraints constraints,
    Orientation currentOrientation,
    double maxMobileWidth, [
    double? maxTabletWidth,
  ]) {
    // Sets boxconstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Sets screen width and height
    width = boxConstraints.maxWidth;
    height = boxConstraints.maxHeight;

    // Calculates remaining available size after `SafeArea`
    // final viewPadding = MediaQuery.of(context).viewPadding;
    final viewPadding = MediaQuery.viewPaddingOf(context);
    safeWidth = width - (viewPadding.left + viewPadding.right);
    safeHeight = height - (viewPadding.top + viewPadding.bottom);

    // Sets aspect and pixel ratio
    aspectRatio = constraints.constrainDimensions(width, height).aspectRatio;
    pixelRatio = MediaQuery.of(context).devicePixelRatio;
    pixelRatio = MediaQuery.devicePixelRatioOf(context);

    // Sets DeviceType
    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          deviceType = DeviceType.android;
          break;
        case TargetPlatform.iOS:
          deviceType = DeviceType.ios;
          break;
        case TargetPlatform.windows:
          deviceType = DeviceType.windows;
          break;
        case TargetPlatform.macOS:
          deviceType = DeviceType.mac;
          break;
        case TargetPlatform.linux:
          deviceType = DeviceType.linux;
          break;
        case TargetPlatform.fuchsia:
          deviceType = DeviceType.fuchsia;
          break;
      }
    }

    // Sets ScreenType
    if ((orientation == Orientation.portrait && width <= maxMobileWidth) ||
        (orientation == Orientation.landscape && height <= maxMobileWidth)) {
      screenType = ScreenType.mobile;
    } else if (maxTabletWidth == null ||
        (orientation == Orientation.portrait && width <= maxTabletWidth) ||
        (orientation == Orientation.landscape && height <= maxTabletWidth)) {
      screenType = ScreenType.tablet;
    } else {
      screenType = ScreenType.desktop;
    }
  }
}

class Adaptive {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  static double h(num height) => height.h;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  static double w(num width) => width.w;

  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.sh -> will take 20% of the safe area height
  static double sh(num height) => height.sh;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.sw -> will take 20% of the safe area width
  static double sw(num width) => width.sw;

  /// Calculates the sp (Scalable Pixel) depending on the device's pixel
  /// density and aspect ratio
  static double sp(num scalablePixel) => scalablePixel.sp;

  /// Calculates the material dp (Pixel Density)
  /// (https://material.io/design/layout/pixel-density.html#pixel-density-on-android))
  static double dp(num densityPixel) => densityPixel.dp;

  /// The respective value in centimeters
  static double cm(num centimeters) => centimeters.cm;

  /// The respective value in millimeters
  static double mm(num millimeters) => millimeters.mm;

  /// The respective value in quarter-millimeters
  static double Q(num quarterMillimeters) => quarterMillimeters.Q;

  /// The respective value in inches
  static double inches(num inches) => inches.inches;

  /// The respective value in picas (1/6th of 1 inch)
  static double pc(num picas) => picas.pc;

  /// The respective value in points (1/72th of 1 inch)
  static double pt(num point) => point.pt;

  /// The respective value in pixels (default)
  static double px(num pixels) => pixels.px;
}

### Sizer (Responsive UI solution for Mobile App,Web and Desktop)

<p align="center" >
  <strong>Sizer is helps you to create responsive UI easily.</strong>
  <br />
  <br />
  <a href="https://www.buymeacoffee.com/fluttersizer" target="_blank"><img width="180px" src="https://raw.githubusercontent.com/TechnoUrmish/Sizer/master/example/images/iv_buy_me_a_coffee.png" style="height: 51px !important;width: 217px !important;" ></a>
</p>

<br />

A Flutter package that effortlessly makes your apps responsive. It automatically adapts the UI to various screen sizes, making responsiveness simple and intuitive. Responsiveness made easy.

![Alt Text](https://github.com/TechnoUrmish/Sizer/blob/master/example/images/img_ss_with_lib.png)

![Alt Text](https://github.com/TechnoUrmish/Sizer/blob/master/example/images/img_ss_without_lib.png)

### Content

- [Installation](#installation)
- [How to use](#usage)
- [Guideline](#guideline)
- [Note](#note)
- [FAQ](#faq)

## Installation ⬇️
Add `sizer` to pubspec.yaml
```yaml
dependencies:
  sizer: ^3.0.3
```

### How to use ⚙️ 

### Import the Package
```dart
import 'package:sizer/sizer.dart';
```

### Wrap MaterialApp with Sizer widget
```dart
Sizer( 
  builder: (context, orientation, screenType) {
    return MaterialApp(
      home: HomePage(),
    );
  },
);
```

### Widget Size
```dart
Container(
  width: Adaptive.w(20),    // This will take 20% of the screen's width
  height: 30.5.h     // This will take 30.5% of the screen's height
)
```

### Font size
```dart
Text(
  'Sizer', 
  style: TextStyle(fontSize: 15.dp), 
  // 15.sp can also be used instead of .dp
  // To know their differences, check #FAQ
)
```

### Orientation

If you want to support both portrait and landscape orientations
```dart
Device.orientation == Orientation.portrait
  ? Container(   // Widget for Portrait
      width: 100.w,
      height: 20.5.h,
   )
  : Container(   // Widget for Landscape
      width: 100.w,
      height: 12.5.h,
   )
```

### ScreenType

Same layout to look different in tablet and mobile, use the ``Device.screenType`` method:

```dart
Device.screenType == ScreenType.tablet
  ? Container(   // Widget for Tablet
      width: 100.w,
      height: 20.5.h,
   )
  : Container(   // Widget for Mobile
      width: 100.w,
      height: 12.5.h,
   )
```
*`Device.ScreenType` **can not** be *Desktop* unless `maxTabletWidth` is set

## Guideline
### Sizer
* `maxMobileWidth` - Maximum width of a mobile device
  (If the device's width is larger than this, it will be categorized as a tablet) - Default value: 599
* `maxTabletWidth` - Maximum width of a tablet device
  (If the device's width is larger than this, it will be categorized as a desktop) - Optional: enables *Desktop* `ScreenType` if enabled

### Extensions
* `Adaptive.h()` or `.h` - Calculated percentage of the device's **height** (40.h -> 40% of device's height)
* `Adaptive.w()` or `.w` - Calculated percentage of the device's **width** (40.w -> 40% of device's width)
* `Adaptive.sp()` or `.sp` - Calculated sp based on the device's pixel density and aspect ratio (See [FAQ](#sp-dp-difference))
* `Adaptive.dp()` or `.dp` - Calculated dp based on the device's pixel density (See [FAQ](#sp-dp-difference))

##### *Note: Only use `.sh` and `.sw` if you want height and width to depend on the device's available height and width after applying SafeArea. Use `.h` and `.w` by default.
* `Adaptive.sh()` or `.sh` - Calculated percentage of the **remaining device's height** after applying `SafeArea`
* `Adaptive.sw()` or `.sw` - Calculated percentage of the **remaining device's width** after applying `SafeArea`

<br />

* `Device.boxConstraints` - BoxConstraints of the device
* `Device.orientation` - Screen Orientation of the device (portrait or landscape)
* `Device.screenType` - Screen type of the device (mobile or tablet)
* `Device.aspectRatio` - Aspect ratio of the device
* `Device.pixelRatio` - Pixel density ratio of the device

<br />

* `Adaptive.cm()` or `.cm` - The respective value in value in centimeters
* `Adaptive.mm()` or `.mm` - The respective value in value in millimeters
* `Adaptive.Q()` or `.Q` - The respective value in quarter-millimeters
* `Adaptive.inches()` or `.inches` - The respective value in inches
* `Adaptive.pc()` or `.pc` - The respective value in picas (1/6th of 1 inch)
* `Adaptive.pt()` or `.pt` - The respective value in points (1/72th of 1 inch)
* `Adaptive.px()` or `.px` - The respective value in pixels

## Note

You need to import `sizer` package in order to access `number.h`, `number.w`, `number.dp`, and `number.sp`

**Auto import in VSCode and Android Studio doesn't work for dart extension methods.** Typing `10.h` would not bring up auto import suggestion for this package

One workaround is to type `Device` so that the auto import suggestion would show up:
```dart
import 'package:sizer/sizer.dart';
```
# FAQ

### <a id="sp-dp-difference"></a>What is the difference between `.sp` and `.dp`?

`.dp` is *supposedly* calculated [see below](#dp-sp-calculation) based on Material Design's [dp calculation](https://material.io/design/layout/pixel-density.html#pixel-density-on-android)
while`.sp` is calculated based on the device's [pixel density and aspect ratio](https://github.com/CoderUni/responsive_sizer/blob/f1558c80bc2c2ca7db3ccbd4b34a30c87f3c5f0e/lib/src/extension.dart#L54)

### <a id="dp-sp-calculation"></a>Why is dp not calculated using the device's screen density?

Since there is no way to obtain a device's physical width in inches, we could not calculate for screen density. Material Design's [screen density calculation](https://material.io/design/layout/pixel-density.html#pixel-density-on-android) involves a device's physical width in inches. As an alternative, dp is calculated using the device's [pixel ratio](https://api.flutter.dev/flutter/dart-ui/FlutterView/devicePixelRatio.html).

# Community Support

If you have any suggestions or issues, feel free to open an [issue](https://github.com/TechnoPrashant/Sizer/issues)

If you would like to contribute, feel free to create a [PR](https://github.com/TechnoPrashant/Sizer/pulls)

# sizer

A flutter plugin for Easily make Flutter apps responsive. Automatically adapt UI to different screen sizes. Responsiveness made simple.

## Installation：
Add to pubspec.yaml.
```
dependencies:
  ...
  sizer: ^1.1.3
```

## How to use

Add the following imports to your Dart code: 
```
import 'package:sizer/sizer.dart';
```


* First need to Initialize SizerUtil.init() method inside main.dart.
* In main.dart must have to use LayoutBuilder and OrientationBuilder. 
* See below explain for more details.


```
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(                           //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(                  //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation);  //initialize SizerUtil
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Sizer',
              theme: ThemeData.light(),
              home: LoginScreen(),
            );
          },
        );
      },
    );
  }
}
```

You can use it like this: 

Whenever you use height and width first import sizer package.
```
import 'package:sizer/sizer.dart';
```

**Widget Size**
```
    Container(
      width: 20.0.w,    //It will take a 20% of screen width
      height:30.0.h     //It will take a 20% of screen height
    )
```

Padding
```
    Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 3.0.h),
      child: Container(),
    );
```

Font size
```
    Text(
      'Sizer',style: TextStyle(fontSize: 15.0.sp),
    );
```

If you want to make square size widget then give height or width in both height and width.
```
    Container(
            width: 30.0.h,      //It will take a 20% of screen height
            height: 30.0.h,     //It will take a 20% of screen height
    );
```

If you want to give support for landscape
```
appBar() {
    return SizerUtil.orientation == Orientation.portrait
        ? Container(
            width: 100.0.w,
            height: 20.0.h,
          )                     //for portrait screen
        : Container(
            width: 100.0.w,
            height: 12.0.h,
          );                    //for landscape screen
  }
```

If you want the same layout to look different in tablet and mobile then use **SizerUtil.getDeviceType** method
```
SizerUtil.getDeviceType
```

You can use it like this:
```
 appBar() {
    return SizerUtil.getDeviceType == DeviceScreenType.Tablet
        ? Container(
            width: 100.0.w,
            height: 20.0.h,
          )                     //for Tablet
        : Container(
            width: 100.0.w,
            height: 12.0.h,
          );                    //for Mobile
  }
```
# sizer

A flutter plugin for Easily make Flutter apps responsive. Automatically adapt UI to different screen sizes. Responsiveness made simple.

## Installation：
Add to pubspec.yaml.
```
dependencies:
  ...
  sizer: ^0.1.1
```

##How to use.

Add the following imports to your Dart code: 
```
import 'package:sizer/sizer.dart';
```

Initialize SizerUtil class in MyApp() under OrientationBuilder(Compulsory return LayoutBuilder and OrientationBuilder).
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation);  
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
Widget Size
```
    Container(
      width: 20.w,
      height:30.h
    )
```

Padding
```
     Padding(
      padding: EdgeInsets.all(10.0.h),
      child: Container(),
    );
```

Text size
```
    Text(
      'Sizer',style: TextStyle(fontSize: 15.0.sp),
    );
```

If you want to make square size widget then give height or width in both height and width.
```
    Container(
            width: 30.0.h,
            height: 30.0.h,
    );
```

If you want to give support for landscape
```
appBar() {
    return SizerUtil.orientation == Orientation.portrait
        ? Container(
            width: 100.0.w,
            height: 20.0.h,
          ) //for portrait screen
        : Container(
            width: 100.0.w,
            height: 12.0.h,
          ); //for landscape screen
  }
```

**NOTE:** Acceptable height and width 0 to 100.
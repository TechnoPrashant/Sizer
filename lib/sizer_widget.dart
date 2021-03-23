import 'package:flutter/material.dart';
import 'package:sizer/sizer_util.dart';

/// Custom widget for use Sizer package without implementing anything.
/// Alredy initilazed `SizerUtil.init`. and wraped with [LayoutBuilder] and [OrientationBuilder]
/// For use it you just have to add `SizerWidget(...)` and import it's child, so its required you can't blank:
/// ```dart
/// SizerWidget(
///  child:  MaterialApp(
///   debugShowCheckedModeBanner: false,
///   title: 'Sizer',
///   theme: ThemeData.light(),
///   home: LoginScreen(),
///  );
/// ),
/// ```
class SizerWidget extends StatelessWidget {

  /// Widget child property for build widget. 
  /// with implemented Layoult and Orientation.
  final Widget child;

  const SizerWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create instance of [SizerUtil]
    SizerUtil sizer = SizerUtil();
    return LayoutBuilder(
      key: key,
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          /// Initilaze [SizerUtil().init(...)] for get right screen sizes.
          sizer.init(constraints, orientation);
          return child;
        },
      ),
    );
  }
}

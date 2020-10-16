import 'package:sizer/sizer_util.dart';

extension SizerExt on double {
  //How to use

  //Whenever you use height then use this method like this => [20.0.h]
  double get h => SizerUtil.height(this);

  //Whenever you use width then use this method like this => [10.0.h]
  double get w => SizerUtil.width(this);

  //Whenever you use text size then use this method like this => [5.0.sp]
  double get sp => SizerUtil.sp(this);
}

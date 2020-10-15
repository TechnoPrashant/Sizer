import 'package:sizer/sizer_util.dart';

extension SizerExt on double {
  double get h => SizerUtil.height(this);

  double get w => SizerUtil.width(this);

  double get sp => SizerUtil.sp(this);
}

library sizer;

import 'package:sizer/sizer_util.dart';

extension CalciExtension on double {
  double h() {
    if (this <= 100) {
      return SizerUtil.height * this / 100;
    }
  }
  double w() {
    if (this <= 100) {
      return SizerUtil.width * this / 100;
    }
  }

  double sp() {
    if (this <= 100) {
      return SizerUtil.width * this / 1000;
    }
  }
}

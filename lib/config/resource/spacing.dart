import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpacingConfig {
  static const EdgeInsets zero = EdgeInsets.zero;

  // all
  static final EdgeInsets s04All = EdgeInsets.all(4.r);
  static final EdgeInsets s16All = EdgeInsets.all(16.r);
  static final EdgeInsets s20All = EdgeInsets.all(20.r);
  static final EdgeInsets s32All = EdgeInsets.all(32.r);

  // horizontal
  static final EdgeInsets s06Horizontal = EdgeInsets.symmetric(horizontal: 6.r);

  // vertical
  static final EdgeInsets s06Vertical = EdgeInsets.symmetric(vertical: 6.r);

  // symmetric
  static final EdgeInsets s10h04v = EdgeInsets.symmetric(horizontal: 10.r, vertical: 4.r);
  static final EdgeInsets s14h06v = EdgeInsets.symmetric(horizontal: 14.r, vertical: 6.r);
  static final EdgeInsets s16h15v = EdgeInsets.symmetric(horizontal: 16.r, vertical: 15.r);

  // only
  static final EdgeInsets s12t24b = EdgeInsets.only(top: 12.r, bottom: 24.r);
  static final EdgeInsets s16l16t16r08b = EdgeInsets.only(left: 16.r, top: 16.r, right: 16.r, bottom: 8.r);
}

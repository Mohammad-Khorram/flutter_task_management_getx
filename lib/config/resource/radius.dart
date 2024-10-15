import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';

class RadiusConfig {
  // all
  static final BorderRadius r08All = BorderRadius.circular(SizeConfig.s08.r);
  static final BorderRadius r16All = BorderRadius.circular(SizeConfig.s16.r);

  // only
  static final BorderRadius r16tl16tr = BorderRadius.only(
    topLeft: Radius.circular(SizeConfig.s16.r),
    topRight: Radius.circular(SizeConfig.s16.r),
  );
}

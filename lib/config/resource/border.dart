import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:task_management/core/constant/constants.dart';

class BorderConfig {
  static final snackBarBorderStyle = OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorConfig.transparent,
      width: SizeConfig.zero,
    ),
    borderRadius: Get.find<Constants>().radius(),
  );

  static final textFormFieldFocusedBorderStyle = OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorConfig.primary,
      width: SizeConfig.s01_5.r,
    ),
    borderRadius: Get.find<Constants>().radius(),
  );

  static final textFormFieldBorderStyle = OutlineInputBorder(
    borderSide: BorderSide(
      width: SizeConfig.s01.r,
      color: ColorConfig.color215,
    ),
    borderRadius: Get.find<Constants>().radius(),
  );
}

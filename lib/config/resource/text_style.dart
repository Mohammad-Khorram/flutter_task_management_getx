import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';

class TextStyleConfig {
  // appBar
  static final appBarTitleStyle = TextStyle(fontSize: SizeConfig.s14.sp);

  // snackBar
  static final snackBarStyle = TextStyle(fontSize: SizeConfig.s11.sp);

  // elevatedAction
  static const elevatedActionTitle = TextStyle(color: ColorConfig.light);

  // linearAction
  static final linearActionTitleStyle =
      TextStyle(fontSize: SizeConfig.s10_5.sp);

  // uiErrorHandling
  static final errorStyle = TextStyle(
    fontSize: SizeConfig.s11_5.sp,
    color: ColorConfig.color125,
    height: 2,
  );

  // bottomSheet
  static final TextStyle bottomSheetTitleStyle = TextStyle(
    fontSize: SizeConfig.s14.r,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bottomSheetDescriptionStyle = TextStyle(
    fontSize: SizeConfig.s11.r,
    height: 1.8,
  );

  static final TextStyle bottomSheetContentStyle =
      TextStyle(fontSize: SizeConfig.s12.r);

  // textFormField
  static final textFormFieldStyle = TextStyle(fontSize: SizeConfig.s13.sp);

  static final textFormFieldLabelStyle = TextStyle(
    color: ColorConfig.hint,
    fontSize: SizeConfig.s12.sp,
  );

  // todos
  static final TextStyle todoItemTitleStyle = TextStyle(
    fontSize: SizeConfig.s11_5.r,
    height: 1.75,
  );

  static final TextStyle createTodoStyle = TextStyle(
    fontSize: SizeConfig.s11_5.r,
    color: ColorConfig.light,
  );

  // filter
  static final TextStyle filterTitleStyle =
      TextStyle(fontSize: SizeConfig.s10.r);
}

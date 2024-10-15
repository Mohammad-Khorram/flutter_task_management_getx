import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';

class HorizontalDividerWidget extends StatelessWidget {
  final double? width;
  final double? thickness;
  final double? space;

  const HorizontalDividerWidget({
    super.key,
    this.width,
    this.thickness,
    this.space,
  });

  @override
  Widget build(BuildContext context) => Divider(
        color: ColorConfig.color213,
        thickness: thickness ?? SizeConfig.s0_5.r,
        height: space ?? SizeConfig.s08.r,
      );
}

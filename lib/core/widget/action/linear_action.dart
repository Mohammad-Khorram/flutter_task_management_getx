import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management/core/constant/constants.dart';

class LinearActionWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;

  const LinearActionWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: Get.find<Constants>().radius(),
        child: Container(
          padding: SpacingConfig.s14h06v,
          decoration: BoxDecoration(
            borderRadius: Get.find<Constants>().radius(),
            color: color?.withOpacity(0.1),
            border: Border.all(
              width: SizeConfig.s01.r,
              color: color ?? ColorConfig.color150,
            ),
          ),
          child: Text(
            title,
            style: TextStyleConfig.linearActionTitleStyle.copyWith(
              fontWeight: FontWeight.normal,
              color: color ?? ColorConfig.color87,
            ),
          ),
        ),
      );
}

import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_management/core/constant/constants.dart';

class BottomSheetItem extends StatelessWidget {
  final Widget content;
  final Function? onTap;
  final IconData? icon;
  final Color? iconColor;

  const BottomSheetItem({
    super.key,
    required this.content,
    this.onTap,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: SpacingConfig.s06Horizontal,
        child: InkWell(
          borderRadius: Get.find<Constants>().radius(),
          child: ListTile(
            title: icon == null
                ? content
                : Row(
                    children: [
                      buildIcon(icon: icon!, color: iconColor),
                      Gap(SizeConfig.s16.r),
                      content,
                    ],
                  ),
          ),
          onTap: () {
            if (onTap == null) {
              Get.back();
            } else {
              Get.back();
              onTap!();
            }
          },
        ),
      );

  Widget buildIcon({required IconData icon, Color? color}) => Icon(
        icon,
        size: SizeConfig.s18.r,
        color: color ?? ColorConfig.dark,
      );
}

class BottomSheetItemContent extends StatelessWidget {
  final String title;
  final TextStyle? style;

  const BottomSheetItemContent({super.key, required this.title, this.style});

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: style ?? TextStyleConfig.bottomSheetContentStyle,
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:task_management/core/constant/constants.dart';

class FilterItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const FilterItem({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: Get.find<Constants>().radius(),
          color: selected ? ColorConfig.dark : ColorConfig.transparent,
          border: Border.all(width: SizeConfig.s01.r, color: ColorConfig.dark),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: Get.find<Constants>().radius(),
          child: Padding(
            padding: SpacingConfig.s10h04v,
            child: Text(title,
                style: TextStyleConfig.filterTitleStyle.copyWith(
                    color: selected ? ColorConfig.light : ColorConfig.dark)),
          ),
        ),
      );
}

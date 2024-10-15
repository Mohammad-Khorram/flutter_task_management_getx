import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:task_management/config/boilerplate/widget_boilerplate.dart';

class BottomSheetContent extends StatelessWidget {
  final Widget content;
  final String? title;
  final String? description;

  const BottomSheetContent({
    super.key,
    required this.content,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (title != null || description != null)
            Container(
              alignment: Alignment.topLeft,
              padding: SpacingConfig.s16All,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) bottomSheetTitle(title!),
                  Gap(SizeConfig.s02.r),
                  if (description != null) bottomSheetDescription(description!),
                ],
              ),
            ),
          if ((title != null || description != null))
            HorizontalDividerWidget(thickness: SizeConfig.s01.r, space: 0),
          if (title == null && description == null) Gap(SizeConfig.s12.r),
          content,
        ],
      );

  Widget bottomSheetTitle(String title) => Text(
        title,
        style: TextStyleConfig.bottomSheetTitleStyle,
        textAlign: TextAlign.justify,
      );

  Widget bottomSheetDescription(String description) => Text(
        description,
        style: TextStyleConfig.bottomSheetDescriptionStyle
            .copyWith(color: ColorConfig.color125),
        textAlign: TextAlign.justify,
      );
}

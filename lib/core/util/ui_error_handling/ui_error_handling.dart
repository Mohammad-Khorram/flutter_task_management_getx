import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:task_management/config/boilerplate/widget_boilerplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

abstract class UIErrorHandling {
  Widget buildError({required String message, VoidCallback? onTap});
}

class UIErrorHandlingImpl implements UIErrorHandling {
  @override
  Widget buildError({
    required String message,
    VoidCallback? onTap,
  }) =>
      Container(
        alignment: Alignment.center,
        padding: SpacingConfig.s32All,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildMessage(message: message),
            if (onTap != null) ...[
              Gap(SizeConfig.s20.r),
              buildAction(title: 'Try again', onTap: onTap),
            ],
          ],
        ),
      );

  Widget buildMessage({required String message}) => Text(
        message,
        style: TextStyleConfig.errorStyle,
        textAlign: TextAlign.center,
      );

  Widget buildAction({required String title, required VoidCallback onTap}) =>
      LinearActionWidget(title: title, onTap: onTap);
}

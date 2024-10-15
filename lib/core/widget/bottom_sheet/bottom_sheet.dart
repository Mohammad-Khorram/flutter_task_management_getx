import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:task_management/config/boilerplate/widget_boilerplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

abstract class ModalBottomSheet {
  void bottomSheet({
    required Widget content,
    String? title,
    String? description,
  });
}

class BottomSheetWidget extends ModalBottomSheet {
  @override
  void bottomSheet({
    required Widget content,
    String? title,
    String? description,
  }) =>
      showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        backgroundColor: ColorConfig.color248,
        isDismissible: true,
        // if dismissible false -- drag_and_drop not worked!
        enableDrag: true,
        shape: RoundedRectangleBorder(borderRadius: RadiusConfig.r16tl16tr),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(SizeConfig.s12.r),
                const BottomSheetDismissibleIndicator(),
                Gap(SizeConfig.s12.r),
                BottomSheetContent(
                  title: title,
                  description: description,
                  content: content,
                ),
                Gap(SizeConfig.s12.r),
              ],
            ),
          );
        },
      );
}

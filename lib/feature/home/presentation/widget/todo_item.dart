import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_management/config/boilerplate/model_boilerplate.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:task_management/core/constant/constants.dart';

class TodoItem extends StatelessWidget {
  final TodoResponseModel model;
  final VoidCallback onTap;

  const TodoItem({super.key, required this.model, required this.onTap});

  @override
  Widget build(BuildContext context) => Padding(
        padding: SpacingConfig.s04All,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: Get.find<Constants>().radius()),
          color: ColorConfig.light,
          child: InkWell(
            onTap: onTap,
            borderRadius: Get.find<Constants>().radius(),
            child: Padding(
              padding: SpacingConfig.s20All,
              child: Row(
                children: [
                  buildOptions(),
                  Gap(SizeConfig.s12.r),
                  buildTitle(),
                  if (model.isCompleted) buildStatus(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildOptions() => Icon(
        CupertinoIcons.ellipsis_vertical,
        size: SizeConfig.s14.r,
        color: model.isCompleted ? ColorConfig.color175 : ColorConfig.dark,
      );

  Widget buildTitle() => Expanded(
        child: Text(
          model.title,
          style: TextStyleConfig.todoItemTitleStyle.copyWith(
            color: model.isCompleted ? ColorConfig.color175 : ColorConfig.dark,
            fontWeight: model.isCompleted ? FontWeight.normal : FontWeight.bold,
          ),
        ),
      );

  Widget buildStatus() => Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            CupertinoIcons.checkmark_alt_circle,
            color: ColorConfig.success,
            size: SizeConfig.s20.r,
          ),
        ),
      );
}

import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetDismissibleIndicator extends StatelessWidget {
  const BottomSheetDismissibleIndicator({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: Container(
          width: SizeConfig.s30.r,
          height: SizeConfig.s04.r,
          decoration: BoxDecoration(
            color: ColorConfig.color215,
            borderRadius: RadiusConfig.r16All,
          ),
        ),
      );
}

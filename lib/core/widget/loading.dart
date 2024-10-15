import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';

class LoadingWidget extends StatelessWidget {
  final double? size;
  final Color? color;

  const LoadingWidget({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) => SpinKitThreeBounce(
        color: color ?? ColorConfig.dark,
        size: size ?? SizeConfig.s22,
      );
}

class PaginateLoadingWidget extends StatelessWidget {
  const PaginateLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => LoadingWidget(size: SizeConfig.s14.r);
}

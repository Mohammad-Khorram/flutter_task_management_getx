import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:flutter/material.dart';

class BottomSheetPaddingColumnList extends StatelessWidget {
  final List<Widget> children;

  const BottomSheetPaddingColumnList({super.key, required this.children});

  @override
  Widget build(BuildContext context) => Container(
        margin: SpacingConfig.s06Vertical,
        child: Column(children: children),
      );
}

import 'package:flutter/cupertino.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';

abstract class Constants {
  BorderRadius radius();
}

class ConstantsConfig extends Constants {
  @override
  BorderRadius radius() => RadiusConfig.r08All;
}

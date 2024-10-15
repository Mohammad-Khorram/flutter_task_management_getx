import 'package:task_management/config/boilerplate/util_boilerplate.dart';
import 'package:flutter/material.dart';
import 'package:task_management/core/util/ui_error_handling/ui_error_handling.dart';

class ExceptionError extends UIErrorHandlingImpl {
  Widget buildExceptionError({required String message, VoidCallback? onTap}) =>
      buildError(message: message, onTap: onTap);
}

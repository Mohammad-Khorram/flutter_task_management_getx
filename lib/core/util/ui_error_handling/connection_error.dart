import 'package:flutter/material.dart';
import 'package:task_management/core/util/ui_error_handling/ui_error_handling.dart';

class ConnectionError extends UIErrorHandlingImpl {
  Widget buildConnectionError({required VoidCallback onTap}) => buildError(
        message: 'Please check your internet connection and try again.',
        onTap: onTap,
      );
}

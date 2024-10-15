import 'package:flutter/material.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? labelText;
  final bool autofocus;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.textInputAction,
    this.keyboardType,
    this.labelText,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
        cursorColor: ColorConfig.primary,
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: TextStyleConfig.textFormFieldStyle,
        autofocus: autofocus,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyleConfig.textFormFieldLabelStyle,
          enabledBorder: BorderConfig.textFormFieldBorderStyle,
          focusedBorder: BorderConfig.textFormFieldFocusedBorderStyle,
          counterText: '',
          contentPadding: SpacingConfig.s16h15v,
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final Function()? onEditingComplete;
  final TextEditingController? controller;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;

  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator, this.onEditingComplete, this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode:focusNode ,
      controller: controller,
      validator: validator,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
        hintStyle: hintStyle ??
            TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? AppColors.kField,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? const TextStyle(color: Colors.white),
    );
  }
}

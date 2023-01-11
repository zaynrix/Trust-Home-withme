import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app_routes/app_routes.dart';

class DefaultTextForm extends StatelessWidget {
  TextEditingController textEditingController;
  TextInputType textInputType;
  ValueChanged<String>? onFieldSubmitted;
  ValueChanged<String>? onChanged;
  bool isPassword;
  FormFieldValidator<String> validator;
  GestureTapCallback? onTap;
  String? label;
  String? hintText;
  Widget? iconData;
  Widget? iconDataSuffixx;
  bool isenable;
  bool hasPrefixIcon;
  bool? filled;
  bool? hint;

  DefaultTextForm(
      {super.key,
      required this.textEditingController,
      required this.textInputType,
      this.onFieldSubmitted,
      this.onChanged,
      this.onTap,
      this.isPassword = false,
      required this.validator,
      this.label,
      this.hintText,
      this.iconData,
      this.iconDataSuffixx,
      this.isenable = true,
      this.hasPrefixIcon = false,
      this.filled = false,
      this.hint = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.theme.textTheme.headline6,
      controller: textEditingController,
      keyboardType: textInputType,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
      enabled: isenable,
      obscureText: isPassword,
      textAlign: filled! ? TextAlign.center : TextAlign.start,
      decoration: InputDecoration(
          suffixIcon: iconDataSuffixx,
          suffixIconConstraints:
              const BoxConstraints(maxWidth: 40, maxHeight: 40),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: AppSizes.padding20),
          label: Text(label ?? ''),
          hintText: hintText,
          hintStyle: context.theme.textTheme.caption,
          labelStyle: context.theme.textTheme.headline3,
          filled: filled,
          fillColor: AppColors.containerColor,
          // icon: Icon(iconData),
          focusColor: AppColors.primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2.w),
            borderRadius: BorderRadius.circular(AppSizes.radius12.r),
          ),
          prefixIcon: iconData,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius12.r),
              borderSide: const BorderSide(color: AppColors.containerColor))),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String buttonText;
  final String page;
  final Function? function;

  const DefaultButton(this.buttonText, this.page, {this.function});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Get.toNamed(page);
        function;
      },
      height: context.theme.buttonTheme.height.h,
      shape: context.theme.buttonTheme.shape,
      color: AppColors.primaryColor,
      child: Text(
        buttonText,
        style: context.theme.textTheme.headline2,
      ),
    );
  }
}

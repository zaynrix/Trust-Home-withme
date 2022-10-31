import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 189.h,
                  child: Image.asset(
                    AppImages.singInImage,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: AppSizes.height40,
              ),

              DefaultTextForm(
                  textEditingController: TextEditingController(),
                  textInputType: TextInputType.phone,
                  validator: ((value) => 'unCorrect Phone Number'),
                  label: AppTexts.phoneNumber,
                  hasPrefixIcon: true,
                  iconData: Image.asset(
                    AppImages.phoneIcon,
                    color: AppColors.headLine3Color,
                    height: 10.h,
                    width: 10.w,
                  )),
              SizedBox(
                height: 20,
              ),
              DefaultTextForm(
                  textEditingController: TextEditingController(),
                  textInputType: TextInputType.visiblePassword,
                  validator: ((value) => 'unCorrect Phone Number'),
                  label: AppTexts.password,
                  isPassword: true,
                  iconData: Container(
                      height: 10.h,
                      width: 10.w,
                      child: Image.asset(AppImages.lockIcon))),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Spacer(),
               Text(AppTexts.forgetPassword)
                 ],
              ),
               SizedBox(
                height: 20,
              ),
              DefaultButton(AppTexts.signIn)
            ],
          ),
        ),
      ),
    );
  }
}

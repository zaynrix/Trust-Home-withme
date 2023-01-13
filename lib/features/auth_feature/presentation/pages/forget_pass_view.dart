import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/auth_feature/presentation/widgets/auth_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
    Padding(
      padding:  EdgeInsets.all(AppSizes.padding25.h.w),
      child: Form(
        key: formKey,
        child: Column(
children: [
  Text(AppTexts.dontWorry.tr,style: context.theme.textTheme.headline6,textAlign: TextAlign.center,),
SizedBox(
  height: AppSizes.height40.h,
),
  DefaultTextForm(
        textEditingController: TextEditingController(),
        textInputType: TextInputType.phone,
        validator: ((String? value) {
          if (value!.isEmpty) {
            return AppTexts.pleaseEnterPhone.tr;
          }
          if(value!.length<10||value!.length>10){
            return AppTexts.pleaseEnterPhone.tr;
          }
        }),
        label: AppTexts.phoneNumber.tr,
        hasPrefixIcon: true,
        iconData: Image.asset(
          AppImages.phoneIcon,
          color: AppColors.headLine3Color,
          height: 10.h,
          width: 10.w,
        )),
  SizedBox(
    height: AppSizes.height74.h,
  ),


  MaterialButton(
color: AppColors.primaryColor,
    child:Text(AppTexts.resetPass.tr,style: context.theme.textTheme.headline2,),
 onPressed: (){
    if(formKey.currentState!.validate()){
      Get.toNamed( AppRoutes.getCheckCodeRout());
    }
 },
  )
],
        ),
      ),
    )
    , AppTexts.resetPass.tr);
  }
}

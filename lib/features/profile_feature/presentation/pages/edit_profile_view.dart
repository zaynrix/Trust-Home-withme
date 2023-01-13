import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/profile_feature/presentation/controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_images/app_images.dart';
import '../../../../core/app_sizes/app_sizes.dart';
import '../../../../core/app_texts/app_texts.dart';

class EditProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.editProfile.tr),
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding20.w.h),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: ExactAssetImage(AppImages.userImage),
                        radius: AppSizes.radius40.r,
                      ),
                      SizedBox(
                        height: AppSizes.height10.h,
                      ),
                      Text(
                        AppTexts.userName.tr,
                        style: context.theme.textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSizes.height26.h,
                ),
                Text(
                  AppTexts.fullName.tr,
                  style: context.theme.textTheme.headline6,
                ),
                SizedBox(
                  height: AppSizes.height10.h,
                ),
                DefaultTextForm(
                    textEditingController: controller.nameController,
                    textInputType: TextInputType.text,
                    hintText: AppTexts.userName.tr,
                    isenable: true,
                    validator: (value)=>''), SizedBox(
                  height: AppSizes.height26.h,
                ),
                Text(
                  AppTexts.email.tr,
                  style: context.theme.textTheme.headline6,
                ),
                SizedBox(
                  height: AppSizes.height10.h,
                ),
                DefaultTextForm(
                    textEditingController: controller.emailController,
                    textInputType: TextInputType.text,
                    hintText:AppTexts.userEmail.tr,
                    isenable: true,
                    validator: (value)=>''), SizedBox(
                  height: AppSizes.height26.h,
                ),
                Text(
                  AppTexts.phoneNumber.tr,
                  style: context.theme.textTheme.headline6,
                ),
                SizedBox(
                  height: AppSizes.height10.h,
                ),
                DefaultTextForm(
                    textEditingController: controller.phoneController,
                    textInputType: TextInputType.text,
                    hintText:AppTexts.userPhoneNumber.tr,
                    isenable: true,
                    validator: (value)=>''), SizedBox(
                  height: AppSizes.height26.h,
                ),
                Text(
                  AppTexts.address.tr,
                  style: context.theme.textTheme.headline6,
                ),
                SizedBox(
                  height: AppSizes.height10.h,
                ),
                DefaultTextForm(
                    textEditingController: controller.nameController,
                    textInputType: TextInputType.text,
                    hintText:AppTexts.userAddress.tr,
                    isenable: true,hint: true,
                    validator: (value)=>''), SizedBox(
                  height: AppSizes.height26.h,
                ),

                SizedBox(
                  height: AppSizes.height10.h,
                ),
                MaterialButton(
                  onPressed: () {

                      Get.dialog(Center(
                        child: Container(
                          margin: EdgeInsets.all(AppSizes.padding20.h.w),
                          padding: EdgeInsets.all(AppSizes.padding20.h.w),
                          height: AppSizes.height478.h,
                          width: AppSizes.screenWidth - 20.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(AppSizes.radius12.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.readyImage,
                                height: AppSizes.height189,
                                width: AppSizes.height189,
                              ),
                              Text(
                                AppTexts.editProfileConfirm.tr,
                                style: context.theme.textTheme.headline1,
                              ),

                            ],
                          ),
                        ),
                      ));
                    },


                  color: AppColors.primaryColor,
                  child: Text(
                    AppTexts.editProfile.tr,
                    style: context.theme.textTheme.headline2,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

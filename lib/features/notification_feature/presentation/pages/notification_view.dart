import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/on_boarding_feature/widgets/on_boarding_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../core/widgets/app_widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.notifications.tr),
        backgroundColor: context.theme.scaffoldBackgroundColor,


      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(AppSizes.padding20.h.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.emptyCart),
                SizedBox(height: AppSizes.padding20.h,),

                Text(AppTexts.emptyNotification.tr,style: context.theme.textTheme.headline3,),
                SizedBox(height: AppSizes.padding20.h,),
                CustomBoardingBtn(
                  textStyle: context.theme.textTheme.headline2!,color: AppColors.primaryColor,
                  title:AppTexts.explore.tr,
                onPressed: (){
                  Get.toNamed(AppRoutes.getLayoutRout());
                },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

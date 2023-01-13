import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_network/cache_helper.dart';
import '../controller/onBoarding_controller.dart';
import '../widgets/on_boarding_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
     void submit() {
      SharedPrefs.saveData(key: 'onBoarding', value: true).then(((value) {
        if (value = true) {
          Get.offAndToNamed(AppRoutes.getSignInRout());

        }
      }));
    }

    return GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: ((onboardingcontroller) => Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.padding20.w.h),
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                       height:AppSizes.height478.h,
                        child: PageView.builder(
                          itemBuilder: (context, index) => Column(

                            children: [
                              Image.asset(
                                onboardingcontroller.onboardImages[index],
                                height: 335,
                                width: 335,
                              ),
                              Text(
                                onboardingcontroller.onboardTitles[index]
                                    .toUpperCase(),
                                style: context.theme.textTheme.headline1
                                    ?.copyWith(fontSize: 18.sp),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: AppSizes.padding20.h,
                              ),
                              Text(
                                onboardingcontroller.onboardDes[index],
                                style: context.theme.textTheme.headline3,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          onPageChanged: (index) =>
                              onboardingcontroller.onPageChanged(index),
                          controller: pageController,
                          itemCount: onboardingcontroller.onboardImages.length,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.height40.h,top: AppSizes.height10.h),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: onboardingcontroller.onboardImages.length,
                          effect:const  WormEffect(
                              activeDotColor: AppColors.primaryColor,
                              dotColor: AppColors.primaryIndicatorColor,
                              dotWidth: 46,
                              dotHeight: 3),
                        ),
                      ),

                      CustomBoardingBtn(
                        color: AppColors.primaryColor,
                        onPressed: () {
                          Get.offAndToNamed(AppRoutes.getLayoutRout());
                        },
                        title: AppTexts.explore.tr,
                        textStyle: context.theme.textTheme.headline2!,
                      ),
                      SizedBox(
                        height: AppSizes.padding20.h,
                      ),
                      CustomBoardingBtn(
                        color: AppColors.sigInUpBtnColor,
                        onPressed: () {
                          submit();
                          Get.toNamed(AppRoutes.getSignInRout());
                        },
                        title: AppTexts.signIn.tr,
                        textStyle: context.theme.textTheme.headline2!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),

                      // SizedBox(
                      //   height: AppSizes.padding20.h,
                      // ),
                    ],
                  ),
                ),
              ),
            )));
  }
}



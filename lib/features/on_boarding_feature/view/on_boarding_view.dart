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

import '../controller/onBoarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    /* void submit() {
      SharedPrefs.saveData(key: 'onBoarding', value: true).then(((value) {
        if (value = true) {
          Get.offAndToNamed(RoutesClass.getLoginRoute());

        }
      }));
    }*/

    return GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: ((onboardingcontroller) => Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.padding16.w.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .59,
                        child: PageView.builder(
                          itemBuilder: (context, index) => Column(
                            children: [
                              Image.asset(
                                onboardingcontroller.onboardImages[index],
                                height:
                                    MediaQuery.of(context).size.height * .35,
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
                        padding: EdgeInsets.only(bottom: AppSizes.height40.h),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: onboardingcontroller.onboardImages.length,
                          effect: const WormEffect(
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
                          Get.toNamed(AppRoutes.getSignINRout());
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

class CustomBoardingBtn extends StatelessWidget {
  const CustomBoardingBtn(
      {Key? key,
      required this.color,
      required this.onPressed,
      required this.title,
      required this.textStyle})
      : super(key: key);

  final Color color;
  final Function() onPressed;

  // final Widget? child;
  final String title;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}

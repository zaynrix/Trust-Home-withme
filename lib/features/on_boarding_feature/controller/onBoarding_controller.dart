import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_images/app_images.dart';
import '../../../core/app_texts/app_texts.dart';
import '../model/onBoarding_model.dart';


class OnBoardingController extends GetxController{
  var onboardController = PageController();
  bool isLast = false;
  int index=0;
  List<String> screens=[
    AppRoutes.getonhomeRout(),
    AppRoutes.getonsignINRout(),
    AppRoutes.getonsignUpRout(),
  ];
 /* List<OnboardingModel> board = [
    OnboardingModel(
        image:AppImages.onboardImage,
        title: AppTexts.onBoardingTitle.tr,
        description:AppTexts.onBoardingDescription.tr),
*//*    OnboardingModel(
        image: AppImages.onboard2,
        title: AppTexts.onBoardingTitle2.tr,
        description:AppTexts.description2.tr),
    OnboardingModel(
        image:
        AppImages.onboard3,
        title: AppTexts.onBoardingTitle3.tr,
        description: AppTexts.description3.tr),*//*
  ];
  void  onPageChanged(index) {
    if (index ==board.length - 1) {
      isLast = true;
      update(

      );
      print('last');
    } else {
      isLast = false;
      update(

      );
      print('not last');
    }
  }*/
}
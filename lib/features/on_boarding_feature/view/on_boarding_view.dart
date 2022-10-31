import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/on_boarding_feature/model/onBoarding_model.dart';
import 'package:final_project/features/on_boarding_feature/widgets/onBoarding_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/onBoarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

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
        builder: ((onboardingcontroller) =>
        Scaffold(

          body: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [

                  Container(

                    height: AppSizes.screenHeight.h,
                    width: double.infinity, child: Image.asset(AppImages.onboardImage, fit: BoxFit.cover,),
                  ),

                  Container(



                      width: double.infinity,











                      decoration: BoxDecoration(



                        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radius40),



                        ),



                        color: Colors.white,







                      ),



                      child: OnBoardingWidget(
                         OnboardingModel(
                            title: AppTexts.onBoardingTitle,
                           description: AppTexts.onBoardingDescription
                         ),
                          AppTexts.buttonTexts,
                          onboardingcontroller.screens
                      )



                  ),


                ],
              ),
            ],
          ),

        )
        ));
  }
}

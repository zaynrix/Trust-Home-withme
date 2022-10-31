import 'package:final_project/features/on_boarding_feature/model/onBoarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_sizes/app_sizes.dart';

class OnBoardingWidget extends StatelessWidget {
OnboardingModel onboardingModel;
List<String> buttonTitles;
List<String> page;
OnBoardingWidget(this.onboardingModel,this.buttonTitles,this.page);
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding:  EdgeInsets.symmetric(horizontal: AppSizes.padding25.w),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height:AppSizes.height57.h),
          Text(



           onboardingModel.title,



            style: context.theme.textTheme.headline1,



          ),
          SizedBox(height: AppSizes.height10.h,),
          Text(



        onboardingModel. description,



            style: context.theme.textTheme.headline3,



          ),
         SizedBox(height: AppSizes.height26.h,),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) =>           SizedBox(height: AppSizes.height26.h,),

            itemBuilder:(context, index) =>        Container(



              width: double.infinity,


              height: AppSizes.height57.h,




              child: MaterialButton(onPressed: (){
                Get.toNamed(page[index]);
              },



                shape: RoundedRectangleBorder(



                    borderRadius: BorderRadius.circular(AppSizes.radius12)



                ),



                color: AppColors.primaryColor,



                child: Text(



                 buttonTitles[index],



                  style: context.theme.textTheme.headline2,



                ),



              ),



            ), itemCount: buttonTitles.length,
          ),

          SizedBox(height: AppSizes.height40.h,),







        ],



      ),

    );
  }
}

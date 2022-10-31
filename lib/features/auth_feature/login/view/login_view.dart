import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/auth_feature/widgets/auth_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
  SafeArea(
        top: true,
        child: Padding(
          padding:  EdgeInsets.all(AppSizes.padding20.w.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    height: AppSizes.height189.h,
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
                    validator: ((value) => ''),
                    label: AppTexts.phoneNumber,
                    hasPrefixIcon: true,
                    iconData: Image.asset(
                      AppImages.phoneIcon,
                      color: AppColors.headLine3Color,
                      height: AppSizes.height10.h,
                      width: AppSizes.height10.w,
                    )),
                SizedBox(
                  height: AppSizes.height20.h,
                ),
                DefaultTextForm(
                    textEditingController: TextEditingController(),
                    textInputType: TextInputType.visiblePassword,
                    validator: ((value) => 'unCorrect Phone Number'),
                    label: AppTexts.password,
                    isPassword: true,
                    iconData: Container(
                        height: AppSizes.height10.h,
                        width: AppSizes.height10.w,
                        child: Image.asset(AppImages.lockIcon))),
                SizedBox(
                  height: AppSizes.height20.h,
                ),
                Row(
                  children: [
                    Spacer(),
                 InkWell(
                   onTap: ()=>Get.toNamed(AppRoutes.getonforgetPassRout()),
                   child: Text(AppTexts.forgetPassword+'؟',
                   style: context.theme.textTheme.headline4,
                   ),
                 )
                   ],
                ),
                 SizedBox(
                   height: AppSizes.height20.h,
                ),
                DefaultButton(AppTexts.signIn,

                AppRoutes.getonhomeRout()
                ),
                SizedBox(
                  height: AppSizes.height20.h,
                ),
               InkWell(
                 onTap: ()=>Get.toNamed(AppRoutes.getonsignUpRout()),
                 child: RichText(
                   text: TextSpan(
                     text: AppTexts.dontHaveAccount,
                     style: context.theme.textTheme.headline5?.copyWith(
                       color: AppColors.headLine4Color
                     ),
                     children: [
                       TextSpan(text: ' '),
                      TextSpan(
                        text: AppTexts.createAccount,
style: context.theme.textTheme.headline5?.copyWith(
  color: AppColors.primaryColor
)
                      )

                     ]
                   ),
                 ),
               )
              ],
            ),
          ),
        ),
      ),
      AppTexts.signIn
    );
  }
}

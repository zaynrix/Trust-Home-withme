import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/auth_feature/presentation/controller/auth_controller.dart';
import 'package:final_project/features/auth_feature/presentation/widgets/auth_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
var formKey=GlobalKey<FormState>();
AuthController controller=Get.find();

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
  SafeArea(
        top: true,
        child: Padding(
          padding:  EdgeInsets.all(AppSizes.padding20.w.h),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: AppSizes.height189.h,
                      child: Image.asset(
                        AppImages.signImage,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: AppSizes.height40,
                  ),

                  DefaultTextForm(
                      textEditingController: controller.phoneController,
                      textInputType: TextInputType.phone,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppTexts.pleaseEnterPhone.tr;
                        }
                        if(value!.length<10){
                          return AppTexts.pleaseEnterPhone.tr;
                        }
                        if(value!.length>10){
                          return AppTexts.pleaseEnterPhone.tr;
                        }
                      },
                      label: AppTexts.phoneNumber.tr,
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
                      textEditingController: controller.passwordController,
                      textInputType: TextInputType.visiblePassword,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return AppTexts.pleaseEnterPas.tr;
                        }

                      }),
                      label: AppTexts.password.tr,
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
                     onTap: ()=>Get.toNamed(AppRoutes.getForgetPassRout()),
                     child: Text(AppTexts.forgetPassword.tr,
                     style: context.theme.textTheme.headline4,
                     ),
                   )
                     ],
                  ),
                   SizedBox(
                     height: AppSizes.height20.h,
                  ),
                  MaterialButton(
                    color: AppColors.primaryColor,
                      child:  GetBuilder<AuthController>(
                          builder: (controller) {
                            switch(controller.isLoginLoading)
                            {
                              case true:
                                return const Center(child: CircularProgressIndicator());

                              default:
                                return  Text(AppTexts.signIn.tr,style: context.theme.textTheme.headline2,);

                            }

                          }
                      ),





             onPressed: () {
                        if(formKey.currentState!.validate()){

                          controller.logIn(mobile: controller.phoneController.text, password: controller.passwordController.text);
                        }
             },
                  ),
                  SizedBox(
                    height: AppSizes.height20.h,
                  ),
                 InkWell(
                   onTap: () {

                     Get.toNamed(AppRoutes.getSignUpRout());

                   },
                   child: RichText(
                     text: TextSpan(
                       text: AppTexts.dontHaveAccount.tr,
                       style: context.theme.textTheme.headline5?.copyWith(
                         color: AppColors.headLine4Color
                       ),
                       children: [
                         TextSpan(text: ' '),
                        TextSpan(
                          text: AppTexts.createAccount.tr,
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
      ),
      AppTexts.signIn,skip: true,
    );
  }
}

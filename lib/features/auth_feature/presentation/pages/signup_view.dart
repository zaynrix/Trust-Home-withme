import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/auth_feature/presentation/widgets/auth_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/app_images/app_images.dart';
import '../../../../core/app_sizes/app_sizes.dart';
import '../../../../core/app_texts/app_texts.dart';
import '../controller/auth_controller.dart';


class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

  bool value = false;
var formKey=GlobalKey<FormState>();
   AuthController controller=Get.find();

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
       SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding20.h.w),
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
                      textEditingController: controller.nameController,
                      textInputType: TextInputType.text,
                      validator: ((value) {
                        if (value!.isEmpty)
                          return AppTexts.pleaseEnterName.tr;
                      }),
                      label: AppTexts.fullName.tr,
                      hasPrefixIcon: true,
                      iconData: Icon(Icons.person_outline,
                      color: AppColors.headLine3Color,size: AppSizes.height26-2,
                      )),
                  SizedBox(
                    height: AppSizes.height20.h,
                  ),
                  DefaultTextForm(
                      textEditingController: controller.newUserPhoneController,
                      textInputType: TextInputType.phone,
                      validator: ((value) {
                        if (value!.isEmpty)
                          return AppTexts.pleaseEnterPhone.tr;
                      }),
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
                      textEditingController:controller.newUserPasswordController,
                      textInputType: TextInputType.visiblePassword,
                      validator: ((value) {
                        if (value!.isEmpty)
                          return AppTexts.pleaseEnterPas.tr;
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) setState) {
                        return Checkbox(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSizes.radius8.r),side: BorderSide(
                            color: AppColors.containerColor,
                          )
                          ),
                          side: BorderSide(
                              color: AppColors.borderColor
                          ),
                          activeColor: AppColors.primaryColor,
                          value: this.value,
                          onChanged: ( bool? value) {
                            setState(() {
                              this. value = value!;
                            });
                          },
                        );
                      },

                    ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                              text: AppTexts.bycreateAccount.tr,
                              style: context.theme.textTheme.headline5?.copyWith(
                                  color: AppColors.headLine4Color
                              ),
                              children: [
                                TextSpan(
                                    text: AppTexts.terms.tr,
                                    style: context.theme.textTheme.headline5?.copyWith(
                                        color: AppColors.primaryColor
                                    ),

                                ),
                                TextSpan(text: ' '),
                                TextSpan(
                                  text: AppTexts.ourOwn.tr,
                                  style: context.theme.textTheme.headline5?.copyWith(
                                      color: AppColors.headLine4Color
                                  ),

                                )

                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSizes.height20.h,
                  ),
                  MaterialButton(
                    color: AppColors.primaryColor,
                    child:  GetBuilder<AuthController>(
                        builder: (controller) {
                          switch(controller.isLoading)
                          {
                            case true:
                              return const Center(child: CircularProgressIndicator());

                            default:
                              return  Text(AppTexts.createNewAccount.tr,style: context.theme.textTheme.headline2,);

                          }

                        }
                    ),





                    onPressed: () {
                      if(formKey.currentState!.validate()){

                        controller.signUp(mobile: controller.phoneController.text, password: controller.passwordController.text, name: controller.nameController.text);
                      }
                    },
                  ),
                
                  SizedBox(
                    height: AppSizes.height20.h,
                  ),
                  InkWell(
                    onTap: ()=>Get.toNamed(AppRoutes.getSignInRout()),
                    child: RichText(
                      text: TextSpan(
                          text: AppTexts.alreadyHaveAccount.tr,
                          style: context.theme.textTheme.headline5?.copyWith(
                              color: AppColors.headLine4Color
                          ),
                          children: [
                            TextSpan(text: ' '),
                            TextSpan(
                              text: AppTexts.signIn.tr,
                              style: context.theme.textTheme.headline5?.copyWith(
                                  color: AppColors.primaryColor
                              ),

                            ),


                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      AppTexts.signUp
    );
  }
}

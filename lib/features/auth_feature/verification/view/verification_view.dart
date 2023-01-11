import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/auth_feature/widgets/auth_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/app_images/app_images.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        Padding(
          padding: EdgeInsets.all(AppSizes.padding25.h.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: AppSizes.height189.h,
                    child: Image.asset(
                      AppImages.singInImage,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: AppSizes.height26.h,
                ),
                SizedBox(
                  height: AppSizes.height20 * 6.h,
                  width: double.infinity,
                  child: OtpTextField(
                    borderRadius: BorderRadius.circular(12),
                    showCursor: true,
                    numberOfFields: 4,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 24),
                    textStyle: Theme.of(context).textTheme.headline1,
                    keyboardType: TextInputType.number,
                    fillColor: Colors.grey.shade100,
                    fieldWidth: 66.w,
                    filled: true,
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode) {
                      // c.codeController.text=verificationCode;
                    }, // end onSubmit
                  ),
                ),
                DefaultButton(
                    AppTexts.checkCode.tr, AppRoutes.getCreatePassRout()),
                const SizedBox(
                  height: AppSizes.height10,
                ),
                Text(
                  AppTexts.resend.tr,
                  style: context.theme.textTheme.headline5
                      ?.copyWith(fontSize: AppSizes.fontSize16),
                ),
              ],
            ),
          ),
        ),
        AppTexts.checkCode.tr);
  }
}

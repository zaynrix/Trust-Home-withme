import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/auth_feature/widgets/auth_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                Container(
                  height: AppSizes.height20*5.h,
                  child: GridView.count(
                    crossAxisSpacing: AppSizes.height20,
                    crossAxisCount: 4,
                    children: List.generate(
                        4,
                        (index) => DefaultTextForm(
                            textEditingController: TextEditingController(),
                            textInputType: TextInputType.number,
                            validator: (value)=>'',
filled: true,
                        ),
                    ),
                  ),
                ),
                DefaultButton(AppTexts.checkCode, AppRoutes.getoncreatePassRout()),
                SizedBox(
                  height: AppSizes.height10,
                ),
                Text(
                  AppTexts.resend,
                  style: context.theme.textTheme.headline5
                      ?.copyWith(fontSize: AppSizes.fontSize16),
                ),

              ],
            ),
          ),
        ),
        AppTexts.checkCode);
  }


}

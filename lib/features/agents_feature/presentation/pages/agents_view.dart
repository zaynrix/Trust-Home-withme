import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/agents_feature/presentation/controllers/agents_controller.dart';
import 'package:final_project/features/home_feature/presentation/widgets/home_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AgentsScreen extends GetView<AgentsController> {
  // AgentsController controller=Get.find<AgentsController>();
  @override
  Widget build(BuildContext context) {
    controller.getAgents();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.realEstateAgents.tr),
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.height10.w.h),
          child: Column(
            children: [
              Text(
                AppTexts.findWithAgents.tr,
                style: context.theme.textTheme.headline4
                    ?.copyWith(fontSize: 18.sp),
              ),
              GetBuilder<AgentsController>(
                builder:(controller) {
    switch(controller.isLoading)
    {
    case true:
    return const Center(child: CircularProgressIndicator());

    default:
                  return Expanded(
                    child: GridView.builder(
                  itemCount: controller.agentsEntity.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Get.toNamed(AppRoutes.getagentDetailsRout()),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(AppSizes.height10.w.h),
                        child: Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Card(
                                elevation: 0,
                                color: AppColors.primaryColor,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppSizes.height10.w,
                                      vertical: AppSizes.height10 / 2.h),
                                  child: Text(
                                    AppTexts.percent.tr + " " + '2%',
                                    style: context.theme.textTheme.headline2
                                        ?.copyWith(fontSize: 12),
                                  ),
                                ),
                              ),
                              const CircleAvatar(
                                backgroundImage: ExactAssetImage(
                                  AppImages.agentImage,
                                ),
                                radius: AppSizes.radius40 * 2,
                              ),
                              Center(
                                child: Text(
                                  controller.agentsEntity[index].name.tr,
                                  style: context.theme.textTheme.headline1
                                      ?.copyWith(fontSize: 14.sp),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${AppTexts.sell.tr} 15",
                                      style: context.theme.textTheme.headline1
                                          ?.copyWith(fontSize: 8.sp),
                                    ),
                                     Icon(
                                      Icons.home_filled,
                                      size: 16,
                                      color: AppColors.iconsColor,
                                    ),
                                    Text(
                                      '5',
                                      style: context.theme.textTheme.headline1
                                          ?.copyWith(fontSize: 8.sp),
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.59.w.h,
                  ),
                ));
                }}
              )
            ],
          ),
        ),
      ),
    );
  }
}

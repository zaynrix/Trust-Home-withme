import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/home_feature/domain/entities/home_item_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResultCard extends StatelessWidget {
  final HomeEntity homeEntity;

  const ResultCard({super.key, required this.homeEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.getdetailsRout());
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(15.h.w),
          child: Row(
            children: [
              Container(
                width: 95,
                height: 90.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    image: DecorationImage(
                      image: ExactAssetImage(
                        homeEntity.image,
                      ),
                      fit: BoxFit.cover,
                    )),
                // child: Image.asset(
                //   homeEntity.image,
                //   fit: BoxFit.cover,
                // ),
              ),
              SizedBox(
                width: AppSizes.height10.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${homeEntity.location} ,${homeEntity.subLocation1}, ${homeEntity.subLocation2}",
                        style: context.theme.textTheme.headline3?.copyWith(
                            color: AppColors.headLine3Color, fontSize: 12),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.getdetailsRout());
                          },
                          child: Text(
                            AppTexts.detailes.tr,
                            style: context.theme.textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            homeEntity.bathrooms,
                            style: context.theme.textTheme.headline3
                                ?.copyWith(color: AppColors.headLine3Color,fontSize: 10),
                          ),
                          Image.asset(
                            AppImages.bathIcon,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            homeEntity.bedrooms,
                            style: context.theme.textTheme.headline3
                                ?.copyWith(color: AppColors.headLine3Color),
                          ),
                          Image.asset(
                            AppImages.bedIcon,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            homeEntity.area,
                            style: context.theme.textTheme.headline3
                                ?.copyWith(color: AppColors.headLine3Color),
                          ),
                          Image.asset(
                            AppImages.areaIcon,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

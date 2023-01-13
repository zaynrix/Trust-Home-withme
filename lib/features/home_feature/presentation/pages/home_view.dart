import 'dart:async';
import 'dart:math';

import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/filter_feature/presentation/widgets/results_widgets.dart';
import 'package:final_project/features/home_feature/domain/entities/home_item_entity.dart';
import 'package:final_project/features/home_feature/presentation/controllers/home_controller.dart';
import 'package:final_project/features/notification_feature/presentation/controllers/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widgets/estate_card_widget.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen>  {
HomeController controller=Get.put(HomeController());


@override
void initState() {
  super.initState();
}
@override
  Widget build(BuildContext context) {

    return  SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding20.h.w),
          child: GetBuilder<HomeController>(
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(AppRoutes.getprofileRout()),
                      child: const CircleAvatar(
                        backgroundImage: ExactAssetImage(AppImages.userImage),
                        radius: 25,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.getnotificationRout());
                        },
                        icon: Icon(
                          Icons.notifications_none,
                          size: AppSizes.height20 + 10,
                          color: AppColors.iconsColor,
                        ))
                  ],
                ),
                SizedBox(
                  height: AppSizes.height26.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTexts.searchSentance.tr,
                          style: context.theme.textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: AppSizes.height10.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 120,
                                height: 50,

                                  child: GetBuilder<HomeController>(
                                      builder: (controller) {
                                    return InkWell(
                                        onTap: () {
                                     setState(() {
                                       controller.
                                       isSelected=true;
                                     });
                                    },child:Card(
                                      color: controller.isSelected
                                          ? AppColors.primaryColor
                                          : null,
                                      child: Center(
                                        child: Text(
                                          AppTexts.buy.tr,
                                          style: context
                                              .theme.textTheme.headline3
                                              ?.copyWith(
                                                  color: controller.isSelected
                                                      ? controller
                                                          .cardTextSelectedColor
                                                      : controller
                                                          .cardTextUnSelectedColor),
                                        ),

                                    ),
                                    ),
                                    );
                                  }
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                height: 50,
                                child: InkWell(
                              onTap: () {
                                setState(() {
                                  controller.
                                  isSelected=false;
                                });
                              },
                                  child: Card(
                                    color: !controller.isSelected
                                        ? AppColors.primaryColor
                                        : null,
                                    child: Center(
                                      child: Text(
                                        AppTexts.rent.tr,
                                        style: context
                                            .theme.textTheme.headline3
                                            ?.copyWith(
                                            color: !controller.isSelected
                                                ? controller
                                                .cardTextSelectedColor
                                                : controller
                                                .cardTextUnSelectedColor),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.padding20.h,
                        ),
                        SizedBox(
                          height: AppSizes.height57,
                          child: DefaultTextForm(
                            textEditingController: controller.searchController,
                            textInputType: TextInputType.text,
                            validator: (value) => '',
                            label: AppTexts.searchLabel.tr,
                            iconDataSuffixx: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.height10.w),
                              child: InkWell(
                                  onTap: () =>
                                      Get.toNamed(AppRoutes.getfilterRout()),
                                  child: SvgPicture.asset(
                                    AppImages.filterIcon,
                                    height: 20,
                                    width: 20,
                                    color: AppColors.iconsColor,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.height26.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppTexts.exploreSentance.tr,
                              style:
                                  context.theme.textTheme.bodyText1?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Card(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        controller.changeView1Bool=!controller.changeView1Bool;
                                      });
                                    },
                                    icon: Icon(
                                      size: 16,
                                      Icons.grid_view,color:!controller.changeView1Bool
                                        ? AppColors.headLine3Color
                                        : AppColors.primaryColor,),),
                                  IconButton(
                                      onPressed: () {
                                       setState(() {
                                         controller.changeView1Bool=!controller.changeView1Bool;
                                       });
                                      },
                                      icon: SvgPicture.asset(
                                        AppImages.verticalMenu,
                                        color: controller.changeView1Bool
                                            ? AppColors.headLine3Color
                                            : AppColors.primaryColor,
                                      )),

                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSizes.height10.h,
                        ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return  controller.changeView1Bool? EstateCard(
                            homeEntity: HomeEntity(
                              image: AppImages.houses[index],
                              area: '200 م2'.tr,
                              bathrooms: AppTexts.bath.tr + "" + "2",
                              bedrooms: AppTexts.bedroom.tr + "" + "2",
                              location: AppTexts.palestine.tr,
                              subLocation1: AppTexts.gaza.tr,
                              subLocation2: AppTexts.region.tr,
                            ),
                          ):ResultCard(homeEntity: HomeEntity(
                              image: AppImages.houses[index],
                              area: '200 م2'.tr,
                              bathrooms: AppTexts.bath.tr + "" + "2",
                              bedrooms: AppTexts.bedroom.tr + "" + "2",
                              location: AppTexts.palestine.tr,
                              subLocation1: AppTexts.gaza.tr,
                              subLocation2: AppTexts.region.tr,
                            ),);
                          },
                          shrinkWrap: true,
                          itemCount: AppImages.houses.length,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

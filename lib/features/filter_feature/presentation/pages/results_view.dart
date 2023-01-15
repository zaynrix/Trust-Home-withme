import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/filter_feature/presentation/controllers/filter_controller.dart';
import 'package:final_project/features/home_feature/domain/entities/home_item_entity.dart';
import 'package:final_project/features/filter_feature/presentation/widgets/results_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultsScreen extends GetView<FilterController> {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.availableResults.tr),
          backgroundColor: context.theme.scaffoldBackgroundColor,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child:   GetBuilder<FilterController>(
            builder: (controller) =>
             ListView.builder(
                itemCount: controller.resultsData!.resultsData.length,
                itemBuilder: (context, index) => ResultCard(
                        homeEntity: HomeEntity(
                      image:  AppImages.houses[index],
                      area: '${ controller.resultsData!.resultsData[index].area}',
                      bathrooms: "${ controller.resultsData!.resultsData[index].bathroom}2",
                      bedrooms: "${ controller.resultsData!.resultsData[index].bedroom}2",
                      location: AppTexts.palestine.tr,
                      subLocation1: AppTexts.gaza.tr,
                      subLocation2: AppTexts.region.tr,
                    ))),
          ),
        ));
  }
}

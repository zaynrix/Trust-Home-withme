import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_themes/app_themes.dart';
import 'package:final_project/features/on_boarding_feature/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/app_sizes/app_sizes.dart';


void main() => runApp(const MainApp());
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(AppSizes.screenWidth, AppSizes.screenHeight),
    minTextAdapt: true,
    splitScreenMode: true,
    builder:
    (context , child)=> GetMaterialApp(
debugShowCheckedModeBanner: false,
theme: AppThemes.lightTheme,
      textDirection: TextDirection.rtl,
      getPages: AppRoutes().routes,
      initialRoute: AppRoutes.getonBoardingRout(),
    ));
  }
}





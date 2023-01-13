import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLayout extends StatelessWidget {
Widget pageContent;
String pagetitle;
bool? skip=false;
AuthLayout(this.pageContent,this.pagetitle, {this.skip});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
  title: Text(pagetitle.tr),
 actions: [
   skip==true?
   TextButton(onPressed: ()=>Get.offAllNamed(AppRoutes.getLayoutRout()), child: Text(AppTexts.skip.tr,
  style: context.theme.textTheme.headline5,
  ),):SizedBox()
],
        ),
        body: pageContent,

    );
  }
}

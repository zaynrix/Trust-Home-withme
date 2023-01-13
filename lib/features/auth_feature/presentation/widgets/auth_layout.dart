import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLayout extends StatelessWidget {
Widget pageContent;
String pagetitle;
AuthLayout(this.pageContent,this.pagetitle);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
  title: Text(pagetitle.tr),
actions: [
  TextButton(onPressed: ()=>Get.offAllNamed(AppRoutes.getLayoutRout()), child: Text(pagetitle.tr),)
],
        ),
        body: pageContent,

    );
  }
}

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
  title: Text(pagetitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Get.back();
            },
          ),
        ),
        body: pageContent,

    );
  }
}

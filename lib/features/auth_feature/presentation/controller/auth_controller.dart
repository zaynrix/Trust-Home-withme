import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/app_themes/app_themes.dart';
import 'package:final_project/core/errors/fauilers.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/auth_feature/domain/entities/login_entity.dart';
import 'package:final_project/features/auth_feature/domain/entities/signup_entity.dart';
import 'package:final_project/features/auth_feature/domain/usecases/login_usecase.dart';
import 'package:final_project/features/auth_feature/domain/usecases/signup_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../../../core/app_sizes/app_sizes.dart';

class AuthController extends GetxController {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var newUserPhoneController = TextEditingController();
  var newUserPasswordController = TextEditingController();
  var nameController = TextEditingController();
  bool isLoading = false;
  bool isLoginLoading = false;

  LoginUseCase loginUseCase;
  SignUpCase signUpCase;

  AuthController({required this.loginUseCase, required this.signUpCase});

  LogInEntity logInEntity =
      LogInEntity(user: User(name: '', id: 0, mobile: '', token: ''));
  SignUpEntity signUpEntity =
      SignUpEntity(signupUser: SignupUser(name: '', mobile: '', id: 0));

  startLoading() {
    isLoading = true;
    update();
  }

  endLoading() {
    isLoading = false;
    update();
  }

  void signUp({
    required String mobile,
    required String name,
    required String password,
  }) async {
    startLoading();
    final response = await signUpCase.call(mobile, name, password);
    endLoading();
    print(response);
    response.fold((l) {
      if(l==ServerFailure()){
        Get.snackbar('', 'يرجى المحاولة لاحقا',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: null,
            margin: EdgeInsets.all(AppSizes.height10.h.w));}
      if(l==ConnectionFailure()){
        Get.snackbar('', 'لا يوجد اتصال بالانترنت, يرجى المحاولة لاحقا',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: null,
            margin: EdgeInsets.all(AppSizes.height10.h.w));
      }
      endLoading();
      // change(requestCodeModel,status: RxStatus.loading());
    }, (r) {
      print(response);
      // logInEntity=r;
      signUpEntity.signupUser = r.signupUser;

      Get.offAllNamed(AppRoutes.getLayoutRout());
    });
  }

  void logIn({
    required String mobile,
    required String password,
  }) async {
    startLoading();
    final response = await loginUseCase.call(mobile, password);
    endLoading();
    print(response);
    response.fold((l) {
     // ConnectionFailure();
      if(l==ServerFailure()){
      Get.snackbar('', 'المستخدم غير موجود',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: null,
          margin: EdgeInsets.all(AppSizes.height10.h.w));}
      if(l==ConnectionFailure()){
        Get.snackbar('', 'لا يوجد اتصال بالانترنت, يرجى المحاولة لاحقا',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: null,
            margin: EdgeInsets.all(AppSizes.height10.h.w));
      }
      // change(requestCodeModel,status: RxStatus.loading());
    }, (r) {
      print(response);
      // logInEntity=r;
      logInEntity.user = r.user;

      logInEntity.user != null
          ? Get.offAllNamed(AppRoutes.getHomeRout())
          : Get.toNamed(AppRoutes.getSignUpRout());
    });
  }
}

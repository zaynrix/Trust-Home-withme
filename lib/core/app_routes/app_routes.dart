import 'package:final_project/features/auth_feature/create_new_pass/view/create_new_pass_view.dart';
import 'package:final_project/features/auth_feature/login/view/login_view.dart';
import 'package:final_project/features/auth_feature/signup/view/signup_view.dart';
import 'package:final_project/features/auth_feature/verification/view/verification_view.dart';
import 'package:final_project/features/auth_feature/forget_password/view/forget_pass_view.dart';
import 'package:final_project/features/home_feature/view/home_view.dart';
import 'package:get/get.dart';
import '../../features/on_boarding_feature/view/on_boarding_view.dart';
class AppRoutes{
  static String onBoarding='/onBoarding';
  static String signIN='/signIN';
  static String signUp='/signUp';
  static String home='/';
  static String resetPass='/resetPass';
  static String checkCode='/checkCode';
  static String createPass='/createPass';

  static String getonBoardingRout() => onBoarding;
  static String getonsignINRout() => signIN;
  static String getonsignUpRout() => signUp;
  static String getonhomeRout() => home;
  static String getonforgetPassRout() => resetPass;
  static String getoncheckCodeRout() => checkCode;
  static String getoncreatePassRout() => createPass;
  List<GetPage> routes = [
    GetPage(name: onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: signIN, page: () => SignInScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: home, page: () => HomeView()),
    GetPage(name: resetPass, page: () => ResetPasswordScreen()),
    GetPage(name: checkCode, page: () => VerificationScreen()),
    GetPage(name: createPass, page: () => CreateNewPassScreen()),

  ];

}
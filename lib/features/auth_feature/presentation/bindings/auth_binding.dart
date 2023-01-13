import 'package:dio/dio.dart';
import 'package:final_project/features/auth_feature/domain/usecases/signup_usecase.dart';
import 'package:final_project/features/auth_feature/presentation/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/app_network/network_info.dart';
import '../../data/datasources/remote_data_sources.dart';
import '../../data/repositories/auth_repositoryImp.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';

class AuthBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRemoteImp(dio: Get.find()));
    Get.lazyPut<AuthRemoteDataSource>(()=>AuthRemoteImp(dio: Get.find()));
    Get.lazyPut<AuthRepository>(()=>AuthRepositoryImp(
        authRemoteDataSource: Get.find(),
        networkInfo: Get.find()
    ));
    Get.lazyPut(() => LoginUseCase(authRepository: Get.find()));
    Get.lazyPut(() => SignUpCase(authRepository: Get.find()));
    Get.put(
      AuthController(
          loginUseCase: Get.find(),
        signUpCase: Get.find()
      ),
    );

  }


}
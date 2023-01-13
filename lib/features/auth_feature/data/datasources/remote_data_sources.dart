import 'package:dio/dio.dart';
import 'package:final_project/features/auth_feature/data/models/signup_model.dart';

import '../../../../core/app_network/cache_helper.dart';
import '../../../../core/app_network/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/login_model.dart';
abstract class AuthRemoteDataSource {
 // Future<RequestCodeModel> requestCode({required String phone_number});

  Future<LogInModel> logIn({
    required String mobile,
    required String password,
  });

  Future<SignupModel> signup({
    required String mobile,
    required String name,
    required String password,

  //  required String image,
  });
}

class AuthRemoteImp implements AuthRemoteDataSource {
  Dio dio;

  AuthRemoteImp({required this.dio});



  @override
  Future<LogInModel> logIn(
      {required String mobile, required String password}) async {
    var response =
        await dio.post(EndPoints.LOGIN, data: {'mobile': mobile,'password':password});
    if (response.statusCode == 200) {
      print(response.toString());
      LogInModel loginModel = LogInModel.fromJson(response.data);

      print(loginModel);
      return loginModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SignupModel> signup(
      {
    required String mobile,
    required String name,
    required String password,
      }) async {
   var response = await dio.post(EndPoints.SIGNUP, data: {
      'mobile': mobile,
      'name': name,
      'password': password,

    },
   /*     options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs().token}'
            }
        )*/
    );
    if (response.statusCode == 200) {
      SignupModel signupModel = SignupModel.fromJson(response.data['user']);

      print(signupModel);
      return signupModel;
    } else {
      throw ServerException();
    }
  }
}

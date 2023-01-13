import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/features/auth_feature/domain/entities/signup_entity.dart';
import '../../../../core/app_network/cache_helper.dart';
import '../../../../core/app_network/network_info.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/fauilers.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/request_code_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote_data_sources.dart';

class AuthRepositoryImp implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  NetworkInfo networkInfo;

  AuthRepositoryImp(
      {required this.authRemoteDataSource,
      required this.networkInfo});

  /*@override
  Future<Either<Failure, RequestCodeEntity>> requestCode(
      String phone_number) async {
    if (await networkInfo.isConnected) {
      try {

        final response =
            await authRemoteDataSource.requestCode(phone_number: phone_number);

        return Right(response);
      } on DioError {
        return Left(ServerFailure());
      }
    }

    return Left(ConnectionFailure());
  }*/

  @override
  Future<Either<Failure, LogInEntity>> login(
      String mobile, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.logIn(
            mobile: mobile, password: password);
        SharedPrefs().cacheLogin(response.user?.token??'');

        // authLocalDataSource.cacheLogin(response.token??'');


        return Right(response);
      } on DioError {
        return Left(ServerFailure());
      }
    }
    // else{
    //   try {
    //     final localLogin = await authLocalDataSource.getCachedLogin();
    //     return Right(localLogin);
    //   } on EmptyCacheException {
    //     return Left(EmptyCacheFailure());
    //   }
    //}

    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, SignUpEntity>> signup(String mobile, String name, String password) async{
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.signup(mobile: mobile, name: name, password: password);
print(response);
        return Right(response);
      } on DioError {
        return Left(ServerFailure());
      }
    }
    return Left(ConnectionFailure());
  }


/*
  @override
  Future<Either<Failure, SignUpEntity>> signup(String mobile, String name, String password)async {
    if (await networkInfo.isConnected) {
      // try {

      final response = await authRemoteDataSource.signup(
        mobile: mobile,
        name: name,
        password: password
        //image: image
      );
      print(response);

      return Right(response);
      // } on DioError {
      //   return Left(ServerFailure());
      // }
    }

    return Left(ConnectionFailure());
  }
*/


}

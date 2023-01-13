// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:loan_app/core/usecases/usecases.dart';
//
// import '../../../../core/errors/fauilers.dart';
// import '../entities/request_code_entity.dart';
// import '../repositories/auth_repository.dart';
//
// class RequestCodeUseCase extends MainUseCase<RequestCodeEntity,String>{
//   AuthRepository authRepository;
//   RequestCodeUseCase({required this.authRepository});
//
//   Future<Either<Failure,RequestCodeEntity>> call(String phone_number){
//     return authRepository.requestCode(phone_number);
//
//   }
//
//
// }
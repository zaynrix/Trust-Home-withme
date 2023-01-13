import 'package:dartz/dartz.dart';

import '../../../../core/errors/fauilers.dart';
import '../entities/login_entity.dart';
import '../entities/request_code_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failure,LogInEntity>> call(String mobile,String password){
    return authRepository.login(mobile,password);

  }
}
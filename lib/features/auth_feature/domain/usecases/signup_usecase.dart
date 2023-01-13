import 'package:dartz/dartz.dart';
import 'package:final_project/features/auth_feature/domain/entities/signup_entity.dart';

import '../../../../core/errors/fauilers.dart';
import '../repositories/auth_repository.dart';

class SignUpCase {
  AuthRepository authRepository;

  SignUpCase({required this.authRepository});

  Future<Either<Failure, SignUpEntity>> call(
  String mobile,
  String name,
  String password,

      //String image
      ) {
    return authRepository.signup(mobile, name, password,);
  }
}

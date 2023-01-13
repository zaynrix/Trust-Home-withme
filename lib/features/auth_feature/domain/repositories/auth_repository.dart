import 'package:dartz/dartz.dart';
import '../../../../core/errors/fauilers.dart';
import '../entities/login_entity.dart';
import '../entities/signup_entity.dart';

abstract class AuthRepository {

  Future<Either<Failure, LogInEntity>> login(String phone_number, String code);

  Future<Either<Failure, SignUpEntity>> signup(
      String mobile,
      String name,
      String password,

      );
}

import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  SignupUser? signupUser;

  SignUpEntity({this.signupUser});

  @override
  List<Object?> get props => [signupUser];
}

class SignupUser extends Equatable {
  String? mobile;
  String name;
  int id;

  SignupUser({
    required this.mobile,
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [mobile, name, id];
}



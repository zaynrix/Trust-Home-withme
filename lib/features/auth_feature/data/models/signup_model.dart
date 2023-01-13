import '../../domain/entities/signup_entity.dart';

class SignupModel extends SignUpEntity {
  SignupModel({required super.signupUser});
  factory SignupModel.fromJson(Map<String,dynamic>json){
    return SignupModel(signupUser:SignupUserModel.fromJson(json['user']));
}
}

class SignupUserModel extends SignupUser {
  SignupUserModel(
      { required super.name,required super.mobile,required super.id});
  factory SignupUserModel.fromJson(Map<String, dynamic> json) {
    return SignupUserModel(
        mobile: json['mobile'],
        name: json['name'],
        id: json['id'],
        );
  }
Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['mobile'] = this.mobile;
  data['name'] = this.name;
  data['id'] = this.id;

  return data;
}
}

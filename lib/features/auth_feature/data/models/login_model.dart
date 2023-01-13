import '../../domain/entities/login_entity.dart';

class LogInModel extends LogInEntity{
  LogInModel({super.user,});

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(user : json['user'] != null ? UserModel.fromJson(json['user']) : null

    );

  }

}




class UserModel extends User{
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    token = json['token'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['token'] = this.token;
    data['mobile'] = this.mobile;
    return data;
  }


}
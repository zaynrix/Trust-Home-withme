import 'package:equatable/equatable.dart';

class LogInEntity extends Equatable{

  User? user;
  LogInEntity({ this.user});



  @override
  String toString() {
    return 'Data{user: $user}';
  }
  @override

  List<Object?> get props => [user,];


}
class User extends Equatable{
  int? id;
  String? name;
  String? token;
  String? mobile;


  User(
      {this.token,this.name,this.id,this.mobile});



  @override
  List<Object?> get props => [id,name,token,mobile];


}
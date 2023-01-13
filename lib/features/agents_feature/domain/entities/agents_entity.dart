import 'package:equatable/equatable.dart';

class AgentsEntity extends Equatable{
  int id;
  String name;
  String image;

  AgentsEntity({required this.id, required this.name, required this.image});
  @override
  // TODO: implement props
  List<Object?> get props => [id,name,image];


}
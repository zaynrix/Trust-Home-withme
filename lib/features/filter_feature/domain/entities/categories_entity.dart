import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable{
 List<Data> categoriesData;
 CategoriesEntity({required this.categoriesData});


  @override

  List<Object?> get props => [categoriesData];



}


class Data extends Equatable{
  int id;
  String name;
  String icon;

  Data({required this.id,required this.name,required this.icon});

  @override
  List<Object?> get props => [id,name,icon];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}
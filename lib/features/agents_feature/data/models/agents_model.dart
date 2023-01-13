import 'package:final_project/features/agents_feature/domain/entities/agents_entity.dart';

class AgentsModel extends AgentsEntity {
  AgentsModel({required super.image, required super.name, required super.id});
  factory AgentsModel.fromJson(Map<String, dynamic> json) {
    return AgentsModel(
      image: json['image'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

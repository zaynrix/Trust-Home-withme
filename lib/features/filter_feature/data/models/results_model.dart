import 'package:final_project/features/filter_feature/domain/entities/categories_entity.dart';

import '../../domain/entities/results_entity.dart';

class ResultsModel extends ResultsEntity {
  ResultsModel({required super.resultsData});
  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(
      resultsData: json['data']
          .map<ResultsDataModel>(
              (dataJson) => ResultsDataModel.fromJson((dataJson)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': resultsData.map<Map>((data) => data.toJson()).toList(),
    };
  }
}

class ResultsDataModel extends ResultsData {
  ResultsDataModel(
      {required super.livingRoom,
       super.agent,
      required super.area,

      required super.image,
      required super.bedroom,
      required super.bathroom,
      required super.id});
  factory ResultsDataModel.fromJson(Map<String, dynamic> json) {
    return ResultsDataModel(
        livingRoom: json['livingRoom'],
        area: json['area'],
  image: json['image'],
  bedroom: json['bedroom'],
        id: json['id'],
  bathroom: json['bathroom'],
      agent : json['agent'] != null ? AgentsModel.fromJson(json['agent']) : null


    );
  }

  Map<String, dynamic> toJson() {
    return {

    };
  }
}
class AgentsModel extends Agent {
  AgentsModel(
  {
    required super.image,required super.id,required super.name
}
   );
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

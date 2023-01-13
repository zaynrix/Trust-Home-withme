import 'package:final_project/features/filter_feature/domain/entities/categories_entity.dart';

class CategoriesModel extends CategoriesEntity{
CategoriesModel({required super.categoriesData});
  factory CategoriesModel.fromJson(Map<String, dynamic> json){
    return CategoriesModel(
        categoriesData:  json['data'].map<CategoriesDataModel>((dataJson)=>CategoriesDataModel.fromJson((dataJson))).toList(),
    );

  }

  Map<String, dynamic> toJson() {
    return {

      'data':categoriesData.map<Map>((data) => data.toJson()).toList(),

    };
  }

}

class CategoriesDataModel extends Data{
  CategoriesDataModel({required super.name,required super.icon,required super.id});
factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
return CategoriesDataModel(name: json['name'], icon: json['icon'], id: json['id']);
}

Map<String, dynamic> toJson() {
  return {'name':name,
    'icon':icon,
    'id':id,

  };
}
}
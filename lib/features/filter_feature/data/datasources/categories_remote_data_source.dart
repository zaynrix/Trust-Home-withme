import 'package:dio/dio.dart';
import 'package:final_project/core/app_network/end_points.dart';
import 'package:final_project/features/filter_feature/data/models/categories_model.dart';
import 'package:final_project/features/filter_feature/data/models/results_model.dart';

import '../../../../core/app_network/cache_helper.dart';
import '../../../../core/errors/exceptions.dart';

abstract class CategoriesRemoteDataSource {
  Future<CategoriesModel> getCategories();

  Future<ResultsDataModel> getResults({
    required String category_id,
    required String price,
    required String area,
    required String bathroom,
    required String bedroom,
    required String agent_id,
  });
}

class CategoriesRemotImp implements CategoriesRemoteDataSource {
  final Dio dio;

  CategoriesRemotImp({required this.dio});

  @override
  Future<CategoriesModel> getCategories() async {
    Response response = await dio.get(
      EndPoints.categories,
      /*  options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs().token}'
            }
        )*/
    );
    if (response.statusCode == 200) {
      CategoriesModel categoriesModel =
          CategoriesModel.fromJson((response.data));
      print(categoriesModel.categoriesData.length);
      print(categoriesModel);
      return categoriesModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResultsDataModel> getResults(
      {required String category_id,
      required String price,
      required String area,
      required String bathroom,
      required String bedroom,
      required String agent_id}
      ) async {
    var response = await dio.post(EndPoints.filter, data: {
      'category_id': category_id,
      'price': price,
      'area': area,
      'bathroom': bathroom,
      'bedroom': bedroom,
      'agent_id': agent_id,
    });
    if (response.statusCode == 200) {
      print(response.toString());
      ResultsDataModel resultsModel = ResultsDataModel.fromJson(response.data);

      print(resultsModel);
      return resultsModel;
    } else {
      throw ServerException();
    }
  }
}

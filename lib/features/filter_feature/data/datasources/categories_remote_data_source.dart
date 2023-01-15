import 'package:dio/dio.dart';
import 'package:final_project/core/app_network/end_points.dart';
import 'package:final_project/features/filter_feature/data/models/categories_model.dart';
import 'package:final_project/features/filter_feature/data/models/results_model.dart';

import '../../../../core/app_network/cache_helper.dart';
import '../../../../core/errors/exceptions.dart';

abstract class CategoriesRemoteDataSource {
  Future<CategoriesModel> getCategories();

  Future<ResultsModel> getResults({
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
  Future<ResultsModel> getResults(
      {required String category_id,
      required String price,
      required String area,
      required String bathroom,
      required String bedroom,
      required String agent_id}
      ) async {
    var response = await dio.post(EndPoints.filter, data: {
      'category_id': "1",
      'price': "100 ; 2000000",
      'area': "0; 1000",
      'bathroom': "3",
      'bedroom': "3",
      'agent_id': "3",
    });
    if (response.statusCode == 200) {
      print("This is data ${response.data}");
      ResultsModel resultsModel = ResultsModel.fromJson(response.data);

      print("This is in ${resultsModel.resultsData}");
      return resultsModel;
    } else {
      throw ServerException();
    }
  }
}

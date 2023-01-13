import 'package:final_project/features/filter_feature/data/datasources/categories_remote_data_source.dart';
import 'package:final_project/features/filter_feature/data/repositoriesImp/categories_repositoryImp.dart';
import 'package:final_project/features/filter_feature/domain/repositories/categories_repository.dart';
import 'package:final_project/features/filter_feature/domain/use_cases/get_categories_usecase.dart';
import 'package:final_project/features/filter_feature/domain/use_cases/results_usecase.dart';
import 'package:final_project/features/filter_feature/presentation/controllers/filter_controller.dart';
import 'package:final_project/features/home_feature/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class FilterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CategoriesRemoteDataSource>(()=>CategoriesRemotImp(dio: Get.find()));
    Get.lazyPut<GetCategoriesUseCase>(()=>GetCategoriesUseCase(repository: Get.find()));
    Get.lazyPut<ResultsUseCase>(()=>ResultsUseCase(resultsRepository: Get.find()));
    Get.lazyPut<CategoriesRepository>(()=>CategoriesRepositoryImp(categoriesRemoteDataSource: Get.find(), networkInfo: Get.find()));

    Get.put<FilterController>(FilterController(categoriesUseCase: Get.find(), resultsUseCase: Get.find()));
  }


}
import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/filter_feature/domain/entities/categories_entity.dart';
import 'package:final_project/features/filter_feature/domain/entities/results_entity.dart';
import 'package:final_project/features/filter_feature/domain/use_cases/get_categories_usecase.dart';
import 'package:final_project/features/filter_feature/domain/use_cases/results_usecase.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../core/errors/fauilers.dart';

class FilterController extends GetxController {
  GetCategoriesUseCase categoriesUseCase;
  ResultsUseCase resultsUseCase;

  FilterController(
      {required this.categoriesUseCase, required this.resultsUseCase});

  CategoriesEntity categoriesEntity = CategoriesEntity(categoriesData: []);
  ResultsData resultsData=ResultsData(id: 0,
      bedroom: 0, image: '', livingRoom: 0, area: 0, bathroom: 0);

  bool isLoading = false;
  bool isLoadingResults = false;

  @override
  void onInit() {
    getCategories();
  }

  startLoading() {
    isLoading = true;
    update();
  }

  endLoading() {
    isLoading = false;
    update();
  }

  startLoadingResults() {
    isLoading = true;
    update();
  }

  endLoadingResults() {
    isLoading = false;
    update();
  }

  List<String> estateTypes = [
    AppTexts.house,
    AppTexts.apartment,
    AppTexts.building,
    AppTexts.villa,
    AppTexts.office,
    AppTexts.land,
    AppTexts.chalet
  ];

  List<String> cites = [
    AppTexts.house,
    AppTexts.apartment,
    AppTexts.building,
    AppTexts.villa,
    AppTexts.office,
    AppTexts.land,
    AppTexts.chalet
  ];
  String? selectedValue;
  String? selectedValue1;

  void changeValue(String value) {
    selectedValue = value as String;
    update();
  }

  final double min = 0;
  final double max = 100;
  SfRangeValues values1 = const SfRangeValues(40.0, 60.0);
  SfRangeValues values2 = const SfRangeValues(40.0, 60.0);
  SfRangeValues values3 = const SfRangeValues(40.0, 60.0);
  List<String> estateDetailes = [
    AppTexts.bedroom,
    AppTexts.bath,
    AppTexts.livingRoom,
    AppTexts.kitchen,
  ];
  static var count = 0.obs;
  static var count1 = 0.obs;
  static var count2 = 0.obs;
  static var count3 = 0.obs;
  static int selectedIndex = -1;

  List counts = [count, count1, count2, count3];
  List<Function> increments = [
    increment,
    increment1,
    increment2,
    increment3
  ];
  List<Function> decrements = [
    decrement,
    decrement1,
    decrement2,
    decrement3
  ];

  static void increment() {
    count++;
  }

  static void increment1() {
    count1++;
  }

  static void increment2() {
    count2++;
  }

  static void increment3() {
    count3++;
  }

  static void decrement() {
    if (count <= 0) {
      count == 0;
    }
    else
      count--;
  }

  static void decrement1() {
    if (count1 <= 0) {
      count == 0;
    }
    else
      count1--;
  }

  static void decrement2() {
    if (count2 <= 0) {
      count == 0;
    }
    else
      count2--;
  }

  static void decrement3() {
    if (count3 <= 0) {
      count == 0;
    }
    else
      count3--;
  }


  Future getCategories() async {
    startLoading();
    var response = await categoriesUseCase?.call();
    endLoading();
    print(response);
    response?.fold((l) {
      ConnectionFailure();
    }, (r) {
      categoriesEntity.categoriesData = r.categoriesData;
    });
    endLoading();
  }
  Future getResults(
  {
    required String category_id, required String price,
    required String area, required String bathroom,
    required String bedroom, required String agent_id,
}
      ) async {
    startLoadingResults();
    var response = await resultsUseCase.call(category_id, price, area, bathroom, bedroom, agent_id);
    endLoadingResults();
    print(response);
    response?.fold((l) {
      ConnectionFailure();
    }, (r) {
      resultsData=r;
      Get.toNamed(AppRoutes.getResultsRout());
    });
    endLoadingResults();
  }


}

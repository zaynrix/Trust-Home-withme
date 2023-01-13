
import 'package:dartz/dartz.dart';
import 'package:final_project/features/filter_feature/domain/entities/results_entity.dart';
import 'package:final_project/features/filter_feature/domain/repositories/categories_repository.dart';
import 'package:final_project/features/filter_feature/domain/repositories/results_repository.dart';

import '../../../../core/errors/fauilers.dart';

class ResultsUseCase {
  CategoriesRepository resultsRepository;
  ResultsUseCase({required this.resultsRepository});

  Future<Either<Failure,ResultsData>> call( String category_id, String price,
      String area, String bathroom,
      String bedroom, String agent_id,){
    return resultsRepository.getResults(category_id, price, area, bathroom, bedroom, agent_id);

  }
}
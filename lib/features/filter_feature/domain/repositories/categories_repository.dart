import 'package:dartz/dartz.dart';
import 'package:final_project/features/filter_feature/domain/entities/categories_entity.dart';

import '../../../../core/errors/fauilers.dart';
import '../entities/results_entity.dart';

abstract class CategoriesRepository{
  Future<Either<Failure,CategoriesEntity>> getCategories();
  Future<Either<Failure, ResultsData>> getResults(
      String category_id, String price,
      String area, String bathroom,
      String bedroom, String agent_id,


      );


}
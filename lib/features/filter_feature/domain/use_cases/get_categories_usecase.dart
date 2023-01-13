import 'package:dartz/dartz.dart';
import 'package:final_project/features/filter_feature/domain/entities/categories_entity.dart';
import 'package:final_project/features/filter_feature/domain/repositories/categories_repository.dart';

import '../../../../core/errors/fauilers.dart';

class GetCategoriesUseCase {

  late CategoriesRepository repository;

  GetCategoriesUseCase({required this.repository});

  Future<Either<Failure, CategoriesEntity>> call() async{
    return await repository.getCategories();
  }

}
import 'package:dartz/dartz.dart';

import '../../../../core/errors/fauilers.dart';
import '../entities/results_entity.dart';

abstract class ResultsRepository {
  Future<Either<Failure, ResultsEntity>> getResults(
    String category_id,
    String price,
    String area,
    String bathroom,
    String bedroom,
    String agent_id,
  );
}

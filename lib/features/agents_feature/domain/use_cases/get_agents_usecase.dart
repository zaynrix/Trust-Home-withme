import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/features/agents_feature/domain/entities/agents_entity.dart';
import 'package:final_project/features/agents_feature/domain/repositories/agents_repository.dart';

import '../../../../core/errors/fauilers.dart';
class GetAgentsUseCase {

  late AgentsRepository repository;

  GetAgentsUseCase({required this.repository});

  Future<Either<Failure, List<AgentsEntity>>> call() async{
    return await repository.getAgents();
  }

}

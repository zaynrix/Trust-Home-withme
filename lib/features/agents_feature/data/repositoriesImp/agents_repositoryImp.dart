import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/errors/fauilers.dart';
import 'package:final_project/features/agents_feature/data/datasources/agents_remote_data_source.dart';
import 'package:final_project/features/agents_feature/domain/entities/agents_entity.dart';

import '../../../../core/app_network/cache_helper.dart';
import '../../../../core/app_network/network_info.dart';
import '../../domain/repositories/agents_repository.dart';


class AgentsRepositoryImp implements AgentsRepository{
  final NetworkInfo networkInfo;
  AgentsRemoteDataSource agentsRemoteDataSource;

  AgentsRepositoryImp({
    required this.agentsRemoteDataSource,
    required this.networkInfo
});


  @override
  Future<Either<Failure, List<AgentsEntity>>> getAgents() async{
    if(await networkInfo.isConnected){
      try{
        final response=await agentsRemoteDataSource.getAgents();
        //SharedPrefs().cacheUsers(response);

        return Right(response);
      }on DioError{
        return Left(ServerFailure());
      }
    // }else{
    //   try {
    //     final localCategories = await SharedPrefs().cacheCategories() ;
    //     //usersLocalDataSource.getCachedUsers()
    //     return Right(localCategories);
    //   } on EmptyCacheException {
    //     return Left(EmptyCacheFailure());
    //   }
    // }
  }
throw ConnectionFailure();

}}
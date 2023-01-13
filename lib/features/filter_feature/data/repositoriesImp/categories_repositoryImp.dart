import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/features/filter_feature/data/datasources/categories_remote_data_source.dart';
import 'package:final_project/features/filter_feature/domain/entities/categories_entity.dart';
import 'package:final_project/features/filter_feature/domain/entities/results_entity.dart';
import 'package:final_project/features/filter_feature/domain/repositories/categories_repository.dart';
import '../../../../core/app_network/cache_helper.dart';
import '../../../../core/app_network/network_info.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/fauilers.dart';

class CategoriesRepositoryImp implements CategoriesRepository{
  final CategoriesRemoteDataSource categoriesRemoteDataSource;
  final NetworkInfo networkInfo;
  CategoriesRepositoryImp(
      {
        required this.categoriesRemoteDataSource,
        required this.networkInfo});

  @override
  Future<Either<Failure, CategoriesEntity>> getCategories()async {
    if(await networkInfo.isConnected){
      try{
        final response=await categoriesRemoteDataSource.getCategories();
        //SharedPrefs().cacheUsers(response);

        return Right(response);
      }on DioError{
        return Left(ServerFailure());
      }
    }else{
      try {
        final localCategories = await SharedPrefs().cacheCategories() ;
        //usersLocalDataSource.getCachedUsers()
        return Right(localCategories);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }


  }

  @override
  Future<Either<Failure, ResultsData>> getResults(String category_id, String price, String area, String bathroom, String bedroom, String agent_id) async{
    if (await networkInfo.isConnected) {
      try {
        final response = await categoriesRemoteDataSource.getResults(category_id: category_id, price: price, area: area, bathroom: bathroom, bedroom: bedroom, agent_id: agent_id);
      //  SharedPrefs().cacheLogin(response.user?.token??'');

        // authLocalDataSource.cacheLogin(response.token??'');


        return Right(response);
      } on DioError {
        return Left(ServerFailure());
      }
    }
    // else{
    //   try {
    //     final localLogin = await authLocalDataSource.getCachedLogin();
    //     return Right(localLogin);
    //   } on EmptyCacheException {
    //     return Left(EmptyCacheFailure());
    //   }
    //}

    return Left(ConnectionFailure());
  }




}
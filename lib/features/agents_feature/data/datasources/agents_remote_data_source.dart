import 'package:dio/dio.dart';
import 'package:final_project/features/agents_feature/data/models/agents_model.dart';

import '../../../../core/app_network/cache_helper.dart';
import '../../../../core/app_network/end_points.dart';
import '../../../../core/errors/exceptions.dart';

abstract class AgentsRemoteDataSource{
  Future <List<AgentsModel>> getAgents();


}
class AgentsRemoteImp implements AgentsRemoteDataSource {
  final Dio dio;
  AgentsRemoteImp({
    required this.dio
  });
  @override
  Future<List<AgentsModel>> getAgents()async {

    Response response=await dio.get(EndPoints.AGENTS,
        options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs().token}'
            }
        )
    );
    if(response.statusCode==200){
      List<AgentsModel> agents=[];
      List list=response.data as List;
      agents=list.map((e) => AgentsModel.fromJson(e)).toList();

      print(list);
      return agents;

    }else{
      throw ServerException();
    }

    throw ServerException();
  }
}
import 'package:final_project/features/agents_feature/data/datasources/agents_remote_data_source.dart';
import 'package:final_project/features/agents_feature/data/repositoriesImp/agents_repositoryImp.dart';
import 'package:final_project/features/agents_feature/domain/repositories/agents_repository.dart';
import 'package:final_project/features/agents_feature/domain/use_cases/get_agents_usecase.dart';
import 'package:final_project/features/agents_feature/presentation/controllers/agents_controller.dart';
import 'package:get/get.dart';

class AgentBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AgentsRemoteDataSource>(() => AgentsRemoteImp(dio: Get.find()));
    Get.lazyPut<AgentsRepository>(() => AgentsRepositoryImp(agentsRemoteDataSource: Get.find(), networkInfo: Get.find()));
    Get.lazyPut<GetAgentsUseCase>(() => GetAgentsUseCase(repository: Get.find()));
    Get.put<AgentsController>(AgentsController(agentsUseCase: Get.find()));
  }



}
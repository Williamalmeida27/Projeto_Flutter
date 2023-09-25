import 'package:my_app/model/back4app/tarefas_back4_app_model.dart';
import 'package:my_app/repositories/back4app_repository/custom_back4app_dio.dart';

class Back4AppRepository {
  var _customDio = CustomBack4AppDio();

  Back4AppRepository();

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidos) async {
    var url = "/Tarefas";
    if (naoConcluidos) {
      url = "$url?where={\"concluido\":false}";
    }
    var results = await _customDio.dio.get(url);
    return TarefasBack4AppModel.fromJson(results.data);
  }

  Future<void> criarTarefa(
      TarefaBack4AppModel tarefasBack4AppObjetcsModel) async {
    try {
      await _customDio.dio
          .post("/Tarefas", data: tarefasBack4AppObjetcsModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> atualizarTarefa(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _customDio.dio.put("/Tarefas/${tarefaBack4AppModel.objectId}",
          data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removerTarefa(String objectId) async {
    try {
      await _customDio.dio.delete("/Tarefas/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}

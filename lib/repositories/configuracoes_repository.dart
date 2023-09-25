import 'package:hive/hive.dart';

import '../model/configuracoes_model.dart';

class ConfiguracoesRepository {
  static late Box box;

  ConfiguracoesRepository._criar();

  static Future<ConfiguracoesRepository> carregar() async {
    if (Hive.isBoxOpen('Configuracoes')) {
      box = Hive.box('Configuracoes');
    } else {
      box = await Hive.openBox('Configuracoes');
    }
    return ConfiguracoesRepository._criar();
  }

  void salvar(ConfiguracoesModel configuracoesModel) {
    box.put("configuracoesModel", {
      'nomeUsuario': configuracoesModel.nomeUsuario,
      'alturaUsuario': configuracoesModel.alturaUsuario,
      'temaEscuro': configuracoesModel.temaEscuro,
      'receberNotificao': configuracoesModel.receberNotificao
    });
  }

  ConfiguracoesModel obterDados() {
    var configuracoes = box.get("configuracoesModel");
    if (configuracoes == null) {
      return ConfiguracoesModel.vazio();
    } else {
      return ConfiguracoesModel.comDados(
          configuracoes['nomeUsuario'],
          configuracoes['alturaUsuario'],
          configuracoes['temaEscuro'],
          configuracoes['receberNotificao']);
    }
  }
}

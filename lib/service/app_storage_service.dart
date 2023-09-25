import 'package:shared_preferences/shared_preferences.dart';

enum CHAVES {
  CHAVE_CONFI_NOME,
  CHAVE_CONFI_ALTURA,
  CHAVE_TEMA_ESCURO,
  CHAVE_RECEBER_NOTIF,
  CHAVE_DADOS_CADASTRAIS_NOME,
  CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO,
  CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_LINGUAGENS,
  CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_SALARIO,
  CHAVE_GERADOR_NUMERO,
  CHAVE_QUATIDADE_CLIQUES
}

class StorageService {
  Future<void> _setListString(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(chave, values);
  }

  Future<List<String>> _getListString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  Future<void> _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  Future<void> _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  Future<void> _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  Future<void> _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }

  //Metodos a ser chamado nas demais classes:
  Future<void> setGeradorDeNumeroAleatorio(int value) async {
    _setInt(CHAVES.CHAVE_GERADOR_NUMERO.toString(), value);
  }

  Future<int> getGeradorDeNumeroAleatorio() async {
    return _getInt(CHAVES.CHAVE_GERADOR_NUMERO.toString());
  }

  Future<void> setQuantidadeCliques(int value) async {
    _setInt(CHAVES.CHAVE_QUATIDADE_CLIQUES.toString(), value);
  }

  Future<int> getQuantidadeCliques() async {
    return _getInt(CHAVES.CHAVE_QUATIDADE_CLIQUES.toString());
  }

  Future<void> setCadastroSalarioEscolhido(double value) async {
    _setDouble(CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString(), value);
  }

  Future<double> getCadastroSalarioEscolhido() {
    return _getDouble(CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString());
  }

  Future<void> setCadastroTempoExperiencia(int value) async {
    _setInt(CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString(), value);
  }

  Future<int> getCadastroTempoExperiencia() {
    return _getInt(CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString());
  }

  Future<void> setCadastroLinguagensSelecionadas(List<String> values) async {
    _setListString(CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString(), values);
  }

  Future<List<String>> getCadastroLinguagensSelecionadas() async {
    return _getListString(CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString());
  }

  Future<void> setCadastroNivelExperiencia(String exp) async {
    _setString(CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString(), exp);
  }

  Future<String> getCadastroNivelExperiencia() async {
    return _getString(
        CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString());
  }

  Future<void> setCadastroDataNascimento(String altura) async {
    _setString(
        CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString(), altura);
  }

  Future<String> getCadastroDataNascimento() async {
    return _getString(CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString());
  }

  Future<void> setCadastroNomeUsuario(String nome) async {
    _setString(CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(), nome);
  }

  Future<String> getCadastroNomeUsuario() async {
    return _getString(CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString());
  }

  Future<void> setConfigNome(String nome) async {
    _setString(CHAVES.CHAVE_CONFI_NOME.toString(), nome);
  }

  Future<String> getConfigNome() async {
    return _getString(CHAVES.CHAVE_CONFI_NOME.toString());
  }

  Future<void> setCadastroAltura(double altura) async {
    _setDouble(CHAVES.CHAVE_CONFI_ALTURA.toString(), altura);
  }

  Future<double> getCadastroAltura() async {
    return _getDouble(CHAVES.CHAVE_CONFI_ALTURA.toString());
  }

  Future<void> setTemaEscuro(bool value) async {
    _setBool(CHAVES.CHAVE_TEMA_ESCURO.toString(), value);
  }

  Future<bool> getTemaEscuro() async {
    return _getBool(CHAVES.CHAVE_TEMA_ESCURO.toString());
  }

  Future<void> setReceberNotificao(bool value) async {
    _setBool(CHAVES.CHAVE_RECEBER_NOTIF.toString(), value);
  }

  Future<bool> getReceberNotificao() async {
    return _getBool(CHAVES.CHAVE_RECEBER_NOTIF.toString());
  }
}

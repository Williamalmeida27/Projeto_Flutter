class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _alturaUsuario = 0;
  bool _temaEscuro = false;
  bool _receberNotificao = false;

  ConfiguracoesModel.vazio() {
    _nomeUsuario;
    _alturaUsuario;
    _temaEscuro;
    _receberNotificao;
  }
  ConfiguracoesModel.comDados(this._nomeUsuario, this._alturaUsuario,
      this._temaEscuro, this._receberNotificao);

  void set nomeUsuario(String nome) {
    _nomeUsuario = nome;
  }

  String get nomeUsuario => _nomeUsuario;

  void set alturaUsuario(double altura) {
    _alturaUsuario = altura;
  }

  double get alturaUsuario => _alturaUsuario;

  void set temaEscuro(bool escolha) {
    _temaEscuro = escolha;
  }

  bool get temaEscuro => _temaEscuro;

  void set receberNotificao(bool escolha) {
    _receberNotificao = escolha;
  }

  bool get receberNotificao => _receberNotificao;
}

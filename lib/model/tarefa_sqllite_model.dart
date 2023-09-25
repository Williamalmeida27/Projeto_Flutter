class TarefaSQLiteModel {
  int _id = 0;
  String _descricao = "";
  bool _concluido = false;

  TarefaSQLiteModel(this._id, this._descricao, this._concluido);

  //Getters

  String get descricao => _descricao;

  int get id => _id;

  bool get concluido => _concluido;

  //Setters
  set id(int id) {
    _id = id;
  }

  set descricao(String descricao) {
    _descricao = descricao;
  }

  set concluido(bool concluido) {
    _concluido = concluido;
  }
}

import 'package:flutter/material.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  Tarefa(this._descricao, this._concluido);

  //Getters

  String get descricao => _descricao;

  String get id => _id;

  bool get concluido => _concluido;

  //Setters
  set descricao(String descricao) {
    _descricao = descricao;
  }

  set concluido(bool concluido) {
    _concluido = concluido;
  }
}

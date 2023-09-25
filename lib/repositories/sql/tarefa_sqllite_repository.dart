import 'package:my_app/model/tarefa_sqllite_model.dart';
import 'package:my_app/repositories/sql/sqllite_database.dart';

class TarefaSQLiteRepository {
  Future<List<TarefaSQLiteModel>> obterTarefas(bool apenasNaoConcluidos) async {
    List<TarefaSQLiteModel> tarefas = [];

    var db = await SQLiteDatabase().obterDataBase();
    var result = await db.rawQuery(apenasNaoConcluidos
        ? 'SELECT * FROM tarefas WHERE concluido = 0'
        : 'SELECT * FROM tarefas');
    for (var tarefa in result) {
      tarefas.add(TarefaSQLiteModel(int.parse(tarefa['id'].toString()),
          tarefa['descricao'].toString(), tarefa['concluido'] == 1));
    }
    return tarefas;
  }

  Future<void> salvar(TarefaSQLiteModel tarefaSQLiteModel) async {
    var db = await SQLiteDatabase().obterDataBase();
    await db.rawInsert(
        'INSERT INTO tarefas(descricao, concluido) VALUES( ?, ?)',
        [tarefaSQLiteModel.descricao, tarefaSQLiteModel.concluido]);
  }

  Future<void> atualizar(TarefaSQLiteModel tarefaSQLiteModel) async {
    var db = await SQLiteDatabase().obterDataBase();
    await db.rawInsert(
        'UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?', [
      tarefaSQLiteModel.descricao,
      tarefaSQLiteModel.concluido,
      tarefaSQLiteModel.id
    ]);
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDatabase().obterDataBase();
    await db.rawInsert('DELETE FROM tarefas WHERE id = ?', [id]);
  }
}
